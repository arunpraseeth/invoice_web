import 'package:flutter/material.dart';
import 'package:invoice_web/pdf_invoice_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int itemcount = 1;
  PdfInvoiceApi pdfInvoiceApi = PdfInvoiceApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: itemcount,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListTile(
                    leading: IconButton(
                      onPressed: () {
                        setState(() {
                          itemcount--;
                        });
                      },
                      icon: const Icon(
                        Icons.remove_circle,
                        size: 40,
                      ),
                    ),
                    title: TextFormField(),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          itemcount++;
                        });
                      },
                      icon: const Icon(
                        Icons.add_circle,
                        size: 40,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 8.0),
                child: Text(
                  'Generate Invoice',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              onPressed: () async {
                // generate pdf file
                final pdfFile = await pdfInvoiceApi.generate(
                  tableData: [
                    ["1", "hello", "2000"]
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

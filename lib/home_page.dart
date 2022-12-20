import 'package:flutter/material.dart';
import 'package:invoice_web/utils/constants.dart';
import 'package:invoice_web/pdf_invoice_api.dart';
import 'package:invoice_web/utils/custom_textfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int itemcount = 1;

  Set<List<dynamic>> bodySet = {};
  Set<String> descriptionSet = {};
  String? description;
  String? amount;
  PdfInvoiceApi pdfInvoiceApi = PdfInvoiceApi();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController website = TextEditingController();
  TextEditingController address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Invoice'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: heightPadding2),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: //Customer Name
                    Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "First Name*",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: textSize,
                            ),
                          ),
                          const SizedBox(height: heightPadding1),
                          SizedBox(
                            width: size.width * 0.3,
                            child: customTextField(
                              context: context,
                              controller: firstName,
                              hintText: "First Name",
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Second Name*",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: textSize,
                            ),
                          ),
                          const SizedBox(height: heightPadding1),
                          SizedBox(
                            width: size.width * 0.3,
                            child: customTextField(
                              context: context,
                              controller: lastName,
                              hintText: "Last Name",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: heightPadding2),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: //Customer Name
                    Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Mobile Number*",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: textSize,
                            ),
                          ),
                          const SizedBox(height: heightPadding1),
                          SizedBox(
                            width: size.width * 0.3,
                            child: customTextField(
                              context: context,
                              controller: mobileNumber,
                              hintText: "Mobile Number",
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Email",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: textSize,
                            ),
                          ),
                          const SizedBox(height: heightPadding1),
                          SizedBox(
                            width: size.width * 0.3,
                            child: customTextField(
                              context: context,
                              controller: email,
                              hintText: "Email",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: heightPadding2),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: //Customer Name
                    Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Website",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: textSize,
                            ),
                          ),
                          const SizedBox(height: heightPadding1),
                          SizedBox(
                            width: size.width * 0.3,
                            child: customTextField(
                              context: context,
                              controller: website,
                              hintText: "Website",
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Address",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: textSize,
                            ),
                          ),
                          const SizedBox(height: heightPadding1),
                          SizedBox(
                            width: size.width * 0.3,
                            child: customTextField(
                              context: context,
                              controller: address,
                              hintText: "Address",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: itemcount,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: heightPadding2),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2, right: 70),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                onPressed: () {
                                  if (description != null && amount != null) {
                                    descriptionSet.add(
                                        "${index + 1},${description!},${amount!}");
                                    setState(() {
                                      itemcount++;
                                    });
                                  }
                                },
                                icon: const Icon(
                                  Icons.add_circle,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2, right: 16),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                onPressed: () {
                                  if (itemcount != 1) {
                                    setState(() {
                                      itemcount--;
                                    });
                                  }
                                },
                                icon: const Icon(
                                  Icons.remove_circle,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 40,
                              left: 20,
                              right: 20,
                              bottom: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Description",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: textSize,
                                      ),
                                    ),
                                    const SizedBox(height: heightPadding1),
                                    SizedBox(
                                      width: size.width * 0.45,
                                      child: customTextField(
                                        context: context,
                                        hintText: "Description",
                                        onChanged: (String? value) {
                                          setState(() {
                                            description = value!;
                                          });
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Amount(CAD)",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: textSize,
                                      ),
                                    ),
                                    const SizedBox(height: heightPadding1),
                                    SizedBox(
                                      width: size.width * 0.15,
                                      child: customTextField(
                                        context: context,
                                        hintText: "Amount",
                                        onChanged: (String? value) {
                                          setState(() {
                                            amount = value!;
                                          });
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 10,
                    ),
                    child: Text(
                      'Generate Invoice',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: textSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  onPressed: () async {
                    descriptionSet.add("$itemcount,${description!},${amount!}");
                    print(descriptionSet.toList());
                    bodySet.add(descriptionSet.toList());
                    bodySet.s
                    print(bodySet.toList());
                    // ! generate pdf file
                    // if (description.text.isNotEmpty && amount.text.isNotEmpty) {
                    //   await pdfInvoiceApi.generate(
                    //     tableData: [
                    //       [
                    //         "1",
                    //         description.text.trim(),
                    //         amount.text.trim(),
                    //       ],
                    //       [
                    //         "1",
                    //         description.text.trim(),
                    //         amount.text.trim(),
                    //       ],
                    //     ],
                    //     customerName:
                    //         "${firstName.text.trim()} ${lastName.text.trim()}",
                    //     customerMobile: mobileNumber.text.trim(),
                    //     customerEmail: email.text.trim(),
                    //     customerWebsite: website.text.trim(),
                    //   );
                    // }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
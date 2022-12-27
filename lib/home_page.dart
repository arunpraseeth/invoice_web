import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invoice_web/utils/constants.dart';
import 'package:invoice_web/pdf_invoice_api.dart';
import 'package:invoice_web/utils/custom_textfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int itemCount = 0;
  final _key = GlobalKey<FormState>();
  List<List<dynamic>> tableData = [];
  List<TextEditingController> description = [TextEditingController()];
  List<TextEditingController> amount = [TextEditingController()];
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'Invoice',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.18),
          child: Form(
            key: _key,
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
                                validator: (value) {
                                  if (value!.length < 3) {
                                    return "Kindly enter customer first name";
                                  } else {
                                    return null;
                                  }
                                },
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
                                validator: (value) {
                                  if (value!.length < 3) {
                                    return "Kindly enter customer last name";
                                  } else {
                                    return null;
                                  }
                                },
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
                                maxLength: 10,
                                controller: mobileNumber,
                                hintText: "Mobile Number",
                                validator: (value) {
                                  if (value!.length < 3) {
                                    print(value);
                                    return "Kindly enter customer mobile number";
                                  } else {
                                    return null;
                                  }
                                },
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
                  itemCount: description.length,
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
                                    if (description[index].text.isNotEmpty &&
                                        amount[index].text.isNotEmpty) {
                                      setState(() {
                                        description
                                            .add(TextEditingController());
                                        amount.add(TextEditingController());
                                        itemCount = index;
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
                                    setState(() {
                                      if (index != 0) {
                                        description.removeAt(index);
                                        amount.removeAt(index);
                                        itemCount = index;
                                      }
                                    });
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          controller: description[index],
                                          validator: (value) {
                                            if (value!.length < 3) {
                                              return "Kindly enter description";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          controller: amount[index],
                                          validator: (value) {
                                            if (value!.length < 3) {
                                              return "Kindly enter amount";
                                            } else {
                                              return null;
                                            }
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
                      // ! generate pdf file
                      if (_key.currentState!.validate()) {
                        if (description.isNotEmpty && amount.isNotEmpty) {
                          for (int i = 0; i < description.length; i++) {
                            tableData.add(
                                [i + 1, description[i].text, amount[i].text]);
                          }

                          await pdfInvoiceApi.generate(
                            tableData: tableData,
                            customerName:
                                "${firstName.text.trim()} ${lastName.text.trim()}",
                            customerMobile: mobileNumber.text.trim(),
                            customerEmail: email.text.trim(),
                            customerWebsite: website.text.trim(),
                          );
                        }
                        tableData.clear();
                      }
                    },
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

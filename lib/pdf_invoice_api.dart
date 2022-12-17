import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'file_handle_api.dart';

class PdfInvoiceApi {
  Future generate({required List<List<dynamic>> tableData}) async {
    final pdf = pw.Document();

    // final iconImage = (await rootBundle.load('assets/icon.png')).buffer.asUint8List();

    final tableHeaders = [
      'S.No.',
      'Description',
      'Price',
    ];

    // final tableData = [
    //   [
    //     index,
    //     description,
    //     amount,
    //   ],
    // ];

    pdf.addPage(
      pw.MultiPage(
        // header: (context) {
        //   return pw.Text(
        //     'Flutter Approach',
        //     style: pw.TextStyle(
        //       fontWeight: pw.FontWeight.bold,
        //       fontSize: 15.0,
        //     ),
        //   );
        // },
        build: (context) {
          return [
            pw.Row(
              children: [
                // pw.Image(
                //   pw.MemoryImage(iconImage),
                //   height: 72,
                //   width: 72,
                // ),
                // pw.SizedBox(width: 1 * PdfPageFormat.mm),
                pw.Column(
                  mainAxisSize: pw.MainAxisSize.min,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'MENPO',
                      style: pw.TextStyle(
                        fontSize: 17.0,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(
                        children: [
                          pw.TextSpan(
                            text: 'Address: ',
                            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                          ),
                          const pw.TextSpan(
                              text:
                                  '1739 Stenson Boulevard,\nPeterborough, Ontario - K9K 2E8.'),
                        ],
                      ),
                    ),
                  ],
                ),
                pw.Spacer(),
                pw.Column(
                  mainAxisSize: pw.MainAxisSize.min,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.RichText(
                      text: pw.TextSpan(
                        children: [
                          pw.TextSpan(
                            text: 'Date: ',
                            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                          ),
                          pw.TextSpan(
                              text:
                                  "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}"),
                        ],
                      ),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(
                        children: [
                          pw.TextSpan(
                            text: 'Email: ',
                            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                          ),
                          const pw.TextSpan(text: 'menpoindia@gmail.com'),
                        ],
                      ),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(
                        children: [
                          pw.TextSpan(
                            text: 'Phone: ',
                            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                          ),
                          const pw.TextSpan(text: '+17827781331'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 1 * PdfPageFormat.mm),
            pw.Divider(),
            pw.SizedBox(height: 1 * PdfPageFormat.mm),
            pw.Text(
              'BILL TO:',
              style: const pw.TextStyle(
                fontSize: 16.0,
                // decoration: TextDecoration.underline,
              ),
            ),
            pw.SizedBox(height: 1 * PdfPageFormat.mm),
            pw.RichText(
              text: pw.TextSpan(
                children: [
                  pw.TextSpan(
                    text: 'Company Name: ',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                  const pw.TextSpan(text: "Rajee Gas"),
                ],
              ),
            ),
            pw.RichText(
              text: pw.TextSpan(
                children: [
                  pw.TextSpan(
                    text: 'Mobile: ',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                  const pw.TextSpan(text: "12345678900"),
                ],
              ),
            ),
            pw.RichText(
              text: pw.TextSpan(
                children: [
                  pw.TextSpan(
                    text: 'Email: ',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                  const pw.TextSpan(text: "rajeegas@gmail.com"),
                ],
              ),
            ),
            pw.RichText(
              text: pw.TextSpan(
                children: [
                  pw.TextSpan(
                    text: 'Website: ',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                  const pw.TextSpan(text: "rajeegas.com"),
                ],
              ),
            ),

            pw.SizedBox(height: 5 * PdfPageFormat.mm),

            ///
            /// PDF Table Create
            ///
            pw.Table.fromTextArray(
              headers: tableHeaders,
              data: tableData,
              border: null,
              headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              headerDecoration:
                  const pw.BoxDecoration(color: PdfColors.grey300),
              cellHeight: 30.0,
              cellAlignments: {
                0: pw.Alignment.centerLeft,
                1: pw.Alignment.center,
                2: pw.Alignment.centerRight,
              },
            ),
            pw.Divider(),
            pw.Container(
              alignment: pw.Alignment.centerRight,
              child: pw.Row(
                children: [
                  pw.Spacer(flex: 6),
                  pw.Expanded(
                    flex: 4,
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        // pw.Row(
                        //   children: [
                        //     pw.Expanded(
                        //       child: pw.Text(
                        //         'Total',
                        //         style: pw.TextStyle(
                        //           fontWeight: pw.widget.FontWeight.bold,
                        //         ),
                        //       ),
                        //     ),
                        //     pw.Text(
                        //       '\$ 464',
                        //       style: pw.TextStyle(
                        //         fontWeight: pw.widget.FontWeight.bold,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // pw.Row(
                        //   children: [
                        //     pw.Expanded(
                        //       child: pw.Text(
                        //         'Vat 19.5 %',
                        //         style: pw.TextStyle(
                        //           fontWeight: pw.widget.FontWeight.bold,
                        //         ),
                        //       ),
                        //     ),
                        //     pw.Text(
                        //       '\$ 90.48',
                        //       style: pw.TextStyle(
                        //         fontWeight: pw.widget.FontWeight.bold,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // pw.Divider(),
                        pw.Row(
                          children: [
                            pw.Expanded(
                              child: pw.Text(
                                'Total amount due',
                                style: pw.TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ),
                            pw.Text(
                              '\$ 554.48',
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        pw.SizedBox(height: 2 * PdfPageFormat.mm),
                        pw.Container(height: 1, color: PdfColors.grey400),
                        pw.SizedBox(height: 0.5 * PdfPageFormat.mm),
                        pw.Container(height: 1, color: PdfColors.grey400),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        footer: (context) {
          return pw.Column(
            mainAxisSize: pw.MainAxisSize.min,
            children: [
              pw.Divider(),
              pw.SizedBox(height: 2 * PdfPageFormat.mm),
              pw.Text(
                'Flutter Approach',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 1 * PdfPageFormat.mm),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'Address: ',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text(
                    'Merul Badda, Anandanagor, Dhaka 1212',
                  ),
                ],
              ),
              pw.SizedBox(height: 1 * PdfPageFormat.mm),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'Email: ',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text(
                    'flutterapproach@gmail.com',
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );

    return FileHandleApi.saveWebDocument(pdf: pdf);
  }
}

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'file_handle_api.dart';

class PdfInvoiceApi {
  int rawAmount = 0;
  int actualAmount = 0;
  Future generate({
    required List<List<dynamic>> tableData,
    required String? customerName,
    required String customerMobile,
    required String customerEmail,
    required String customerWebsite,
  }) async {
    // print(tableData);
    for (List<dynamic> element in tableData) {
      actualAmount += int.parse(element.last);
    }

    final pdf = pw.Document();

    // final iconImage = (await rootBundle.load('assets/icon.png')).buffer.asUint8List();

    final tableHeaders = [
      'S.No.',
      'Description',
      'Price',
    ];

    pdf.addPage(
      pw.MultiPage(
        header: (context) {
          return pw.Center(
            child: pw.Text(
              'MENPO',
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
                fontSize: 17,
              ),
            ),
          );
        },
        build: (context) {
          return [
            pw.SizedBox(height: 5 * PdfPageFormat.mm),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                // pw.Image(
                //   pw.MemoryImage(iconImage),
                //   height: 72,
                //   width: 72,
                // ),
                pw.Text(
                  'BILL TO:',
                  style: const pw.TextStyle(
                    fontSize: 14.0,
                    lineSpacing: 2,
                    //       pw.shadows: [
                    //   Shadow(
                    //       color: Colors.red,
                    //       offset: Offset(0, -5))
                    // ],
                    decoration: pw.TextDecoration.underline,
                  ),
                ),
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
              ],
            ),

            pw.SizedBox(height: 1 * PdfPageFormat.mm),
            pw.RichText(
              text: pw.TextSpan(
                children: [
                  pw.TextSpan(
                    text: 'Company Name: ',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                  pw.TextSpan(text: customerName),
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
                  pw.TextSpan(text: customerMobile),
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
                  pw.TextSpan(text: customerEmail),
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
                  pw.TextSpan(text: customerWebsite),
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
              // border: null,
              headerAlignment: pw.Alignment.topLeft,
              headerStyle: pw.TextStyle(
                color: PdfColors.white,
                fontWeight: pw.FontWeight.bold,
              ),
              headerDecoration: const pw.BoxDecoration(color: PdfColors.black),
              cellHeight: 30.0,
              cellAlignments: {
                0: pw.Alignment.centerLeft,
                1: pw.Alignment.center,
                2: pw.Alignment.centerRight,
              },
            ),
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
                              '\$ $actualAmount',
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
                'Menpo',
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
                    '1739 Stenson Boulevard, Peterborough, Ontario - K9K 2E8.',
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
                    'menpoindia@gmail.com',
                  ),
                ],
              ),
              pw.SizedBox(height: 1 * PdfPageFormat.mm),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'Phone: ',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text(
                    '+17827781331',
                  ),
                ],
              ),
              pw.SizedBox(height: 1 * PdfPageFormat.mm),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'Website: ',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text(
                    'www.menpo.in',
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
    rawAmount = 0;
    actualAmount = 0;
    tableData.clear();
    return FileHandleApi.saveWebDocument(pdf: pdf);
  }
}

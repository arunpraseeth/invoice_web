import 'dart:html' as html;
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;

class FileHandleApi {
  // running on the web!
  static saveWebDocument({required pw.Document pdf}) async {
    Uint8List bytes = await pdf.save();
    final blob = html.Blob([bytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement()
      ..href = url
      ..style.display = 'none'
      ..download = 'invoice(${DateTime.now().millisecondsSinceEpoch}).pdf';
    html.document.body?.children.add(anchor);
    anchor.click();
    html.document.body?.children.remove(anchor);
    html.Url.revokeObjectUrl(url);
  }
}

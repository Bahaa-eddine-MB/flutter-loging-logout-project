import 'dart:io';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../profil_page.dart';
import '../time_buttons.dart';

class PdfInvoiceApi {
  static Future<File> generate(Invoice invoice) async {
    final pdf = Document();
    final imageJpg =
        (await rootBundle.load('assets/images/Logo.png')).buffer.asUint8List();

    pdf.addPage(Page(
        pageFormat: PdfPageFormat.a6,
        build: (Context context) {
          return Column(children: [
            Image(
              MemoryImage(imageJpg),
              height: 50,
              width: 50,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 20),

            Table(columnWidths: {
                0: const FlexColumnWidth(1),
                1: const FlexColumnWidth(4),
              },
              border: const TableBorder(
                  top: BorderSide(color: PdfColors.blue, width: 1),
                  bottom: BorderSide(color: PdfColors.blue, width: 1)),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                    decoration: const BoxDecoration(color: PdfColors.grey200),
                    children: [
                      Container(
                          height: 40,
                          child: Row(children: [
                            Text('Name', style: const TextStyle(fontSize: 10)),
                          ])),
                      Container(
                        child: Text('Fellah Mohammed Nassim',
                            style: const TextStyle(fontSize: 10)),
                      )
                    ]),
                TableRow(children: [
                  Container(
                      height: 40,
                      child: Row(children: [
                        Text('email', style: const TextStyle(fontSize: 10)),
                      ])),
                  Container(
                    child: Text('nassim@gmail.com',
                        style: const TextStyle(fontSize: 10)),
                  )
                ]),
                TableRow(
                    decoration: const BoxDecoration(color: PdfColors.grey200),
                    children: [
                      Container(
                          height: 40,
                          child: Row(children: [
                            Text('phone', style: const TextStyle(fontSize: 10)),
                          ])),
                      Container(
                        child:
                            Text('065646593', style: const TextStyle(fontSize: 10)),
                      )
                    ])
              ],
            ),
            ///////////////////////doc
            Table(columnWidths: {
                0: const FlexColumnWidth(1),
                1: const FlexColumnWidth(4),
              },
              border: const TableBorder(
                  top: BorderSide(color: PdfColors.blue, width: 1),
                  bottom: BorderSide(color: PdfColors.blue, width: 1)),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(children: [
                  Container(
                      height: 40,
                      child: Row(children: [
                        Text('Doctor', style: const TextStyle(fontSize: 10)),
                      ])),
                  Container(
                    child:
                        Text('Zelmati Yassine', style: const TextStyle(fontSize: 10)),
                  )
                ]),
                TableRow(
                    decoration: const BoxDecoration(color: PdfColors.grey200),
                    children: [
                      Container(
                          height: 40,
                          child: Row(children: [
                            Text('email', style: const TextStyle(fontSize: 10)),
                          ])),
                      Container(
                        child: Text('Yassine@gmail.com',
                            style: const TextStyle(fontSize: 10)),
                      )
                    ]),
                TableRow(children: [
                  Container(
                      height: 40,
                      child: Row(children: [
                        Text('phone', style: const TextStyle(fontSize: 10)),
                      ])),
                  Container(
                    child: Text('0554786593', style: const TextStyle(fontSize: 10)),
                  )
                ])
              ],
            ),
            ////////////////////date

            Table(columnWidths: {
                0: const FlexColumnWidth(1),
                1: const FlexColumnWidth(4),
              },
              border: const TableBorder(
                  top: BorderSide(color: PdfColors.blue, width: 1),
                  bottom: BorderSide(color: PdfColors.blue, width: 1)),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                    decoration: const BoxDecoration(color: PdfColors.grey200),
                    children: [
                      Container(
                          height: 40,
                          child: Row(children: [
                            Text('Date', style: const TextStyle(fontSize: 10)),
                          ])),
                      Container(
                        child: Text(
                            dateConfrimBox(
                                DateTime.now().withTime(timeSlotToDateTime())),
                            style: const TextStyle(fontSize: 10)),
                      )
                    ]),
              ],
            )
          ]);
          
        }));

    return PdfApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf);
  }

  static Widget buildInvoice(Invoice invoice) {
    return Column(children: [
      Table(
        border: const TableBorder(
            top: BorderSide(color: PdfColors.blue, width: 1),
            bottom: BorderSide(color: PdfColors.blue, width: 1)),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
              decoration: const BoxDecoration(color: PdfColors.grey200),
              children: [
                Container(
                    height: 50,
                    child: Row(children: [
                      Text('Name', style: const TextStyle(fontSize: 10)),
                    ])),
                Container(
                  child: Text('Fellah Mohammed Nassim',
                      style: const TextStyle(fontSize: 10)),
                )
              ]),
          TableRow(children: [
            Container(
                height: 50,
                child: Row(children: [
                  Text('email', style: const TextStyle(fontSize: 10)),
                ])),
            Container(
              child: Text('nassim@gmail.com', style: const TextStyle(fontSize: 10)),
            )
          ]),
          TableRow(
              decoration: const BoxDecoration(color: PdfColors.grey200),
              children: [
                Container(
                    height: 50,
                    child: Row(children: [
                      Text('phone', style: const TextStyle(fontSize: 10)),
                    ])),
                Container(
                  child: Text('0778202192', style: const TextStyle(fontSize: 10)),
                )
              ])
        ],
      ),
      ///////////////////////doc
      Table(
        border: const TableBorder(
            top: BorderSide(color: PdfColors.blue, width: 1),
            bottom: BorderSide(color: PdfColors.blue, width: 1)),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(children: [
            Container(
                height: 50,
                child: Row(children: [
                  Text('Doctor', style: const TextStyle(fontSize: 10)),
                ])),
            Container(
              child: Text('Zelmati Yassine', style: const TextStyle(fontSize: 10)),
            )
          ]),
          TableRow(
              decoration: const BoxDecoration(color: PdfColors.grey200),
              children: [
                Container(
                    height: 50,
                    child: Row(children: [
                      Text('email', style: const TextStyle(fontSize: 10)),
                    ])),
                Container(
                  child:
                      Text('Yassine@gmail.com', style: const TextStyle(fontSize: 10)),
                )
              ]),
          TableRow(children: [
            Container(
                height: 50,
                child: Row(children: [
                  Text('phone', style: const TextStyle(fontSize: 10)),
                ])),
            Container(
              child: Text('0554786593', style: const TextStyle(fontSize: 10)),
            )
          ])
        ],
      ),
      ////////////////////date

      Table(
        border: const TableBorder(
            top: BorderSide(color: PdfColors.blue, width: 1),
            bottom: BorderSide(color: PdfColors.blue, width: 1)),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
              decoration: const BoxDecoration(color: PdfColors.grey200),
              children: [
                Container(
                    height: 50,
                    child: Row(children: [
                      Text('Date', style: const TextStyle(fontSize: 10)),
                    ])),
                Container(
                  child: Text(
                      dateConfrimBox(
                          DateTime.now().withTime(timeSlotToDateTime())),
                      style: const TextStyle(fontSize: 10)),
                )
              ]),
        ],
      )
    ]);
  }

  static Widget buildTitle(Invoice invoice) => Column(children: [
        Text("Innovice"),
      ]);

  static Widget buildHeader(Invoice invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text("DOCTEL"),
                height: 80,
                width: 80,
              ),
            ],
          ),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [],
          ),
        ],
      );
}

class PdfApi {
  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}

void invoice() async {
  final invoice = Invoice();
  final pdfFile = await PdfInvoiceApi.generate(invoice);
  PdfApi.openFile(pdfFile);
}

class Invoice {}

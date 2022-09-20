import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_php/api/api_page.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shimmer/shimmer.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class pdf extends StatefulWidget {
  const pdf({Key? key}) : super(key: key);

  @override
  State<pdf> createState() => _pdfState();
}

class _pdfState extends State<pdf> {
  var urllink =
      "https://mj09store.000webhostapp.com/register_or_not/Photo_upload/uploads/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student LoginDetail"),
      ),
      body: Container(
        child: Card(
          child: FutureBuilder(
            future: getAllpdf(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Shimmer.fromColors(
                    baseColor: HexColor('#E0E0E0'),
                    highlightColor: HexColor('#F5F5F5'),
                    child: ListView.builder(
                      itemBuilder: (_, __) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 48.0,
                              height: 48.0,
                              color: Colors.white,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: double.infinity,
                                    height: 8.0,
                                    color: Colors.white,
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 2.0),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 8.0,
                                    color: Colors.white,
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 2.0),
                                  ),
                                  Container(
                                    width: 40.0,
                                    height: 8.0,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      itemCount: 10,
                    ));
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => pdfviwer(
                                        url: urllink + snapshot.data[index].pdf,
                                      )));
                            },
                            icon: Icon(Icons.picture_as_pdf)),
                        title: Text(snapshot.data[index].pdf),
                      );
                    });
              }
            },
          ),
        ),
      ),
    );
  }
}

class pdfviwer extends StatefulWidget {
  final String url;

  const pdfviwer({super.key, required this.url});

  @override
  State<pdfviwer> createState() => _pdfviwerState();
}

class _pdfviwerState extends State<pdfviwer> {
  bool loading = true;
  late PDFDocument pdfDocument;
  loadPDf() async {
    pdfDocument = await PDFDocument.fromURL(widget.url);
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadPDf();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : PDFViewer(document: pdfDocument),
    );
  }
}

// FrostedBottomBar(
// opacity: 0.6,
// sigmaX: 5,
// bottomBarColor: Colors.red,
// sigmaY: 5,
// borderRadius: BorderRadius.circular(20),
// child: Row(children: [
// Container(
// height: 50,
// width: 300,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Container(
// child: IconButton(
// onPressed: () {},
// icon: Icon(Icons.confirmation_num_sharp)),
// ),
// Container(
// child: IconButton(
// onPressed: () {},
// icon: Icon(Icons.confirmation_num_sharp)),
// ),
// Container(
// child: IconButton(
// onPressed: () {},
// icon: Icon(Icons.confirmation_num_sharp)),
// ),
// ],
// ),
// )
// ]),
// body: (context, controller) => ListView.builder(
// controller: controller,
// itemBuilder: (context, index) {
// return const Card(child: Text("data"));
// },
// ),
// ),
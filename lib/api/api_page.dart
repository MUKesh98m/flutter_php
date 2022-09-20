import 'dart:convert';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter_php/api/data_con.dart';
import 'package:flutter_php/pdf.dart';
import 'package:http/http.dart' as http;

getadata() async {
  final response = await http.get(Uri.https(
      'mj09store.000webhostapp.com', 'flutter_php_connection/get.php'));
  var jsondata = jsonDecode(response.body);
  // print(jsondata);
  List<data_con> Data_cons = [];
  for (var api in jsondata) { 
    data_con Data_con =
        data_con(id: api['id'], name: api['name'], price: api['price']);
    Data_cons.add(Data_con);
  }
  // print(Data_cons.length);
  return Data_cons;
}

getadata1() async {
  final response = await http
      .get(Uri.https('mj09store.000webhostapp.com', 'register_or_not/get.php'));
  var jsondata = jsonDecode(response.body);
  // print(jsondata);
  List<insertdata> Data_cons = [];
  for (var api in jsondata) {
    insertdata Data_con = insertdata(
        id: api['id'], email: api['email'], password: api['password']);
    Data_cons.add(Data_con);
  }
  // print(Data_cons.length);
  return Data_cons;
}

Future getAllpdf() async {
  final response = await http.get(Uri.https(
      'mj09store.000webhostapp.com', '/register_or_not/Photo_upload/get.php'));

  var jsondata = jsonDecode(response.body);
  List<insertpdf> pdfviewer = [];
  for (var pdf in jsondata) {
    insertpdf PdfViewer1 = insertpdf(id: pdf['Id'], pdf: pdf['pdf']);
    pdfviewer.add(PdfViewer1);
  }
  print(jsondata.length);
  return pdfviewer;
}

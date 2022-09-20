import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:shimmer/shimmer.dart';

import 'api/api_page.dart';

class loginpagedetail extends StatefulWidget {
  const loginpagedetail({Key? key}) : super(key: key);

  @override
  State<loginpagedetail> createState() => _loginpagedetailState();
}

class _loginpagedetailState extends State<loginpagedetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student LoginDetail"),
      ),
      body: Container(
        child: Card(
          child: FutureBuilder(
            future: getadata1(),
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
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          DataTable(
                              dividerThickness: 2,
                              columns: [
                                DataColumn(
                                  label: Text("Id"),
                                ),
                                DataColumn(label: Text("Email")),
                                DataColumn(label: Text("Password")),
                              ],
                              rows:
                                  List.generate(snapshot.data.length, (index) {
                                var emp = snapshot.data![index];
                                return DataRow(cells: [
                                  DataCell(
                                    Text(emp.id.toString()),
                                  ),
                                  DataCell(
                                    Text(emp.email.toString()),
                                  ),
                                  DataCell(
                                    Text(emp.password.toString()),
                                  ),
                                ]);
                              }))
                        ],
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
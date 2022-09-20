import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shimmer/shimmer.dart';

import 'api/api_page.dart';
import 'drawer.dart';

class usercredential extends StatefulWidget {
  const usercredential({Key? key}) : super(key: key);

  @override
  State<usercredential> createState() => _usercredentialState();
}

class _usercredentialState extends State<usercredential> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer1(
        email: '',
      ),
      body: Container(
        child: Card(
          child: FutureBuilder(
            future: getadata(),
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
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        leading: CircleAvatar(
                          maxRadius: 25,
                          minRadius: 25,
                        ),
                        title: Text(snapshot.data[i].id),
                        subtitle: Text(snapshot.data[i].name),
                        trailing: Text(snapshot.data[i].price),
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
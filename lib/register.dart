import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_php/homepage.dart';
import 'package:flutter_php/loginpagedetail.dart';
import 'package:http/http.dart' as http;

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Future<void> insertdata() async {
    if (email.text != "" && password.text != "") {
      try {
        String uri =
            'https://mj09store.000webhostapp.com/register_or_not/login.php';
        var res = await http.post(Uri.parse(uri),
            body: {"email": email.text, "password": password.text});
        var response = jsonDecode(res.body);
        if (res.statusCode == 200) {
          print(res.statusCode);
        } else {
          print("error");
        }
      } catch (e) {
        print(e);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => loginpagedetail()));
      }
    } else {
      print("Please Fill the details");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('asset/reg.png', height: 150),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 300,
                child: Text(
                  " Registration Form",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.email, color: Colors.red),
                  contentPadding: EdgeInsets.only(left: 30),
                  hintText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: password,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.password_sharp, color: Colors.red),
                  contentPadding: EdgeInsets.only(left: 30),
                  hintText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 100,
                child:
                      ElevatedButton(
                          onPressed: () {
                            insertdata();
                          },
                          child: Text("Login")),



              ),
            ],
          ),
        ),
      ),
    );
  }
}
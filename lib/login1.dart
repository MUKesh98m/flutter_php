import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_php/api/data_con.dart';
import 'package:flutter_php/drawer.dart';
import 'package:flutter_php/forgot_password.dart';
import 'package:flutter_php/homepage.dart';
import 'package:flutter_php/loginpagedetail.dart';
import 'package:flutter_php/register.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class login1 extends StatefulWidget {
  const login1({Key? key}) : super(key: key);

  @override
  State<login1> createState() => _login1State();
}

class _login1State extends State<login1> {
    TextEditingController _email = TextEditingController();
    TextEditingController _password = TextEditingController();

  getemailvalue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? emailvalue = pref.getString("emailvalue1");
    return emailvalue;
  }

  setemailvalue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("emailvalue1", "_email");
  }

  void dispose() {
    _email.clear();
    _password.clear();
  }

  @override
  void initState() {
    super.initState();
    checkemailset();
  }

  checkemailset() async {
    String email1 = await getemailvalue() ?? 0;
    setState(() {
      _email = _email;
    });
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
              Image.asset('asset/login.png'),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 200,
                child: Text(
                  "Student Login",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _email,
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
                controller: _password,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.password_sharp,
                    color: Colors.red,
                  ),
                  contentPadding: EdgeInsets.only(left: 30),
                  hintText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                // width: 10,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.red),
                        ),
                        onPressed: () {
                          checklogin();
                          dispose();
                        },
                        child: Container(
                            alignment: Alignment.center,
                            width: 85,
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => forgot_password()));
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("don't have any account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => register()));
                    },
                    child: Text(
                      "Create new",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  checklogin() async {
    if (_email != "" && _password != "") {
      try {
        String url =
            "https://mj09store.000webhostapp.com/register_or_not/check_login.php";
        var response = await http.post(Uri.parse(url),
            body: {"email": _email.text, "password": _password.text});

        // var res = jsonDecode(response.body);
        print(response.toString());
        if (response.statusCode == 200) {
          print(response.statusCode);
          // print(json.decode(response.body));
          print(response.body);
          if (response.body == "Success") {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => homepage()));
          } else if (response.body == "Data not found") {
            // print("invalid credentials");
            Fluttertoast.showToast(msg: "invalid credentials");
          }
        } else {
          print(response.statusCode);
        }
      } catch (e) {
        var kk = e.toString();
        print(kk);

        // }
      }
    } else {
      print("by");
    }
  }
}
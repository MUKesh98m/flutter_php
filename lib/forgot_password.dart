import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class forgot_password extends StatefulWidget {
  const forgot_password({Key? key}) : super(key: key);

  @override
  State<forgot_password> createState() => _forgot_passwordState();
}

class _forgot_passwordState extends State<forgot_password> {
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('asset/forgot.png'),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 200,
                child: Text(
                  "Reset Password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
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
                          sendEmail(email: email.text);
                        },
                        child: Container(
                            alignment: Alignment.center,
                            width: 100,
                            child: Text(
                              "Send Mail",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future sendEmail({required String email}) async {
    var url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    final service_id = 'service_ulhew24';
    final template_id = 'template_i6f6myn';
    final user_id = '2n_DsMigCqX6W9H7e';
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'service_id': service_id,
        'template_id': template_id,
        'user_id': user_id,
        'template_params': {'user_email': email}
      }),
    );
    print(response.body);
  }
}

// Future MailFeedback({message, rating, date}) async {
//   // required  String email;
//   final service_id = 'service_ulhew24';
//   final template_id = 'template_i6f6myn';
//   final user_id = '2n_DsMigCqX6W9H7e';
//   var url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
//   try {
//     var response = await http.post(url,
//         headers: {
//           'origin': '<http://localhost>',
//           'Content-Type': 'application/json'
//         },
//         body: json.encode({
//           'service_id': service_id,
//           'template_id': template_id,
//           'user_id': user_id,
//           'template_params': {
//             'e'
//           }
//         }));
//     print('[FEED BACK RESPONSE]');
//     print(response.body);
//   } catch (error) {
//     print('[SEND FEEDBACK MAIL ERROR]');
//   }
// }
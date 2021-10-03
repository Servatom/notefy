import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Page"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Expanded(
                child: Column(
              children: [
                TextField(
                  controller: email,
                  decoration: InputDecoration(hintText: "Email"),
                ),
                TextField(
                  controller: name,
                  decoration: InputDecoration(hintText: "Name"),
                ),
                TextField(
                  controller: password,
                  decoration: InputDecoration(hintText: "Password"),
                ),
                ElevatedButton(
                    onPressed: () async {
                      final response = await http.post(
                        Uri.parse(
                            'https://notefyapi.servatom.com/api/users/register/'),
                        body: {
                          "email": email.text,
                          "name": name.text,
                          "password": password.text
                        },
                      );
                      if (response.statusCode == 200) {
                        print("Success");
                      } else {
                        print("failed");
                        print(response.reasonPhrase);
                      }
                    },
                    child: const Text("Submit"))
              ],
            )),
          ],
        ),
      ),
    );
  }
}

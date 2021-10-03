import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
              style: Theme.of(context).primaryTextTheme.bodyText1,
            ),
            TextField(
              controller: password,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              style: Theme.of(context).primaryTextTheme.bodyText1,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                final response = await http.post(
                    Uri.parse("https://notefyapi.servatom.com/api/auth/login/"),
                    body: {"email": email.text, "password": password.text});
                if (response.statusCode == 200) {
                  print("Success");
                } else {
                  print(response.reasonPhrase);
                }
              },
              child: const Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}

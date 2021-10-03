// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;

Future<String> loginUser(email, password) async {
  final response = await http.post(
      Uri.parse("https://notefyapi.servatom.com/api/auth/login/"),
      body: {"email": email, "password": password});
  if (response.statusCode == 200) {
    print("Success");
    print(response.body);
    return response.body;
  } else {
    print(response.reasonPhrase);
    return 'Error';
  }
}

Future<void> registerUser(email, name, password) async {
  final response = await http.post(
    Uri.parse('https://notefyapi.servatom.com/api/users/register/'),
    body: {"email": email, "name": name, "password": password},
  );
  if (response.statusCode == 200) {
    print("Success");
  } else {
    print("failed");
    print(response.reasonPhrase);
  }
}

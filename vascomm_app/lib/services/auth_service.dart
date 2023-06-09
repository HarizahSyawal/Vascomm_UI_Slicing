import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class AuthService {
  String baseUrl = 'https://reqres.in/api';

  Future<UserModel> login({
    String email,
    String password,
  }) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse('$url'),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['data']);
      user.token = data['access_token'];

      return user;
    } else {
      throw Exception('Missing password');
    }
  }
}

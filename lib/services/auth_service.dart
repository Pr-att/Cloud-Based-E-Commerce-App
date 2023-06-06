import 'dart:convert';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/private.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/user_provider.dart';

class AuthService {
  void signUpUser(
      {required String name,
      required BuildContext context,
      required String password,
      required String email}) async {
    try {
      User user = User(
          id: '',
          name: name,
          password: password,
          address: '',
          type: '',
          token: '',
          email: email);

      //We convert the String url to type URI because http only accepts URI Type and not string.
      http.Response res = await http.post(Uri.parse("$uri/api/signUp"),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, "Account created successfully");
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser(
      {required BuildContext context,
      required String password,
      required String email}) async {
    try {
      //We convert the String url to type URI because http only accepts URI Type and not string.
      http.Response res = await http.post(Uri.parse("$uri/api/signin"),
          body: jsonEncode({
            "email": email,
            "password": password,
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await prefs.setString(
              'x-auth-token',
              jsonDecode(res.body)['token'],
            );
            Navigator.pushNamedAndRemoveUntil(
                context, HomeScreen.routeName, (route) => false);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void getUserData(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) await prefs.setString('x-auth-token', '');

      var tokenRes = await http
          .post(Uri.parse('$uri/tokenIsValid'), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': token!,
      });

      var response = jsonDecode(tokenRes.body);
      if (response == true) {
        http.Response userRes = await http.get(Uri.parse('$uri/'), headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token,
        });

        Provider.of<UserProvider>(context, listen: false).setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}

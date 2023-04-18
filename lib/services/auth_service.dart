import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/private.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthService {
  void signUpUser({
      required String name,
      required BuildContext context,
      required String password,
      required String email
  }) async {
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
      httpErrorHandle(response: res, context: context, onSuccess: () {
        showSnackBar(context, "Account created successfully");
      });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}

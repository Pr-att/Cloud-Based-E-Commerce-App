import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../constants/constants.dart';

enum Auth {
  signIn,
  signUp,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth =
      Auth.signUp; // default value is signUp. It is a enum value of Auth enum.
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.greyBackgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ListTile(
                  tileColor: _auth == Auth.signUp ? Constants.backgroundColor : Constants.greyBackgroundColor,
                  title: const Text(
                    "Sign up securely to your account",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  leading: Radio(
                      value: Auth.signUp,
                      activeColor: Constants.secondaryColor,
                      groupValue: _auth,
                      onChanged: (Auth? value) {
                        setState(() {
                          _auth = value!;
                        });
                      }),
                ),
                if (_auth == Auth.signUp)
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Constants.backgroundColor,
                    child: Form(
                      key: _signUpFormKey,
                      child: Column(children: [
                        CustomTextField(
                            controller: _nameController, hintText: 'Name'),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Password',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                          text: '',
                          onTap: () {},
                        ),
                      ]),
                    ),
                  ),
                ListTile(
                  tileColor: _auth == Auth.signIn ? Constants.backgroundColor : Constants.greyBackgroundColor,
                  title: const Text(
                    "Sign in.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  leading: Radio(
                      value: Auth.signIn,
                      activeColor: Constants.secondaryColor,
                      groupValue: _auth,
                      onChanged: (Auth? value) {
                        setState(() {
                          _auth = value!;
                        });
                      }),
                ),
                if (_auth == Auth.signIn)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Constants.backgroundColor,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(children: [
                      CustomTextField(
                        controller: _emailController,
                        hintText: 'Email',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: 'Password',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        text: '',
                        onTap: () {},
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

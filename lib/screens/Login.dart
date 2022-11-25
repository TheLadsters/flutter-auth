import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intro_to_flutter/screens/Dashboard.dart';
import 'package:intro_to_flutter/screens/Signup.dart';
import 'package:intro_to_flutter/services/AuthService.dart';
import 'package:intro_to_flutter/widgets/CustomButton.dart';
import 'package:intro_to_flutter/widgets/PasswordField.dart';
import '../widgets/CustomTextField.dart';

class Login extends StatefulWidget {
  static String routeName = "/login";
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthService _authService = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      child: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: width * 0.9,
              child: Column(
                children: [
                  CustomTextField(
                      labelText: "Email Address",
                      hintText: "Enter your email address",
                      controller: emailController,
                      textInputType: TextInputType.emailAddress),
                  const SizedBox(
                    height: 20.0,
                  ),
                  PasswordField(
                      obscureText: obscurePassword,
                      onTap: handleObscurePassword,
                      labelText: "Password",
                      hintText: "Enter your Password",
                      controller: passwordController),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomButton(
                      text: "Login",
                      iconData: Icons.login,
                      onPress: () {
                        // Navigator.pushReplacementNamed(
                        //     context, Dashboard.routeName);
                        loginWithProvider();
                      }),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, SignUp.routeName);
                        },
                        child: const Text(
                          "Don't have an account? Click here to Sign Up.",
                          style: TextStyle(fontSize: 15.0, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  handleObscurePassword() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  loginWithProvider() async {
    try {
      var user = await _authService.signInWithGoogle();
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, Dashboard.routeName);
    } catch (e) {}
  }
}

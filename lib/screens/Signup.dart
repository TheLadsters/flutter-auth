import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:intro_to_flutter/screens/Login.dart';
import '../widgets/CustomButton.dart';
import '../widgets/CustomTextField.dart';
import '../widgets/PasswordField.dart';
import '../widgets/SignUpButton.dart';

class SignUp extends StatefulWidget {
  static String routeName = "/signup";
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
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
                    const Text(
                      "Sign Up to Create an Account",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                        labelText: "First Name",
                        hintText: "Enter your First Name",
                        controller: firstNameController,
                        textInputType: TextInputType.name),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                        labelText: "Last Name",
                        hintText: "Enter your Last Name",
                        controller: lastNameController,
                        textInputType: TextInputType.name),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                        labelText: "Email Address",
                        hintText: "Enter your Email Address",
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
                    PasswordField(
                        obscureText: obscureConfirmPassword,
                        onTap: handleObscurePassword,
                        labelText: "Confirm Password",
                        hintText: "Please re-enter your Password",
                        controller: confirmPasswordController),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SignUpButton(
                        text: "Sign Up",
                        iconData: Icons.fact_check,
                        onPress: () {
                          Navigator.pushReplacementNamed(
                              context, Login.routeName);
                        }),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomButton(
                        text: "Log In",
                        iconData: Icons.login,
                        onPress: () {
                          Navigator.pushReplacementNamed(
                              context, Login.routeName);
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  handleObscurePassword() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }
}

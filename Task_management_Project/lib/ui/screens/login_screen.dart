import 'package:assignment/ui/screens/main_bottom_nav_screen.dart';
import 'package:assignment/ui/screens/register_screen.dart';
import 'package:assignment/ui/widgets/screen_background.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'forget_password_verify_email_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenBackground(
            child: Padding(
      padding: const EdgeInsets.all(32.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 200,
            ),
            Text("Get Started With",
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(
              height: 24,
            ),
            TextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              controller: _emailTEController,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passwordTEController,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: _onTapSubmitButton,
              child: Icon(
                Icons.arrow_circle_right_outlined,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Center(
              child: Column(
                children: [
                  TextButton(
                      onPressed: _onTapForgetPasswordButton,
                      child: Text("Forget Password?")),
                  RichText(
                      text: TextSpan(
                    style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                    children: [
                      const TextSpan(text: "Don't have account? "),
                      TextSpan(
                        text: "Sign Up",
                        style: const TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = _onTapSignUpButton,
                      )
                    ],
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    )));
  }

  void _onTapSubmitButton(){
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => MainBottomNavScreen(),
      ),
        (predicate) => false,
    );
  }

  void _onTapForgetPasswordButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ForgetPasswordVerifyEmailScreen(),
      ),
    );
  }

  void _onTapSignUpButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}

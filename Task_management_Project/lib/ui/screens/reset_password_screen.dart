import 'package:assignment/ui/widgets/screen_background.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passTEController = TextEditingController();
  final TextEditingController _confirmPassTEController = TextEditingController();
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
                    Text("Set Password",
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(
                      height: 6,
                    ),
                    Text("Minimum, length password 8 characters with letter and number combined",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey,
                        )),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _passTEController,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _confirmPassTEController,
                      decoration: const InputDecoration(
                        hintText: 'Confirm Password',
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                        onPressed: _onTapSubmitButton,
                        child: Text("Confirm", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Center(
                      child: Column(
                        children: [
                          RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                                children: [
                                  const TextSpan(text: "Have account? "),
                                  TextSpan(
                                    text: "Sign In",
                                    style: const TextStyle(
                                        color: Colors.green, fontWeight: FontWeight.bold),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = _onTapSignInButton,
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
            builder: (context) =>const LoginScreen()),
            (pre) => false
    );
  }

  void _onTapSignInButton() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) =>const LoginScreen()),
            (pre) => false
    );
  }

  @override
  void dispose() {
    _passTEController.dispose();
    _confirmPassTEController.dispose();
    super.dispose();
  }
}

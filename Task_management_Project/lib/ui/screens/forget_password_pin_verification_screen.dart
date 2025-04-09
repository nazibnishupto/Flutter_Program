import 'package:assignment/ui/widgets/screen_background.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'login_screen.dart';

class ForgetPasswordPinVerificationScreen extends StatefulWidget {
  const ForgetPasswordPinVerificationScreen({super.key});

  @override
  State<ForgetPasswordPinVerificationScreen> createState() => _ForgetPasswordPinVerificationScreenState();
}

class _ForgetPasswordPinVerificationScreenState extends State<ForgetPasswordPinVerificationScreen> {
  final TextEditingController _pinCodeTEController = TextEditingController();
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
                    Text("Pin Verification",
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(
                      height: 6,
                    ),
                    Text("A 6 digit verification pin will send to your email address",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey,
                        )),
                    const SizedBox(
                      height: 24,
                    ),
                    PinCodeTextField(
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor: Colors.white,
                        selectedFillColor:Colors.white,
                        inactiveFillColor: Colors.white,
                      ),
                      animationDuration: Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,
                      controller: _pinCodeTEController,
                      appContext: context,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: _onTapSubmitButton,
                      child: Text("Verify", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)
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

  void _onTapSubmitButton(){}

  void _onTapForgetPasswordButton() {}

  void _onTapSignInButton() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen()),
          (pre) => false
    );
  }

  @override
  void dispose() {
    _pinCodeTEController.dispose();
    super.dispose();
  }
}

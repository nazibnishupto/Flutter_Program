import 'package:assignment/ui/screens/main_bottom_nav_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:assignment/ui/screens/register_screen.dart';
import 'package:assignment/ui/widgets/screen_background.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../data/models/login_model.dart';
import '../../data/service/network_client.dart';
import '../../data/utils/urls.dart';
import '../controllers/auth_controller.dart';
import '../widgets/centered_circular_progress_indicator.dart';
import '../widgets/snack_bar_message.dart';

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

  bool _obscureText = true;

  bool _loginInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenBackground(
            child: SingleChildScrollView(
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
                validator: (String? value) {
                  String email = value?.trim() ?? '';
                  if (EmailValidator.validate(email) == false) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: _obscureText,
                controller: _passwordTEController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? value) {
                  if ((value?.isEmpty ?? true) || (value!.length < 6)) {
                    return 'Enter your password more than 6 letters' ;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
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
      ),
    )));
  }

  void _onTapSubmitButton() {
    if (_formKey.currentState!.validate()) {
      _loginUser();
    }
  }

  Future<void> _loginUser() async{
    _loginInProgress = true;
    setState(() {});
    Map<String, dynamic> requestBody = {
      "email": _emailTEController.text.trim(),
      "password": _passwordTEController.text
    };
    NetworkResponse response = await NetworkClient.postRequest(
      url: Urls.loginUrl,
      body: requestBody,
    );
    _loginInProgress = false;
    setState(() {});
    if (response.isSuccess) {
      LoginModel loginModel = LoginModel.fromJson(response.data!);
      AuthController.saveUserInformation(loginModel.token, loginModel.userModel);

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => MainBottomNavScreen(),
        ),
            (predicate) => false,
      );
    } else {
      showSnackBarMessage(context, response.errorMessage, true);
    }
  }

  void _clearTextFields() {
    _emailTEController.clear();
    _passwordTEController.clear();
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

import 'package:assignment/ui/screens/login_screen.dart';
import 'package:assignment/ui/widgets/screen_background.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              Text("Join With Us",
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
                textInputAction: TextInputAction.next,
                controller: _firstNameTEController,
                decoration: const InputDecoration(
                  hintText: 'First Name',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: _lastNameTEController,
                decoration: const InputDecoration(
                  hintText: 'Last Name',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                controller: _mobileTEController,
                decoration: const InputDecoration(
                  hintText: 'Mobile',
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
                onPressed: _onTapSubmitInButton,
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
      ),
    )));
  }

  void _onTapSubmitInButton(){

  }

  void _onTapSignInButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}

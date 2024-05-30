import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_workshop/constants/color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class SignUp2Page extends StatefulWidget {
  const SignUp2Page({Key? key}) : super(key: key);

  @override
  State<SignUp2Page> createState() => _Signup2PageState();
}

class _Signup2PageState extends State<SignUp2Page> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _compasswordController = TextEditingController();
  String? _errorMessage;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _compasswordController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _signup() async {
    print('Sign Up');
    if (_formKey.currentState!.validate()) {
      setState(() {
        _errorMessage = null;
      });
      await Future.delayed(Duration(seconds: 2));
      context.router.replaceNamed('/signinv2');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 150.0,
                  maxHeight: 150.0,
                ),
                child: Image.asset('assets/logo.png'),
              ),
              Text(
                AppLocalizations.of(context)!.signup,
                style: TextStyle(fontSize: 20, color: FontblackColor),
              ),
              SizedBox(height: 10),
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 80.0,
                        child: Container(
                          child: TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context)!.name,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)!.pls_name;
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 80.0,
                        child: Container(
                          child: TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context)!.email,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)!.pls_email;
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 80.0,
                        child: Container(
                          child: TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context)!.user,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)!.pls_user;
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 80.0,
                        child: Container(
                          child: TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context)!.password,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)!.pls_pass;
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 80.0,
                        child: Container(
                          child: TextFormField(
                            controller: _compasswordController,
                            decoration: InputDecoration(
                              labelText:
                                  AppLocalizations.of(context)!.compassword,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)!.pls_pass;
                              } else if (value != _passwordController.text) {
                                return AppLocalizations.of(context)!.unmatch;
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: _signup,
                style: ElevatedButton.styleFrom(
                  backgroundColor: PrimaryColor,
                  minimumSize: Size(double.infinity, 55), // Set button height
                ),
                child: Text(
                  AppLocalizations.of(context)!.signup,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: FontColor, fontSize: 20.0),
                ),
              ),
              const SizedBox(height: 15.0),
              GestureDetector(
                onTap: () {
                  print('click Sign In!');
                  context.router.replaceNamed('/signinv2');
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: AppLocalizations.of(context)!.have_acc,
                          style: TextStyle(fontSize: 17)),
                      TextSpan(
                        text: AppLocalizations.of(context)!.signin,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: FontInUp),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

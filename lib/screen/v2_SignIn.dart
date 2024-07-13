import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop/constants/color.dart';
import 'package:flutter_workshop/l10n/language.dart';
import 'package:flutter_workshop/l10n/language2.dart';
import 'package:flutter_workshop/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_workshop/router/routes.gr.dart';

@RoutePage()
class Login2Page extends StatefulWidget {
  const Login2Page({Key? key}) : super(key: key);
  @override
  State<Login2Page> createState() => _LoginPageState();
}

class _LoginPageState extends State<Login2Page> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorMessage;
  bool isSelected = false;

  Language? _selectedLanguage;
  bool _isLoggingIn = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void itemSwitch(bool value) {
    setState(() {
      isSelected = !isSelected;
    });
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return AppLocalizations.of(context)!.pls_pass;
    }
    return null;
  }

  void _login() async {
    print('Sign In');
    if (_isLoggingIn) return;

    setState(() {
      _isLoggingIn = true;
      _errorMessage = null;
    });

    if (_formKey.currentState!.validate()) {
      if (_usernameController.text == 'admin' &&
          _passwordController.text == '1234') {
        await Future.delayed(Duration(seconds: 5));
        context.router.push(HomeDeviceRoute(countDevice: 1));
      } else if (_usernameController.text == 'user' &&
          _passwordController.text == '1234') {
        await Future.delayed(Duration(seconds: 5));
        context.router.push(HomeDeviceRoute(countDevice: 0));
      } else {
        setState(() {
          _errorMessage = 'Invalid username or password';
        });
      }
    }

    setState(() {
      _isLoggingIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: DropdownButton<Language>(
                    underline: const SizedBox(height: 0.0),
                    onChanged: (Language? language) async {
                      if (language != null) {
                        Locale _locale = await setLocale(language.languageCode);
                        MyApp.setLocale(context, _locale);
                        setState(() {
                          _selectedLanguage = language;
                        });
                      }
                    },
                    items: Language.languageList()
                        .map<DropdownMenuItem<Language>>((language) {
                      return DropdownMenuItem<Language>(
                        value: language,
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              'assets/${language.languageCode}.jpg',
                              width: 24,
                              height: 24,
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    hint: Row(
                      children: [
                        if (_selectedLanguage == null)
                          Image.asset(
                            'assets/en.jpg',
                            width: 24,
                            height: 24,
                          ),
                        if (_selectedLanguage != null)
                          Image.asset(
                            'assets/${_selectedLanguage!.languageCode}.jpg',
                            width: 24,
                            height: 24,
                          ),
                      ],
                    ),
                    icon: const Icon(Icons.arrow_drop_down),
                  ),
                ),
              ),
              Center(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          constraints: const BoxConstraints(
                            maxWidth: 200.0,
                            maxHeight: 240.0,
                          ),
                          child: Image.asset('assets/logo.png'),
                        ),
                        SizedBox(
                          height: 80.0,
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
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 80.0,
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context)!.password,
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
                        const SizedBox(height: 5.0),
                        SizedBox(
                          height: 80.0,
                          child: Stack(
                            children: [
                              ElevatedButton(
                                onPressed: _isLoggingIn ? null : _login,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: PrimaryColor,
                                  minimumSize: const Size(double.infinity, 55),
                                ),
                                child: _isLoggingIn
                                    ? const SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  PrimaryColor),
                                        ),
                                      )
                                    : Text(
                                        AppLocalizations.of(context)!.signin,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: FontColor,
                                          fontSize: 18.0,
                                        ),
                                      ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: _errorMessage != null
                                    ? Container(
                                        child: Text(
                                          _errorMessage!,
                                          style:
                                              const TextStyle(color: RedColor),
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 1.5,
                                color: FontblackColor,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(
                                AppLocalizations.of(context)!.or,
                                style: TextStyle(
                                    color: FontblackColor, fontSize: 17),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 1.5,
                                color: FontblackColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        GestureDetector(
                          onTap: () {
                            print('click Sign Up!');
                            context.router.pushNamed('/signupv2');
                          },
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: AppLocalizations.of(context)!.not_acc,
                                  style:
                                      TextStyle(fontSize: 17, color: FontColor),
                                ),
                                TextSpan(
                                  text: AppLocalizations.of(context)!.signup,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: FontInUp,
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 48.0),
                      ],
                    ),
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

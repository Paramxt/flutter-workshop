import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_workshop/constants/color.dart';
import 'package:flutter_workshop/l10n/language.dart';
import 'package:flutter_workshop/l10n/language2.dart';
import 'package:flutter_workshop/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_workshop/router/routes.gr.dart';
import 'package:flutter_workshop/constants/variable.dart';

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
  bool _isOpen = false;
  String _selectedLanguage = "en";
  bool _isLoggingIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  _initLanguage() async {

    getLocale().then((locale) {
      setState(() {
        _selectedLanguage = locale.languageCode;
      });
    });

  }

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
    if (value == null || value.isEmpty) {
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
      int countDevice;
      if (_usernameController.text == 'admin' &&
          _passwordController.text == '1234') {
        countDevice = count_device_admin;
        await Future.delayed(Duration(seconds: 5));
        context.router.replace(HomeDeviceRoute(countDevice: countDevice));
      } else if (_usernameController.text == 'user' &&
          _passwordController.text == '1234') {
        countDevice = count_device_user;
        await Future.delayed(Duration(seconds: 5));
        context.router.replace(HomeDeviceRoute(countDevice: countDevice));
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
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            // flex: 3,
            child: Center(
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
                      Text(
                        AppLocalizations.of(context)!.signin,
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
                                    controller: _usernameController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText:
                                          AppLocalizations.of(context)!.user,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return AppLocalizations.of(context)!
                                            .pls_user;
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
                      SizedBox(height: 5),
                      Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 80.0,
                                child: Container(
                                  height: 60.0,
                                  child: TextFormField(
                                    controller: _passwordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: AppLocalizations.of(context)!
                                          .password,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return AppLocalizations.of(context)!
                                            .pls_user;
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
                      const SizedBox(height: 5.0),
                      Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 80,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 55,
                                      child: ElevatedButton(
                                        onPressed: _isLoggingIn ? null : _login,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: PrimaryColor,
                                          minimumSize:
                                              Size(double.infinity, 55),
                                        ),
                                        child: _isLoggingIn
                                            ? SizedBox(
                                                width: 20,
                                                height: 20,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(PrimaryColor),
                                                ),
                                              )
                                            : Text(
                                                AppLocalizations.of(context)!
                                                    .signin,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: FontColor,
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: _errorMessage != null
                                          ? Container(
                                              child: Text(
                                                _errorMessage!,
                                                style: const TextStyle(
                                                    color: RedColor),
                                              ),
                                            )
                                          : SizedBox(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Center the content
                        children: [
                          Spacer(),
                          Expanded(
                            flex: 10,
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
                          SizedBox(height: 25),
                          Expanded(
                            flex: 10,
                            child: Divider(
                              thickness: 1.5,
                              color: FontblackColor,
                            ),
                          ),
                          Spacer(),
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
                                  style: TextStyle(fontSize: 17)),
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
                      // const SizedBox(height: 48.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 2,
            right: 2,
            child: Container(
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 25),
                  child: DropdownButton(
                    value: _selectedLanguage,
                    // value: Language(1, "English", "en"),
                    onChanged: (String? language) async {
                      if (language != null) {
                        Locale _locale = await setLocale(language);
                        MyApp.setLocale(context, _locale);
                        setState(() {
                          _selectedLanguage = language;
                        });
                      }
                    },
                    items: [
                      DropdownMenuItem<String>(
                        value: "en",
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              "EN",
                              style: const TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      DropdownMenuItem<String>(
                        value: "th",
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              "TH",
                              style: const TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      )
                    ],
                    hint: Text(
                      _selectedLanguage != ""
                          ? _selectedLanguage
                          : 'Select Language',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop/constants/color.dart';
import 'package:flutter_workshop/l10n/language.dart';
import 'package:flutter_workshop/l10n/language2.dart';
import 'package:flutter_workshop/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_workshop/screen/list_machine.dart';
import 'package:toggle_switch/toggle_switch.dart';

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

  @override
  Widget build(BuildContext context) {
    final _Heightbox = 60.0;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text(
          " " + AppLocalizations.of(context)!.signin,
          style: TextStyle(
            fontSize: 40,
            color: FontColor2,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 35),
            child: DropdownButton<Language>(
              underline: const SizedBox(),
              icon: const Icon(
                Icons.language,
                color: FontColor2,
              ),
              onChanged: (Language? language) async {
                if (language != null) {
                  Locale _locale = await setLocale(language.languageCode);
                  MyApp.setLocale(context, _locale);
                }
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            e.name,
                            style: const TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 500.0,
                  maxHeight: 500.0,
                ),
                child: Image.asset('assets/logo.png'),
              ),
              SizedBox(height: 10),
              TextFormField(
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
              const SizedBox(height: 20.0),
              TextFormField(
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
                    return AppLocalizations.of(context)!.pls_pass;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: PrimaryColor,
                  minimumSize: Size(double.infinity, _Heightbox),
                ),
                child: Text(
                  AppLocalizations.of(context)!.signin,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: FontColor,
                    fontSize: 18.0,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: const TextStyle(color: ErrorColor),
                ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the content
                children: [
                  Spacer(),
                  Expanded(
                    flex: 10,
                    child: Divider(
                      thickness: 1.5,
                      color: FontColor2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      'OR',
                      style: TextStyle(color: FontColor2, fontSize: 17),
                    ),
                  ),
                  SizedBox(height: 25),
                  Expanded(
                    flex: 10,
                    child: Divider(
                      thickness: 1.5,
                      color: FontColor2,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  print('click Sign Up!');
                  context.router.replaceNamed('/signupv2');
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
            ],
          ),
        ),
      ),
    );
  }

  void _login() {
    print('Sign In');
    if (_formKey.currentState!.validate()) {
      setState(() {
        _errorMessage = null;
      });

      final String hashedPassword = hashPassword(_passwordController.text);
      //เพิ่มความปลอดภัยหใ้กับรหัสผ่าน
      if (_usernameController.text == 'admin' &&
          hashedPassword == 'hashed_1234') {
        context.router.replaceNamed('/homescreen');
      } else {
        setState(() {
          _errorMessage = AppLocalizations.of(context)!.inva;
        });
      }
    }
  }

  String hashPassword(String password) {
    return 'hashed_$password';
  }
}

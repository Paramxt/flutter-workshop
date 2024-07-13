import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_workshop/constants/color.dart';
import 'package:flutter_workshop/router/routes.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_workshop/screen/Device.dart';

@RoutePage()
class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorMessage;
  bool isSelected = false;
  bool _isLoggingIn = false;

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
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    setState(() {
      _isLoggingIn = true;
      _errorMessage = null;
    });

    if (_formKey.currentState!.validate()) {
      if (_usernameController.text == 'admin' &&
          _passwordController.text == '1234') {
        await Future.delayed(Duration(seconds: 5));
        sharedPreferences.setString('username', _usernameController.text);
        context.router.push(SettingRoute());
      } else if (_usernameController.text == 'user' &&
          _passwordController.text == '1234') {
        await Future.delayed(Duration(seconds: 5));
        sharedPreferences.setString('username', _usernameController.text);
        context.router.push(SettingRoute());
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
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

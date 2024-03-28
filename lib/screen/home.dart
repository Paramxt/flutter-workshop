import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_workshop/main.dart';

@RoutePage()
class HomeRoute extends StatelessWidget {
  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context)!.hello),
              ElevatedButton(
                onPressed: () {
                  context.router.replaceNamed('/signin');
                },
                child: Text("Go to Sign In"),
              ),
              ElevatedButton(
                onPressed: () {
                  context.router.replaceNamed('/page0');
                },
                child: Text("Go to Main Home"),
              ),
              ElevatedButton(
                onPressed: () {
                  context.router.replaceNamed('/example');
                },
                child: Text("Example"),
              ),
              ElevatedButton(
                onPressed: () {
                  context.router.replaceNamed('/signup');
                },
                child: Text("Go to Sign Up"),
              ),
              ElevatedButton(
                onPressed: () {
                  MyApp.setLocale(context, Locale('th'));
                },
                child: Text(AppLocalizations.of(context)!.change_thai),
              ),
              ElevatedButton(
                onPressed: () {
                  MyApp.setLocale(context, Locale('en'));
                },
                child: Text("Change language english"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

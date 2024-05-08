import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_workshop/constants/color.dart';

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GreyColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.device,
          style: TextStyle(
            fontSize: 34,
            color: SecondaryColor,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: whiteColor,
        showUnselectedLabels: false,
        selectedItemColor: PrimaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 400.0,
                    maxHeight: 300.0,
                  ),
                  child: Align(
                    alignment: Alignment.center, // Center the logo
                    child: Image.asset('assets/logo3.png'),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context)!.nodvice,
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\n' + AppLocalizations.of(context)!.subdevice,
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 25.0),
                    ElevatedButton(
                      onPressed: () {
                        print('Add devices');
                        context.router.replaceNamed('/adddevice');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: SecondaryColor,
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.adddevice,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: PrimaryColor, fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

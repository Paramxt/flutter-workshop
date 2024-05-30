import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop/constants/color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_workshop/screen/ProfileMenuWidget.dart';
import 'package:flutter_workshop/screen/setting_language.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.setting,
          style: TextStyle(
            fontSize: 22,
            color: BlackColor,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Grey2Color.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    title: Text(
                      AppLocalizations.of(context)!.language,
                      style: TextStyle(
                        fontSize: 17,
                        color: BlackColor,
                      ),
                    ),
                    trailing: Icon(
                      Icons.navigate_next_outlined,
                      size: 30,
                    ),
                    onTap: () {
                      print('Click Language');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangeLanguagePage()),
                      );
                    },
                  ),
                  Divider(color: Colors.grey),
                  ListTile(
                    contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    title: Text(
                      AppLocalizations.of(context)!.pass_and_secu,
                      style: TextStyle(
                        fontSize: 17,
                        color: BlackColor,
                      ),
                    ),
                    trailing: Icon(
                      Icons.navigate_next_outlined,
                      size: 30,
                    ),
                    onTap: () {
                      print('Click Password');
                    },
                  ),
                  Divider(color: Colors.grey),
                  ListTile(
                    contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    title: Text(
                      AppLocalizations.of(context)!.setting,
                      style: TextStyle(
                        fontSize: 18,
                        color: BlackColor,
                      ),
                    ),
                    trailing: Icon(
                      Icons.navigate_next_outlined,
                      size: 30,
                    ),
                    onTap: () {
                      print('Click Setting');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

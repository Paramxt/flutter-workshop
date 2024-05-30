import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop/constants/color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_workshop/l10n/language.dart';
import 'package:flutter_workshop/l10n/language2.dart';
import 'package:flutter_workshop/main.dart';
import 'package:flutter_workshop/screen/ProfileMenuWidget.dart';

class ChangeLanguagePage extends StatefulWidget {
  const ChangeLanguagePage({super.key});

  @override
  State<ChangeLanguagePage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguagePage> {
  Language? _selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.change_lang,
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
        padding: const EdgeInsets.all(10),
        child: Column(
          children: Language.languageList().map((Language language) {
            return Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  title: Text(
                    language.name,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () async {
                    Locale _locale = await setLocale(language.languageCode);
                    MyApp.setLocale(context, _locale);
                    setState(() {
                      _selectedLanguage = language;
                    });
                  },
                ),
                Divider(color: Colors.grey),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

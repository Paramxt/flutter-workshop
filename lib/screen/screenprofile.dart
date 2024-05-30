import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop/constants/color.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:flutter_workshop/screen/ProfileMenuWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScreenProfile extends StatefulWidget {
  final int countDevice;
  const ScreenProfile({super.key, required this.countDevice});

  @override
  State<ScreenProfile> createState() => _ScreenProfileState();
}

class _ScreenProfileState extends State<ScreenProfile> {
  int _countDevice = 0;
  @override
  void initState() {
    super.initState();
    _countDevice = widget.countDevice;
  }

  // Method to set countDevice
  void setCountDevice(int value) {
    setState(() {
      _countDevice = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.profile,
          style: TextStyle(
            fontSize: 22,
            color: SecondaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset('assets/logo.png'),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                AppLocalizations.of(context)!.admin,
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(height: 10),
              Text(
                AppLocalizations.of(context)!.admin_add,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    print('Edit Profile');
                  },
                  child: Text(
                    AppLocalizations.of(context)!.edit,
                    style: TextStyle(color: PrimaryColor),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: SecondaryColor, side: BorderSide.none),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),
              ProfileMenuWidget(
                  title: AppLocalizations.of(context)!.setting,
                  icon: Icons.settings,
                  onPress: () {
                    print('Click Setting');
                    context.router.pushNamed('/setting');
                  }),
              ProfileMenuWidget(
                  title: AppLocalizations.of(context)!.help,
                  icon: Icons.help,
                  onPress: () {
                    print('Click Help');
                  }),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: AppLocalizations.of(context)!.info,
                  icon: Icons.info_rounded,
                  onPress: () {
                    print('Click Infomation');
                  }),
              ProfileMenuWidget(
                  title: AppLocalizations.of(context)!.logout,
                  icon: Icons.logout_outlined,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                    setCountDevice(0);
                    print('Click Log Out');
                    context.router.replaceNamed('/signinv2');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

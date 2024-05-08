import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop/constants/color.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:flutter_workshop/screen/ProfileMenuWidget.dart';
import 'package:get/get.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GreyColor,
        appBar: AppBar(
          backgroundColor: whiteColor,
          centerTitle: true,
          title: const Text(
            ' Profile',
            style: TextStyle(
              fontSize: 32,
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
                  'Admin',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 10),
                Text(
                  'admin@up.ac.th',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      print('Edit Profile');
                    },
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(color: PrimaryColor),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: SecondaryColor, side: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 30),
                const Divider(),
                const SizedBox(height: 10),
                ProfileMenuWidget(
                    title: "Settings",
                    icon: Icons.settings,
                    onPress: () {
                      print('Click Setting');
                    }),
                ProfileMenuWidget(
                    title: "Help",
                    icon: Icons.help,
                    onPress: () {
                      print('Click Help');
                    }),
                const Divider(),
                const SizedBox(height: 10),
                ProfileMenuWidget(
                    title: "Information",
                    icon: Icons.info_rounded,
                    onPress: () {
                      print('Click Infomation');
                    }),
                ProfileMenuWidget(
                    title: "Logout",
                    icon: Icons.logout_outlined,
                    textColor: Colors.red,
                    endIcon: false,
                    onPress: () {
                      print('Click Log Out');
                      context.router.replaceNamed('/signinv2');
                    }),
              ],
            ),
          ),
        ));
  }
}

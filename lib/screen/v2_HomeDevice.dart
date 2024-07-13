import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_workshop/constants/color.dart';
import 'package:flutter_workshop/screen/screenhome.dart';
import 'package:flutter_workshop/screen/screenhis.dart';
import 'package:flutter_workshop/screen/screenprofile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_workshop/constants/variable.dart';

@RoutePage()
class HomeDevicePage extends StatefulWidget {
  final int countDevice;
  const HomeDevicePage({Key? key, required this.countDevice}) : super(key: key);

  @override
  State<HomeDevicePage> createState() => _HomeDevicePageState();
}

class _HomeDevicePageState extends State<HomeDevicePage> {
  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [
      ScreenHome(countDevice: widget.countDevice),
      ScreenHis(),
      ScreenProfile(countDevice: widget.countDevice),
    ];

    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          children: widgetList,
          index: myIndex,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: whiteColor,
          showUnselectedLabels: false,
          selectedItemColor: PrimaryColor,
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: AppLocalizations.of(context)!.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: AppLocalizations.of(context)!.info,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: AppLocalizations.of(context)!.profile,
            ),
          ],
        ),
      ),
    );
  }
}

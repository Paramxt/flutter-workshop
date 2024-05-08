import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_workshop/constants/color.dart';
import 'package:flutter_workshop/screen/screenhome.dart';
import 'package:flutter_workshop/screen/screennoti.dart';
import 'package:flutter_workshop/screen/screenprofile.dart';

class HomeDevicePage extends StatefulWidget {
  const HomeDevicePage({super.key});

  @override
  State<HomeDevicePage> createState() => _HomeDevicePageState();
}

class _HomeDevicePageState extends State<HomeDevicePage> {
  int myIndex = 0;
  List<Widget> widgetList = const [Screen1(), Screen2(), Screen3()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

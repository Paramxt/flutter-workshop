import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:toggle_switch/toggle_switch.dart';

@RoutePage()
class MainhomePage extends StatefulWidget {
  const MainhomePage({Key? key}) : super(key: key);

  @override
  State<MainhomePage> createState() => _mainhomeRouteState();
}

class _mainhomeRouteState extends State<MainhomePage> {
  int _page = 0;
  bool _icon = false;

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  List<String> name = ["Home", "Setting", "History"];
  List<Widget> pageContent = [
    // Home page content
    Column(
      children: [
        const SizedBox(height: 55),
        const Text(
          "Home",
          style: TextStyle(
            fontSize: 60,
          ),
        ),
        const SizedBox(height: 30),
        GestureDetector(
          onTap: () {
            print("Add Device !! ");
          },
          child: Container(
            width: 500,
            height: 250,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 235, 235, 235),
              border: Border.all(
                  color: const Color.fromARGB(255, 14, 13, 13), width: 3),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Center(
              child: Icon(
                Icons.add,
                size: 100,
                color: Color.fromARGB(255, 207, 207, 205),
              ),
            ),
          ),
        ),
      ],
    ),
    // Settings page content
    Column(
      children: [
        const SizedBox(height: 55),
        const Text(
          "Devices",
          style: TextStyle(
            fontSize: 60,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              width: 250,
              height: 200,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 235, 235, 235),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.wb_incandescent,
                    size: 40,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "LED Light",
                    style: TextStyle(
                        color: Color.fromARGB(255, 14, 13, 13),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  ToggleSwitch(
                    minWidth: 90.0,
                    cornerRadius: 20.0,
                    activeBgColors: [
                      [Color.fromARGB(255, 14, 13, 13)],
                      [Color.fromARGB(255, 14, 13, 13)]
                    ],
                    activeFgColor: Colors.grey,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.grey,
                    initialLabelIndex: 1, // Adjust as needed
                    totalSwitches: 2,
                    labels: ['ON', 'OFF'],
                    radiusStyle: true,
                    onToggle: (index) {
                      print('switched LED Light to: $index');
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Status : ",
                    style: TextStyle(
                        color: Color.fromARGB(255, 14, 13, 13), fontSize: 30),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Container(
              //Box 2
              padding: const EdgeInsets.all(10.0),
              width: 250,
              height: 200,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 235, 235, 235),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.build_rounded,
                    size: 40,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Servo Mortor",
                    style: TextStyle(
                        color: Color.fromRGBO(14, 13, 13, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  ToggleSwitch(
                    minWidth: 90.0,
                    cornerRadius: 20.0,
                    activeBgColors: [
                      [Color.fromARGB(255, 14, 13, 13)],
                      [Color.fromARGB(255, 14, 13, 13)]
                    ],
                    activeFgColor: Colors.grey,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.grey,
                    initialLabelIndex: 1,
                    totalSwitches: 2,
                    labels: ['ON', 'OFF'],
                    radiusStyle: true,
                    onToggle: (index) {
                      print('switched Servo Mortor to: $index');
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Status : ",
                    style: TextStyle(
                        color: Color.fromARGB(255, 14, 13, 13), fontSize: 30),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              width: 250,
              height: 200,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 235, 235, 235),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.construction_rounded,
                    size: 40,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Stepper Mortor",
                    style: TextStyle(
                        color: Color.fromARGB(255, 14, 13, 13),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  ToggleSwitch(
                    minWidth: 90.0,
                    cornerRadius: 20.0,
                    activeBgColors: [
                      [Color.fromARGB(255, 14, 13, 13)],
                      [Color.fromARGB(255, 14, 13, 13)]
                    ],
                    activeFgColor: Colors.grey,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.grey,
                    initialLabelIndex: 1, // Adjust as needed
                    totalSwitches: 2,
                    labels: ['ON', 'OFF'],
                    radiusStyle: true,
                    onToggle: (index) {
                      print('switched Stepper Mortor to: $index');
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Status : ",
                    style: TextStyle(
                        color: Color.fromARGB(255, 14, 13, 13), fontSize: 30),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Container(
              padding: const EdgeInsets.all(10.0),
              width: 250,
              height: 200,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 235, 235, 235),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Icon(
                    Icons.cell_tower_rounded,
                    size: 50,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Sensor",
                    style: TextStyle(
                        color: Color.fromARGB(255, 14, 13, 13),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      print('click More sensor detail ! ');
                    },
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                              text: "More Detail >",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              width: 250,
              height: 200,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 235, 235, 235),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.camera_alt_rounded,
                    size: 40,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Webcam",
                    style: TextStyle(
                        color: Color.fromARGB(255, 14, 13, 13),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  ToggleSwitch(
                    minWidth: 90.0,
                    cornerRadius: 20.0,
                    activeBgColors: [
                      [Color.fromARGB(255, 14, 13, 13)],
                      [Color.fromARGB(255, 14, 13, 13)]
                    ],
                    activeFgColor: Colors.grey,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.grey,
                    initialLabelIndex: 1, // Adjust as needed
                    totalSwitches: 2,
                    labels: ['ON', 'OFF'],
                    radiusStyle: true,
                    onToggle: (index) {
                      print('switched Webcam to: $index');
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Status : ",
                    style: TextStyle(
                        color: Color.fromARGB(255, 14, 13, 13), fontSize: 30),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),

    // History page content
    Column(
      children: <Widget>[
        const SizedBox(height: 55),
        const Text(
          "Detail",
          style: TextStyle(
            fontSize: 60,
          ),
        ),
        const SizedBox(height: 50),
        GestureDetector(
          onTap: () {
            print("click History !! ");
          },
          child: Container(
            width: 450,
            height: 150,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 235, 235, 235),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: <Widget>[
                SizedBox(width: 40),
                Icon(Icons.history, size: 80),
                SizedBox(width: 80),
                Text(
                  "History",
                  style: TextStyle(
                      color: Color.fromARGB(255, 14, 13, 13),
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 38),
                Icon(Icons.navigate_next_sharp, size: 80),
              ],
            ),
          ),
        ),
        const SizedBox(height: 40),
        GestureDetector(
          onTap: () {
            print("click Type !! ");
          },
          child: Container(
            width: 450,
            height: 150,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 235, 235, 235),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: <Widget>[
                SizedBox(width: 40),
                Icon(Icons.format_list_bulleted_sharp, size: 80),
                SizedBox(width: 80),
                Text(
                  "Type",
                  style: TextStyle(
                      color: Color.fromARGB(255, 14, 13, 13),
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 80),
                Icon(Icons.navigate_next_sharp, size: 80),
              ],
            ),
          ),
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 55,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        color: Color.fromARGB(255, 78, 181, 145),
        letIndexChange: (index) => true,
        items: [
          Icon(
            Icons.home,
            size: 40,
          ),
          Icon(
            Icons.settings,
            size: 40,
          ),
          Icon(
            Icons.assignment_rounded,
            size: 40,
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backgroud.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(child: pageContent[_page]),
      ),
    );
  }
}

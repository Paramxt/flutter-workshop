import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

@RoutePage()
class Page2Page extends StatefulWidget {
  const Page2Page({Key? key}) : super(key: key);

  @override
  State<Page2Page> createState() => _mainhomeRouteState();
}

class _mainhomeRouteState extends State<Page2Page> {
  late int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backgroud.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 55,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        color: Color.fromARGB(255, 78, 181, 93),
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // Update selected index
          });
          context.router.replaceNamed('/page$index'); // Navigate using index
        },
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
            Icons.history,
            size: 40,
          ),
        ],
      ),
    );
  }
}

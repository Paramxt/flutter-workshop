import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop/constants/color.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GreyColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        title: const Text(
          ' Device',
          style: TextStyle(
            fontSize: 32,
            color: FontColor2,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: ListTile(
          leading: Icon(Icons.smart_toy_outlined),
          title: Text(
            ' Machine #1',
            style: TextStyle(fontSize: 23),
          ),
          onTap: () {
            print('Click Machine 1 ');
            context.router.replaceNamed('/machine');
          },
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}

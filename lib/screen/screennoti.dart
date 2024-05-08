import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop/constants/color.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GreyColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        title: const Text(
          ' Notification',
          style: TextStyle(
            fontSize: 34,
            color: Color.fromARGB(255, 14, 13, 13),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: ListView.separated(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: const Text('Account'),
              onTap: () {},
              leading: Icon(Icons.person),
              trailing: const Icon(Icons.more_horiz_rounded),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(color: Colors.black),
        ),
      ),
    );
  }
}

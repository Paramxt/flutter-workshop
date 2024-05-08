// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_workshop/constants/color.dart';

// class DevicePage extends StatelessWidget {
//   const DevicePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: GrayColor,
//       appBar: AppBar(
//         backgroundColor: BottomColor2,
//         centerTitle: true,
//         title: const Text(
//           ' Device',
//           style: TextStyle(
//             fontSize: 34,
//             color: Color.fromARGB(255, 14, 13, 13),
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: BottomColor2,
//         selectedItemColor: BottomColor,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.notifications_active), label: 'Notification'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.account_box_sharp), label: 'Profile'),
//         ],
//       ),
//       body: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             children: <Widget>[
//               Align(
//                 alignment: Alignment.center,
//                 child: Container(
//                   constraints: const BoxConstraints(
//                     maxWidth: 400.0,
//                     maxHeight: 300.0,
//                   ),
//                   child: Align(
//                     alignment: Alignment.center, // Center the logo
//                     child: Image.asset('assets/logo3.png'),
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.center,
//                 child: Column(
//                   children: <Widget>[
//                     Text(
//                       'No Devices Yet',
//                       style:
//                           TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       '\nAdd devices to start application',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                     const SizedBox(height: 25.0),
//                     ElevatedButton(
//                       onPressed: () {
//                         print('Add devices');
//                         context.router.replaceNamed('/adddevice');
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Color.fromARGB(255, 43, 24, 24),
//                       ),
//                       child: const Text(
//                         "Add Device",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             color: Color.fromARGB(255, 78, 181, 145),
//                             fontSize: 18.0),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

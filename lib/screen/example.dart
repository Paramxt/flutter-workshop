import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

@RoutePage()
class ExampleRoute extends StatefulWidget {
  const ExampleRoute({super.key});

  @override
  State<ExampleRoute> createState() => _ExampleRouteState();
}

class _ExampleRouteState extends State<ExampleRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(kToolbarHeight * 1.5), // Adjust height as needed
        child: Container(
          height: kToolbarHeight, // Adjust height as needed
          color: Colors.green, // Set background color
          child: Row(
            // Arrange widgets horizontally
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space evenly
            children: [
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Sign In",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    TextSpan(
                      text: "\n",
                      style: TextStyle(
                        color: Colors.transparent,
                      ),
                    ),
                    TextSpan(
                      text: "Welcome to my App",
                      style: TextStyle(
                        color: Color.fromARGB(255, 100, 100, 100),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              // Add other widgets here if needed (e.g., icons)
            ],
          ),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('1'),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 184, 85, 85),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('1'),
                  Text('2'),
                  Text('3'),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: Text('1'),
            ),
            TextButton(
              onPressed: () {
                print('click!!!');
              },
              child: Text('Text button'),
            ),
            Row(
              children: <Widget>[
                SizedBox(width: 20.0), // Left margin
                Expanded(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(14.0),
                          border: OutlineInputBorder(),
                          labelText: 'Enter your username',
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(14.0),
                          border: OutlineInputBorder(),
                          labelText: 'Enter your password',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20.0), // Right margin
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                print('click Sign In!!!');
              },
              child: SizedBox(
                width: 450,
                child: Text(
                  "Sign In",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color.fromARGB(255, 11, 47, 41)),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 78, 181, 145),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
      ]),
    );
  }
}

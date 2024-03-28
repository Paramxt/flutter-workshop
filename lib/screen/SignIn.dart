import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
        child: Column(
          children: <Widget>[
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, bottom: 1),
                child: Text(
                  "\nSign In",
                  style: TextStyle(
                    color: Color.fromARGB(255, 11, 47, 41),
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, top: 2),
                child: Text(
                  "Welcome to my app",
                  style: TextStyle(
                    color: Color.fromARGB(255, 11, 47, 41),
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            Container(
              constraints: const BoxConstraints(
                maxWidth: 500.0, // Adjust width as needed
                maxHeight: 500.0, // Adjust height as needed
              ),
              child: Image.asset('assets/logo.png'),
            ),
            Row(
              children: <Widget>[
                const SizedBox(width: 20.0), // Left margin
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 253, 253, 253),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(14.0),
                            border: OutlineInputBorder(),
                            labelText: 'Enter your username',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 253, 253, 253),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(14.0),
                            border: OutlineInputBorder(),
                            labelText: 'Enter your username',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20.0), // Right margin
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(),
                TextButton(
                  onPressed: () {
                    print('Forgot password clicked!');
                  },
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                        color: Color.fromARGB(255, 11, 47, 41),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                print('click Sign In!!!');
                context.router.replaceNamed('/page0');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 78, 181, 145),
                minimumSize: const Size(550, 40),
              ),
              child: const SizedBox(
                width: 550,
                height: 40,
                child: Text(
                  "Sign In",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 11, 47, 41), fontSize: 27.0),
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the content
              children: [
                Spacer(),
                Expanded(
                  flex: 6,
                  child: Divider(
                    thickness: 1.8,
                    color: Color.fromARGB(255, 30, 30, 30),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    'OR',
                    style: TextStyle(
                        color: Color.fromARGB(255, 93, 86, 86),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                SizedBox(height: 25),
                Expanded(
                  flex: 6,
                  child: Divider(
                    thickness: 1.8,
                    color: Color.fromARGB(255, 30, 30, 30),
                  ),
                ),
                Spacer(),
              ],
            ),
            const SizedBox(height: 25.0),
            GestureDetector(
              onTap: () {
                print('click Sign Up!');
                context.router.replaceNamed('/signup');
              },
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                        text: "Don't have an account ? ",
                        style: TextStyle(fontSize: 15)),
                    TextSpan(
                      text: "  Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 10, 97, 66),
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

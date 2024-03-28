import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
                  "\nSign Up",
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
                  "Get new account for use",
                  style: TextStyle(
                    color: Color.fromARGB(255, 11, 47, 41),
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                const SizedBox(width: 20.0),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 30.0),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 253, 253, 253),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(14.0),
                            border: OutlineInputBorder(),
                            labelText: 'First name',
                          ),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 253, 253, 253),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(14.0),
                            border: OutlineInputBorder(),
                            labelText: 'Last name',
                          ),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 253, 253, 253),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(14.0),
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 253, 253, 253),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(14.0),
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 253, 253, 253),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(14.0),
                            border: OutlineInputBorder(),
                            labelText: 'Comfirm Password',
                          ),
                        ),
                      ),
                      const SizedBox(height: 38.0),
                    ],
                  ),
                ),
                const SizedBox(width: 20.0), // Right margin
              ],
            ),
            ElevatedButton(
              onPressed: () {
                print('click Sign Up!!!');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 78, 181, 145),
                minimumSize: const Size(550, 40),
              ),
              child: const SizedBox(
                width: 550,
                height: 40,
                child: Text(
                  "Sign Up",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 11, 47, 41), fontSize: 27.0),
                ),
              ),
            ),
            const SizedBox(height: 35),
            GestureDetector(
              onTap: () {
                print('click Sign In!');
                context.router.replaceNamed('/signin');
              },
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                        text: "Already have an account. ",
                        style: TextStyle(fontSize: 15)),
                    TextSpan(
                      text: " Sign In",
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it_together/signupscreen.dart';
import 'package:get_it_together/taskpage.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/second': (context) => const SignUpScreen(),
        '/third': (context) => const TaskPage(),
      },
    ),
  );
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade300,
        title: const Center(child: Text('Login')),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                maxRadius: 40.0,
                backgroundImage: AssetImage('images/triquetra.png'),
              ),
              Text(
                'Get It Together',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.teal.shade200,
                  fontFamily: 'Pattaya',
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'email',
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'password',
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
                child: const Text('Sign Up '),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/third');
                  },
                  child: const Text('Login')),
            ]),
      ),
    );
  }
}

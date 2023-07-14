import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade200,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade300,
        title: const Text('Sign Up Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 20.0,
            width: 150.0,
            child: Divider(
              color: Colors.teal.shade100,
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Name',
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
          const TextField(
            decoration: InputDecoration(
              hintText: 'Confirm Password',
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
                Navigator.pushNamed(context, '/third');
              },
              child: const Text('Create Account')),
        ],
      ),
    );
  }
}

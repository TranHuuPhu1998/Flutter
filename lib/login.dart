import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          children: <Widget>[
            SizedBox(height: 80),
            Column(children: [
              Icon(
                Icons.favorite,
                color: Colors.pink,
                size: 60,
              ),
              TextField(
                decoration:
                    InputDecoration(filled: false, labelText: 'UserName'),
                controller: _usernameController,
              ),
              SizedBox(height: 12.0),
              TextField(
                decoration:
                    InputDecoration(filled: false, labelText: 'PassWord'),
                controller: _passwordController,
                obscureText: true,
              ),
              SizedBox(height: 20),
              ButtonBar(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      child: Text('CANCEL'),
                      onPressed: () {
                        _usernameController.clear();
                        _passwordController.clear();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('NEXT')),
                  )
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

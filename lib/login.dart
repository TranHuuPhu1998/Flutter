import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _showPass = false;

  void _onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 80),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Icon(
                Icons.favorite,
                color: Colors.pink,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 60),
                child: Text(
                  "HELLO\nWELCOME BACK",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.tealAccent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    filled: false,
                    labelText: 'UserName',
                    border: InputBorder.none,
                    labelStyle: TextStyle(color: Colors.blue),
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.blue),
                    contentPadding: EdgeInsets.all(10),
                  ),
                  controller: _usernameController,
                ),
              ),
              SizedBox(height: 12.0),
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.tealAccent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: false,
                        labelText: 'PassWord',
                        border: InputBorder.none,
                        labelStyle: TextStyle(color: Colors.blue),
                        hintStyle:
                            TextStyle(fontSize: 20.0, color: Colors.blue),
                        contentPadding: EdgeInsets.all(10),
                      ),
                      controller: _passwordController,
                      obscureText: !_showPass,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: _onToggleShowPass,
                      child: Text(
                        _showPass ? "HIDE" : "SHOW",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 40),
              Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 1.0, color: Colors.blueGrey),
                        left: BorderSide(width: 1.0, color: Colors.blueGrey),
                        right: BorderSide(width: 1.0, color: Colors.blueGrey),
                        bottom: BorderSide(width: 1.0, color: Colors.blueGrey),
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: TextButton(
                      child: Text('LOGIN'),
                      onPressed: () {
                        _usernameController.clear();
                        _passwordController.clear();
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      color: Colors.blue,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('REGISTER'),
                    ),
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

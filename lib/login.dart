import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _unfocusedColor = Colors.grey[600];
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  bool _showPass = false;

  void _onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void initState() {
    super.initState();
    _usernameFocusNode.addListener(() {
      setState(() {
        //Redraw so that the username label reflects the focus state
      });
    });
    _passwordFocusNode.addListener(() {
      setState(() {
        //Redraw so that the password label reflects the focus state
      });
    });
  }

  Widget build(BuildContext context) {
    return KeyboardSizeProvider(
      smallSize: 600.0,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          minimum: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(
                          color: _usernameFocusNode.hasFocus
                              ? Theme.of(context).colorScheme.secondary
                              : _unfocusedColor),
                    ),
                    controller: _usernameController,
                    focusNode: _usernameFocusNode,
                  ),
                ),
                SizedBox(height: 12.0),
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'PassWord',
                          labelStyle: TextStyle(
                              color: _passwordFocusNode.hasFocus
                                  ? Theme.of(context).colorScheme.secondary
                                  : _unfocusedColor),
                        ),
                        controller: _passwordController,
                        obscureText: !_showPass,
                        focusNode: _passwordFocusNode,
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
                          bottom:
                              BorderSide(width: 1.0, color: Colors.blueGrey),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: TextButton(
                        child: Text('LOGIN'),
                        onPressed: () {
                          Navigator.pop(context);
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
                          _usernameController.clear();
                          _passwordController.clear();
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
      ),
    );
  }
}

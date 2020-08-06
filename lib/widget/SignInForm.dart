import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:login_register_screen/ui/finalScreen.dart';

import 'package:login_register_screen/ui/SignUpScreen.dart';

class SignInForm extends StatefulWidget {
  SignInForm({Key key}) : super(key: key);
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  TextEditingController signUsername = new TextEditingController();

  bool isvalid = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String sUsername = "";

  void _submitCommand() {
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() {
        sUsername = signUsername.text;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    FinalScreen(name2: sUsername ,name1: "Google")));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/2.0,
      child: Form(
          key: formKey,
          child: Padding(
      padding: const EdgeInsets.fromLTRB(60.0, 0.0, 60.0, 0.0),
      child: Container(
        /* width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height /2.0, */
        child: new Column(
          //padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: <Widget>[
            TextFormField(
              controller: signUsername,
              keyboardType: TextInputType.text,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                icon: const Icon(
                  Icons.person_outline,
                  color: Colors.white,
                  size: 30.0,
                ),
                hintText: 'Enter your user name',
                hintStyle:
                    TextStyle(color: Colors.white, fontFamily: 'Mulish'),
                labelText: ' User Name',
                labelStyle: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontFamily: 'Mulish'),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter user name';
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                icon: const Icon(
                  MaterialIcons.lock_outline,
                  color: Colors.white,
                  size: 30.0,
                ),
                hintText: 'Enter your password',
                hintStyle:
                    TextStyle(color: Colors.white, fontFamily: 'Mulish'),
                labelText: 'Password',
                labelStyle: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontFamily: 'Mulish'),
              ),
              validator: (val) {
                if (val.length == 0) {
                  return "Password cannot be empty";
                }
                if (val.length <= 6) {
                  return "Password too short";
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 50.0,
            ),
            Column(
              children: <Widget>[
                Container(
                  child: FlatButton(
                    child: new Container(
                      width: 320.0,
                      height: 55.0,
                      alignment: FractionalOffset.center,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            new BorderRadius.all(const Radius.circular(30.0)),
                      ),
                      child: new Text(
                        "Sign In",
                        style: new TextStyle(
                          color: Colors.black,
                          fontFamily: 'Mulish',
                          fontSize: 30.0,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                    onPressed: () {
                      _submitCommand();
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an Account ?",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Mulish',
                          color: Colors.white),
                    ),
                    FlatButton(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 17.0,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          });
                        }),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
          ),
        ),
    );
  }
}

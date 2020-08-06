import 'package:flutter/material.dart';
import 'package:login_register_screen/widget/SignInForm.dart';
import './finalScreen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  
  void _submitCommandt() {
    setState(() {
      
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FinalScreen(name2: "Unknown Person" ,name1: "Twitter")));
    });
  }

  void _submitCommandf() {
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FinalScreen(name2: "Unknown Person" ,name1: "Facebook")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 255, 153, 204),
                  Color.fromARGB(255, 21, 236, 229)
                ],
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      height: 150.0, child: Image.asset('images/logo.png')),
                  Text(
                    "Chainging position into medicine!",
                    style: TextStyle(
                        letterSpacing: 1.0,
                        fontSize: 25.0,
                        fontFamily: 'Open Sans Condensed',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 40.0),
                  
                  SingleChildScrollView(
                    reverse: true,
                    physics: BouncingScrollPhysics(),
                    child: SignInForm(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                          onPressed: () {
                            _submitCommandt();
                          },
                          child: SizedBox(
                              height: 50.0,
                              child: Image.asset('images/twitter.png'))),
                      FlatButton(
                        
                          onPressed: () {
                            _submitCommandf();
                          },
                          child: SizedBox(
                              height: 50.0,
                              child: Image.asset('images/facebook.png'))),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}

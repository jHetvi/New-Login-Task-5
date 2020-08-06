import 'package:flutter/material.dart';

class FinalScreen extends StatefulWidget {
  final String name1;
  final String name2;

  const FinalScreen({Key key, this.name1, this.name2}) : super(key: key);
  @override
  _FinalScreenState createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
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
                 Center(
                  child: Text(
                    "Hii ${widget.name2} !",
                    style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'Mulish',
                        color: Colors.white),
                  ),
                ),
                Center(
                  child: Text(
                    "Thank You! for Signing In with ${widget.name1}",
                    style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'Mulish',
                        color: Colors.white),
                  ),
                ),
              ],
            )),
      ),
    ));
  }
}

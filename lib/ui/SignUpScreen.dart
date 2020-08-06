import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:login_register_screen/widget/SignUpForm.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen() : super();

  final String title = "Flutter Pick Image demo";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Future<File> imageFile;

  pickImageFromGallery(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return FlatButton(
              child: CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white54,
                  child: Image.file(
                    snapshot.data,
                    width: 50,
                    height: 80,
                  )),
              onPressed: () {
                pickImageFromGallery(ImageSource.gallery);
              });
        } else if (snapshot.error != null) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return FlatButton(
              child: CircleAvatar(
                radius: 45,
                backgroundColor: Colors.white54,
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 45.0,
                ),
              ),
              onPressed: () {
                pickImageFromGallery(ImageSource.gallery);
              });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            //physics: AlwaysScrollableScrollPhysics(),
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40.0, 0.0, 0.0, 20.0),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "New Account",
                        style: TextStyle(
                            //letterSpacing: 0.5,
                            fontSize: 30.0,
                            fontFamily: 'Mulish',
                            color: Colors.white),
                      ),
                    ),
                  ),
                  showImage(),
                  const SizedBox(height: 10.0),
                  SignUpForm(),
                ],
              ),
            )),
      ),
    );
  }
}

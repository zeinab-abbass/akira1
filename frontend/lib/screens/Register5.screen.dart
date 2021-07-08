
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/models/User.model.dart';
import 'package:frontend/services/auth.service.dart';
import 'package:frontend/utils/config.dart';
import 'package:frontend/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home.screen.dart';
import 'Register4.screen.dart';

class Register5 extends StatefulWidget {

  static const String id = '/register5';
  static const routeName = '/register5';

  final String name;
  final String email;
  final String username;
  final String password;
  final String phone;
  final String location;

  Register5({Key? key, required this.name, required this.email, required this.username, required this.password, required this.phone, required this.location}) : super(key: key);

  @override
  _Register5State createState() => _Register5State(name, email, username, password, phone, location);
}

class _Register5State extends State<Register5> with SingleTickerProviderStateMixin {

  AuthService _authService = AuthService();

  late AnimationController _controller;
  PickedFile? _imageFile;
  dynamic _pickImageError;
  final _picker = ImagePicker();
  String? _retrieveDataError;

  String name;
  String email;
  String username;
  String password;
  String phone;
  String location;

  String? imagepath;

  _Register5State(this.name, this.email, this.username, this.password, this.phone, this.location);


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2))..repeat();
  }



  void displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        backgroundColor: Colors.white,
        context: context,
        builder: (ctx) {
          return SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: (MediaQuery.of(context).size.height / 100) * 5, horizontal: 30),
                height: MediaQuery.of(context).size.height  * 0.25,
                child: Column( children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Your Picture,",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                      ),
                    ),
                      Text(
                        name,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Color(0xff205072),
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ]
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FlatButton(
                            onPressed: () => {  },
                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(15.0),
                            ),
                            child: Text(
                              "I'll do later",
                              style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  color: Colors.white,
                                  letterSpacing: 0.168,
                                  fontWeight: FontWeight.w500),
                            ),
                            color: UIGuide.COLOR2,
                          ),
                        ],
                      ),
                      SizedBox(width: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[

                          Semantics(
                            label: 'image_picker_example_from_gallery',
                            child: FloatingActionButton(
                              onPressed: () {
                                _onImageButtonPressed(ImageSource.gallery, context: context);

                              },
                              heroTag: 'image0',
                              tooltip: 'Pick Image from gallery',
                              child: const Icon(Icons.photo_library),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(15.0))
                              ),
                            ),
                          ),
                         SizedBox(width: 10,),
                         FloatingActionButton(
                              onPressed: () async {
                                _onImageButtonPressed(ImageSource.camera, context: context);

                              },
                              heroTag: 'image1',
                              tooltip: 'Take a Photo',
                              child: const Icon(Icons.camera_alt),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(15.0))
                              ),
                            ),
                        ]
                ),
                    ],
                  ),
                ],)
            ),
          );
        });
  }

  Widget _loginbtn(context) {
    // ignore: deprecated_member_use
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FlatButton(
          onPressed: () => { displayBottomSheet(context) },
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0),
          ),
          child: Text(
            "NEXT",
            style: GoogleFonts.montserrat(
                fontSize: 25,
                color: Colors.white,
                letterSpacing: 0.168,
                fontWeight: FontWeight.w500),
          ),
          color: UIGuide.COLOR2,
        ),
      ],
    );
  }

  void _onImageButtonPressed(ImageSource source, {BuildContext? context}) async {
    try {
      final pickedFile = await _picker.getImage(
        source: source,
      );
      setState(() async {
        _imageFile = pickedFile;
        imagepath = pickedFile !=null ? pickedFile.path : "assets/images/profile.png";
        User user = await _authService.register(name, username, email, password, phone, location, imagepath);
        Navigator.push(
            context!,
            MaterialPageRoute(
              builder: (context) => Home(
                user: user,
                imagePath: imagepath,
              ),
            )
        );
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Stack(
          children: [

            Container(
              padding: EdgeInsets.only(top: (MediaQuery.of(context).size.height / 100) * 20, bottom: (MediaQuery.of(context).size.height / 100) * 15, left: 50),
              color: Colors.white,
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only()),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        AnimatedBuilder(
                          animation: _controller,
                          builder: (_, child) { return Transform.rotate( angle: _controller.value * 7, child: child,); },
                          child: Image.asset("assets/images/network.png", width: 40, height: 40, color: Color(0xff205072),),
                        )
                      ]
                  ),

                  SizedBox(height: (MediaQuery.of(context).size.height / 100) * 2),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Profile Picture",
                        style: GoogleFonts.poppins(
                          fontSize: 35,
                          color: Color(0xff205072),
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: (MediaQuery.of(context).size.height / 100) * 0.5),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.montserrat(
                          fontSize: 25,
                          color: UIGuide.COLOR3,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: (MediaQuery.of(context).size.height / 100) * 4),

                  Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.asset("assets/images/profile.png", width: 80, height: 80, )
                          ]
                      ),

                      SizedBox(height: 5,),

                      Container(
                        color: Colors.grey.shade400.withOpacity(0.2),
                        width: MediaQuery.of(context).size.width,
                        height: (MediaQuery.of(context).size.height / 100) * 18,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                          child: Text(
                            "Profile picture allow friends to find you faster..\n"
                            "Go on..",
                            style: GoogleFonts.montserrat(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: (MediaQuery.of(context).size.height / 100) * 2),
                  _loginbtn(context)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

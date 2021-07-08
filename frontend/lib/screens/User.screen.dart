import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/models/User.model.dart';
import 'package:frontend/services/auth.service.dart';
import 'package:frontend/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class UserP extends StatefulWidget {

  static const String id = '/user';
  static const routeName = '/user';

  final User user;

  UserP({Key? key, required this.user,}) : super(key: key);

  @override
  _UserState createState() => _UserState(this.user);
}

class _UserState extends State<UserP> {

  late final AnimationController _animationController;
  final User user;
  AuthService _authService = new AuthService();


  _UserState(this.user,);

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration:  BoxDecoration(
                color: UIGuide.COLOR1,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 4,
                                      color: Theme.of(context).scaffoldBackgroundColor),
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        color: Colors.black.withOpacity(0.1),
                                        offset: Offset(0, 10)
                                    )
                                  ],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: FileImage(File(user.photo) )
                                  )
                              ),
                            ),
                            Icon(Icons.circle, color: user.status == true ? Colors.red : Colors.green ),
                          ]
                      )
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(user.name,
                        style: GoogleFonts.montserrat(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.location_on, color: Colors.white, size: 15,),
                      SizedBox(width: 5,),
                      Text(user.location,
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.phone_sharp, color: Colors.white, size: 15,),
                      SizedBox(width: 5, ),
                      Text(user.phone,
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: (MediaQuery.of(context).size.height / 100) * 1,),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: (MediaQuery.of(context).size.width / 100) * 5, vertical: (MediaQuery.of(context).size.height / 100) * 1,),
                    child: FlatButton(
                      onPressed: () => {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('AlertDialog Title'),
                            content: const Text('AlertDialog description'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                      },
                      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 60),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.category, color: Colors.white),
                          SizedBox(width: 10,),
                          Text(
                            "Interests",
                            style: GoogleFonts.montserrat(
                                fontSize: 20,
                                color: Colors.white,
                                letterSpacing: 0.168,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      color: HexColor("#ADC9BA"),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: (MediaQuery.of(context).size.width / 100) * 5, vertical: (MediaQuery.of(context).size.height / 100) * 1,),
                    child: FlatButton(
                      onPressed: () => {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('AlertDialog Title'),
                            content: const Text('AlertDialog description'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                      },
                      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 60),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.category, color: Colors.white),
                          SizedBox(width: 10,),
                          Text(
                            "Hobbies",
                            style: GoogleFonts.montserrat(
                                fontSize: 20,
                                color: Colors.white,
                                letterSpacing: 0.168,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      color: HexColor("#DBA858"),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: (MediaQuery.of(context).size.width / 100) * 5, vertical: (MediaQuery.of(context).size.height / 100) * 1,),
                    child: FlatButton(
                      onPressed: () => {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('AlertDialog Title'),
                            content: const Text('AlertDialog description'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                      },
                      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 60),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.language_outlined, color: Colors.white),
                          SizedBox(width: 10,),
                          Text(
                            "Languages",
                            style: GoogleFonts.montserrat(
                                fontSize: 20,
                                color: Colors.white,
                                letterSpacing: 0.168,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      color: HexColor("#8C0E0F").withOpacity(0.6),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: (MediaQuery.of(context).size.width / 100) * 5, vertical: (MediaQuery.of(context).size.height / 100) * 1,),
                    child: FlatButton(
                        onPressed: () => {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('AlertDialog Title'),
                              content: const Text('AlertDialog description'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          ),
                        },
                        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 60),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.work, color: Colors.white),
                            SizedBox(width: 10,),
                            Text(
                              "Work Experiance",
                              style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  color: Colors.white,
                                  letterSpacing: 0.168,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        color: Colors.blueGrey[200]
                    ),
                  ),
                ],
              ),
            ),

          ]
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: const Icon(Icons.favorite, color: Colors.white,),
        backgroundColor: Colors.red.shade900,
      ),
    );
  }
}

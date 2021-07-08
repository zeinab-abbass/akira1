import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:frontend/models/User.model.dart';
import 'package:frontend/services/auth.service.dart';
import 'package:frontend/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Upgrade.screen.dart';

class Settings extends StatefulWidget {

  static const String id = '/settings';
  static const routeName = '/settings';

  final User user;
  final String? imagePath;


  Settings({Key? key, required this.user, this.imagePath}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState(this.user, this.imagePath);
}

class _SettingsState extends State<Settings> {

  String? imagePath;
  User user;

  bool isSwitchOn = false;
  bool isSwitchOn1 = false;
  bool isSwitchOn2 = false;

  AuthService _authService =  new AuthService();

  _SettingsState(this.user, this.imagePath);


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 10))
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(File(user.photo) )
                        )
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Text(
                          user.username,
                          style: GoogleFonts.montserrat(
                              fontSize: 15,
                              color: UIGuide.COLOR2,
                              letterSpacing: 0.168,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Divider(height: 1, thickness: 0.5, color: UIGuide.COLOR3 ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.notifications_sharp),
                          title: Row(
                            children: [
                              Text("Email Notifications"),
                              SizedBox(width: 30,),
                              FlutterSwitch(
                                activeColor: UIGuide.COLOR2,
                                value: isSwitchOn,
                                onToggle: (value) {
                                  setState(() {
                                    isSwitchOn = value;
                                  });

                                },
                              ),
                            ],
                          ),

                        ),

                      ]
                  )
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.notifications_sharp),
                          title: Row(
                            children: [
                              Text("App Notifications"),
                              SizedBox(width: 40,),
                              FlutterSwitch(
                                activeColor: UIGuide.COLOR2,
                                value: isSwitchOn1,
                                onToggle: (value) {
                                  setState(() {
                                    isSwitchOn1 = value;
                                  });
                                },
                              ),
                            ],
                          ),

                        ),

                      ]
                  )
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.account_circle_sharp),
                          title: Row(
                            children: [
                              Text("Update Status"),
                              SizedBox(width: 65,),
                              FlutterSwitch(
                                activeColor: UIGuide.COLOR2,
                                value: isSwitchOn2,
                                onToggle: (value) {
                                  setState(() {
                                    isSwitchOn2 = value;
                                  });
                                  _authService.UpdateStatus(user.email, value);
                                },
                              ),
                            ],
                          ),

                        ),

                      ]
                  )
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RaisedButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Upgrade(
                            user: user
                          ),
                        )
                    );
                  },
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 130),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    "UPGRADE",
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Colors.white,
                        letterSpacing: 0.168,
                        fontWeight: FontWeight.w500),
                  ),
                  color: UIGuide.COLOR2
              ),
            )

          ],
        )
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlineButton(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Text(
                "CANCEL",
                style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: UIGuide.COLOR1,
                    letterSpacing: 0.168,
                    fontWeight: FontWeight.w500),
              ),
              color: UIGuide.WHITE,
              onPressed: () {  },
            ),
            RaisedButton(
                onPressed: () {
                },
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: Text(
                  "SAVE",
                  style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 0.168,
                      fontWeight: FontWeight.w500),
                ),
                color: UIGuide.COLOR2
            )
          ],
        ),
      ),
    );
  }

}


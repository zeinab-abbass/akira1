
import 'package:flutter/material.dart';
import 'package:frontend/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:frontend/screens/EditProfile.screen.dart';

class UserProfile extends StatefulWidget {

  static const String id = '/profile';
  static const routeName = '/profile';

  UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
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
                        CircleAvatar(
                        backgroundImage: AssetImage("assets/images/profile.png"),
                        radius: 50.0,
                      ),
                        Icon(Icons.circle, color: Colors.green,),
                      ]
                    )
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Zeinab Abbas',
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
                    Text('Lebanon, Beirut',
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
                    SizedBox(width: 5,),
                    Text('+961 71 511 828',
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
            padding: EdgeInsets.symmetric(vertical: (MediaQuery.of(context).size.height / 100) * 5,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical:10),
                  child: FlatButton(
                    onPressed: () => {  },
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
                        ),
                         Icon(Icons.arrow_forward_ios_sharp, color: Colors.white, size: 20,)
                      ],
                    ),
                    color: HexColor("#8C0E0F").withOpacity(0.7),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical:10),
                  child: FlatButton(
                    onPressed: () => {  },
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
                        Icon(Icons.arrow_forward_ios_sharp, color: Colors.white, size: 20,)
                      ],
                    ),
                    color: HexColor("#DBA858"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical:10),
                  child: FlatButton(
                    onPressed: () => {  },
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
                        Icon(Icons.arrow_forward_ios_sharp, color: Colors.white, size: 20,)
                      ],
                    ),
                    color: HexColor("#ADC9BA"),
                  ),
                ),
              ],
            ),
          ),

        ]
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(EditProfile.routeName);
        },
        child: const Icon(Icons.edit, color: Colors.white,),
        backgroundColor: UIGuide.COLOR1,
      ),
    );
  }
}
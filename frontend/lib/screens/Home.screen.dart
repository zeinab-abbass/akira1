import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/models/User.model.dart';
import 'package:frontend/services/auth.service.dart';
import 'package:frontend/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'UserProfile.screen.dart';

class Home extends StatefulWidget {

  static const String id = '/home';
  static const routeName = '/home';

  final User user;
  final String? imagePath;

  Home({Key? key, required this.imagePath, required this.user}) : super(key: key);

  @override
  _HomeState createState() => _HomeState(this.user, this.imagePath!);
}

class _HomeState extends State<Home>  {

  late final AnimationController _animationController;
  final User user;
  final String? imagepath;
  AuthService _authService = new AuthService();
  
  List<User> users = [];
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  _HomeState(this.user, this.imagepath);


  @override
  Widget build(BuildContext context) {

    _authService.users().then((value) => users = value );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: UIGuide.COLOR1), //add this line here
        actions: [
          IconButton(icon: Icon(Icons.search_sharp), onPressed: (){})
        ],
      ),
      drawer: Banner(
        location: BannerLocation.bottomEnd,
        message: user.type,
        textStyle: GoogleFonts.montserrat(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        color: Colors.amberAccent,
        child: Drawer(

          elevation: 10.0,
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                padding: EdgeInsets.only(top: (MediaQuery.of(context).size.height / 100) * 5, left: 50, right: 50),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Container(
                          width: 65,
                          height: 65,
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
                                image: FileImage(File(imagepath!)),
                              )
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: (MediaQuery.of(context).size.height / 100) * 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(user.name,
                          style: GoogleFonts.montserrat(
                            fontSize: 19,
                            color: UIGuide.COLOR1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: (MediaQuery.of(context).size.height / 100) * 0.5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "@"+user.username,
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            color: UIGuide.COLOR3,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Divider(height: 1, thickness: 0.5, color: UIGuide.COLOR3 ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 10 ),
                child: inkwell(Item(icon: Icons.home_sharp, label: "Home")),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: inkwell(Item(icon: Icons.account_circle_sharp, label: "Profile")),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: inkwell(Item(icon: Icons.message, label: "Messages")),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: inkwell(Item(icon: Icons.notifications_sharp, label: "Notifications")),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 50),
                child: inkwell(Item(icon: Icons.settings, label: "Settings")),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Divider(height: 1, thickness: 0.5, color: UIGuide.COLOR3 ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: inkwell(Item(icon: Icons.share, label: "Tell a Friend")),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: inkwell(Item(icon: Icons.help, label: "Help and Feedback")),
              ),

            ],
          ),
        ),
      ),

      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(.4),
                          Colors.black.withOpacity(.2),
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Get more Features',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: 'Sans-serif',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              ' Upgrade',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Sans-serif',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: GridView.builder(
                    itemCount: users.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage("assets/images/profile.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Transform.translate(
                            offset: Offset(60, -60),
                            child: Container(
                              // width: 30,
                              // height: 40,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 72, vertical: 70),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Icon(
                                Icons.bookmark_border,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                ),
                )
              ],

            ),
          ),
        ),
      ),

    );

  }

  Widget inkwell(Item item) {

    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey.withOpacity(0.1),
        highlightColor: Colors.transparent,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserProfile(
                  user: user,
                  imagePath: imagepath,
                ),
              )
          );
        },

        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 6.0,
                    height: 46.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),

                  Icon(item.icon, color: UIGuide.COLOR1),

                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),

                  Text(
                    item.label,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: UIGuide.COLOR1
                    ),
                    textAlign: TextAlign.left,
                  ),

                ],
              ),

            ),

          ],
        ),
      ),
    );
  }

}

class Item{
   late IconData icon;
   late String label;

   Item({required this.icon, required this.label});
}
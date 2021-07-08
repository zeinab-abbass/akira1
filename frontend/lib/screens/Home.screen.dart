import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/models/User.model.dart';
import 'package:frontend/services/auth.service.dart';
import 'package:frontend/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'Splash.screen.dart';
import 'UserProfile.screen.dart';
import 'User.screen.dart';
import 'Settings.screen.dart';
import 'Chats.screen.dart';

class Home extends StatefulWidget {

  static const String id = '/home';
  static const routeName = '/home';

  final User user;
  final String? imagePath;

  Home({Key? key, required this.imagePath, required this.user}) : super(key: key);

  @override
  _HomeState createState() => _HomeState(this.user, this.imagePath!);
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  late final AnimationController _animationController;
  final User user;
  final String? imagepath;
  AuthService _authService = new AuthService();
  
  List<User> users = [];
  List<User> usersByLocation = [];

  int _selectedIndex1 = 0;
  int _selectedIndex = 0;


  _onSelected(int index) {
    setState(() => _selectedIndex1 = index);
  }


  TabController? _TabController;

  _HomeState(this.user, this.imagepath);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _TabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }


  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<String> _list = ["All", "Location", "Hobbies", "Interests", "Languages"];

  bool clicked = false;

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Search',
      style: optionStyle,
    ),
    Text(
      'Index 2: Favorites',
      style: optionStyle,
    ),
    Text(
      'Index 3: Account',
      style: optionStyle,
    ),

  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {

    _authService.users().then((value) => users = value );
    _authService.usersByLocation(user.location).then((value) => usersByLocation = value );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: UIGuide.COLOR1), //add this line here
      ),

      body:
      SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top: (MediaQuery.of(context).size.height / 100) * 3, left: (MediaQuery.of(context).size.width / 100) * 10, right: (MediaQuery.of(context).size.width / 100) * 10 ),
                  color: Colors.white,
                  width: double.infinity,

              child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Welcome!",
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            color: Color(0xff205072),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Find your friends",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: UIGuide.COLOR3,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10,),

                Container(
                  height: (MediaQuery.of(context).size.height / 100) * 10,
                  width: (MediaQuery.of(context).size.width / 100) * 100,

                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: _list.length,
                    itemBuilder: (BuildContext context, int index){
                      return Column(
                        children: [
                         Padding(
                           padding: const EdgeInsets.only(right: 50, top: 10),
                            child:
                                Column(
                                  children: [
                                    InkWell(
                                      child: Text(
                                        _list[index],
                                        style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          color: _selectedIndex1 == index
                                            ? UIGuide.COLOR2
                                            : Colors.blueGrey,
                                          fontWeight: _selectedIndex1 == index ? FontWeight.bold : FontWeight.w500,
                                        ),
                                      ),
                                      onTap: (){
                                        setState(() {
                                          _selectedIndex1 = index;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                           ),
                        ],
                      );
                    },
                  ),
                ),
                    SingleChildScrollView(
                      child: Stack(
                        children: [
                          Container(
                          width: (MediaQuery.of(context).size.width / 100) * 100,
                          child: (_selectedIndex1 == 0) ?
                          GridView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: users.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                child: Card(
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
                                   child: Padding(
                                     padding: const EdgeInsets.only(top: 120),
                                     child: Column(
                                       children: [
                                         Text(
                                           user.name,
                                           style: GoogleFonts.poppins(
                                             fontSize: 15,
                                             color: Colors.white,
                                             fontWeight: FontWeight.bold,
                                           ),
                                         )
                                       ],
                                     ),
                                   )
                                  ),
                                ),
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => UserP(
                                          user: user,
                                        ),
                                      )
                                  );
                                },
                              );
                            },
                          ) : null,
                        ),

                          Container(
                            width: (MediaQuery.of(context).size.width / 100) * 100,
                            child: (_selectedIndex1 == 1) ?
                            GridView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: usersByLocation.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  child: Card(
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
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 120),
                                          child: Column(
                                            children: [
                                              Text(
                                                user.name,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                    ),
                                  ),
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => UserP(
                                            user: user,
                                          ),
                                        )
                                    );
                                  },
                                );
                              },
                            ) : null,

                          ),
                      ]
                      ),
                    )
                  ],
                ),
              ),
          ]

      ),
      ),

      //bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        //when added we can add more than 3 items in bar
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF0D47A1),
        onTap: _onItemTapped,
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
                child: Material(
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

                              Icon(Icons.home_sharp, color: UIGuide.COLOR1),

                              const Padding(
                                padding: EdgeInsets.all(4.0),
                              ),

                              Text(
                                "Home",
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
                )
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Material(
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

                              Icon(Icons.account_circle, color: UIGuide.COLOR1),

                              const Padding(
                                padding: EdgeInsets.all(4.0),
                              ),

                              Text(
                                "Profile",
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
                )
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.grey.withOpacity(0.1),
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Chats(
                              user: user,
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

                              Icon(Icons.message_rounded, color: UIGuide.COLOR1),

                              const Padding(
                                padding: EdgeInsets.all(4.0),
                              ),

                              Text(
                                "Messages",
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
                )
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Material(
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

                              Icon(Icons.notifications_sharp, color: UIGuide.COLOR1),

                              const Padding(
                                padding: EdgeInsets.all(4.0),
                              ),

                              Text(
                                "Notifications",
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
                )
              ),

              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 50),
                child:  Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.grey.withOpacity(0.1),
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Settings(
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

                              Icon(Icons.settings, color: UIGuide.COLOR1),

                              const Padding(
                                padding: EdgeInsets.all(4.0),
                              ),

                              Text(
                                "Settings",
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
                )
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Divider(height: 1, thickness: 0.5, color: UIGuide.COLOR3 ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Material(
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

                              Icon(Icons.share, color: UIGuide.COLOR1),

                              const Padding(
                                padding: EdgeInsets.all(4.0),
                              ),

                              Text(
                                "Tell a Friend",
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
                )
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child:Material(
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

                              Icon(Icons.help, color: UIGuide.COLOR1),

                              const Padding(
                                padding: EdgeInsets.all(4.0),
                              ),

                              Text(
                                "Help and Feedback",
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
                )
              ),

            ],
          ),
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


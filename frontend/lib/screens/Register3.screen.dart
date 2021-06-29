import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/utils/config.dart';
import 'package:frontend/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Register4.screen.dart';

class Register3 extends StatefulWidget {

  final String email;
  final String name;
  final String username;

  static const String id = '/register3';
  static const routeName = '/register3';

  Register3({Key? key, required this.name, required this.email, required this.username}) : super(key: key);

  @override
  _Register3State createState() => _Register3State(name , email, username);
}

class _Register3State extends State<Register3> with SingleTickerProviderStateMixin {

  bool showPassword = false;
  bool showPassword1 = false;

  final TextEditingController _passwordcontroller = TextEditingController();

  final String email;
  final String name;
  final String username;

  late AnimationController _controller;

  _Register3State( this.name, this.email, this.username,);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2))..repeat();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Stack(
          children: [

            Container(
              padding: EdgeInsets.symmetric(vertical: (MediaQuery.of(context).size.height / 100) * 20, horizontal: 50),
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
                        "Hello,",
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

                  SizedBox(height: (MediaQuery.of(context).size.height / 100) * 2),
                  _inputField1(context),
                  _inputField2(context),
                  _loginbtn(context),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget _inputField1(context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 25,
            offset: Offset(0, 5),
            spreadRadius: -25,
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: (MediaQuery.of(context).size.height / 100) * 1, top: (MediaQuery.of(context).size.height / 100) * 2),
      child: TextField(
        controller: _passwordcontroller,
        style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.black,
            letterSpacing: 0.24,
            fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          hintText: "Password",
          hintStyle: TextStyle(
            color: Color(0xffA6B0BD),
          ),
          fillColor: Colors.white,
          filled: true,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
            icon: Icon(
              Icons.remove_red_eye,
              color: Colors.grey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(1),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(1),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        obscureText: true,
      ),
    );
  }


  Widget _inputField2(context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 25,
            offset: Offset(0, 5),
            spreadRadius: -25,
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: (MediaQuery.of(context).size.height / 100) * 2, top: (MediaQuery.of(context).size.height / 100) * 2),
      child: TextField(
        style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.black,
            letterSpacing: 0.24,
            fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          hintText: "Confirm Password",
          hintStyle: TextStyle(
            color: Color(0xffA6B0BD),
          ),
          fillColor: Colors.white,
          filled: true,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                showPassword1 = !showPassword1;
              });
            },
            icon: Icon(
              Icons.remove_red_eye,
              color: Colors.grey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(1),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(1),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        obscureText: true,
      ),
    );
  }

  Widget _loginbtn(context) {
    // ignore: deprecated_member_use
    return FlatButton(
      onPressed: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Register4(
                name: name,
                email: email,
                username: username,
                password: _passwordcontroller.text.toString().trim(),
              ),
            )
        ),
      },
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 100),
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
    );
  }

}

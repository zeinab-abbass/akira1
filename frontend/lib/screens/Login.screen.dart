import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/models/User.model.dart';
import 'package:frontend/services/auth.service.dart';
import 'package:frontend/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Home.screen.dart';
import 'Register2.screen.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {

  AuthService _authService = new AuthService();

  late String error = "false";

  late AnimationController _animationcontroller;
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  bool showPassword1= false;

  @override
  void initState() {
    super.initState();

    _animationcontroller =
    AnimationController(vsync: this, duration: Duration(seconds: 2))
      ..repeat();
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
                          animation: _animationcontroller,
                          builder: (_, child) { return Transform.rotate( angle: _animationcontroller.value * 7, child: child,); },
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
                        "LogIN",
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
                        "to start working",
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
        controller: _emailcontroller,
        style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.black,
            letterSpacing: 0.24,
            fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          hintText: "Email Address",
          hintStyle: TextStyle(
            color: Color(0xffA6B0BD),
          ),
          fillColor: Colors.white,
          filled: true,
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
      onPressed: () async {
      User user = await _authService.login(_emailcontroller.text.toString().trim(), _passwordcontroller.text.toString().trim());
        Navigator.push(
        context!,
        MaterialPageRoute(
          builder: (context) => Home(
            user: user,
            imagePath: '',
          ),
        )
    );
      },
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 100),
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(20.0),
      ),
      child: Text(
        "LOGIN",
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

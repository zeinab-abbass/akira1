import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/screens/Register3.screen.dart';
import 'package:frontend/utils/config.dart';
import 'package:frontend/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class Register2 extends StatefulWidget {

  static const String id = '/register2';
  static const routeName = '/register2';

  Register2({Key? key}) : super(key: key);

  @override
  _Register2State createState() => _Register2State();
}

class _Register2State extends State<Register2> with SingleTickerProviderStateMixin {

  late AnimationController _controller;

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
                        "Hello!",
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
                        "lets introduce..",
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
      style: GoogleFonts.poppins(
          fontSize: 20,
          color: Colors.black,
          letterSpacing: 0.24,
          fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        hintText: "Full Name",
        hintStyle: TextStyle(
          color: Color(0xffA6B0BD),
        ),
        fillColor: Colors.white,
        filled: true,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FaIcon(
            FontAwesomeIcons.checkCircle,
            color: Colors.white,
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
        hintText: "UserName",
        hintStyle: TextStyle(
          color: Color(0xffA6B0BD),
        ),
        fillColor: Colors.white,
        filled: true,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FaIcon(
            FontAwesomeIcons.checkCircle,
            color: Colors.white,
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
    ),
  );
}

Widget _loginbtn(context) {
  // ignore: deprecated_member_use
  return FlatButton(
    onPressed: () => { Navigator.of(context).pushNamed(Register3.routeName) },
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

import 'package:flutter/material.dart';
import 'package:frontend/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'Register6.screen.dart';

class Register4 extends StatefulWidget {

  static const String id = '/register4';
  static const routeName = '/register4';

  final String name;
  final String email;
  final String username;
  final String password;

  Register4({Key? key, required this.name, required this.email, required this.username, required this.password}) : super(key: key);

  @override
  _Register4State createState() => _Register4State(name, username, email, password);
}

class _Register4State extends State<Register4> with SingleTickerProviderStateMixin {

  final String name;
  final String username;
  final String email;
  final String password;
  String phone = "";

  _Register4State(this.name, this.username, this.email, this.password);

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
                        "Complete..",
                        style: GoogleFonts.poppins(
                          fontSize: 35,
                          color: UIGuide.COLOR1 ,
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
                        "and verify..",
                        style: GoogleFonts.montserrat(
                          fontSize: 25,
                          color: UIGuide.COLOR3,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: (MediaQuery.of(context).size.height / 100) * 3),
                  _inputField1(),
                  SizedBox(height: (MediaQuery.of(context).size.height / 100) * 3),
                  _loginbtn(context),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _inputField1() {
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
      margin: EdgeInsets.only(bottom: 20, top: 50),
      child: InternationalPhoneNumberInput(
        onInputChanged: (PhoneNumber value) {
          phone = value.toString();
        },
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
              builder: (context) => Register6(
                  name: name,
                  email: email,
                  username: username,
                  password: password,
                  phone: phone
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


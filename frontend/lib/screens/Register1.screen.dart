import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/screens/Register2.screen.dart';
import 'package:frontend/utils/config.dart';
import 'package:frontend/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pin_put/pin_put.dart';

class Register1 extends StatefulWidget {
  Register1({Key? key}) : super(key: key);

  @override
  _Register1State createState() => _Register1State();
}

class _Register1State extends State<Register1> with SingleTickerProviderStateMixin {

  late AnimationController _animationcontroller;
  final TextEditingController _emailcontroller = TextEditingController();
  bool submitValid = false;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _animationcontroller = AnimationController(vsync: this, duration: Duration(seconds: 2))..repeat();
  }

  ///a void function to verify if the Data provided is true
  bool verify() {
    return (EmailAuth.validate(
        receiverMail: _emailcontroller.value.text,
        userOTP: _pinPutController.value.text));
  }

  ///a void function to send the OTP to the user
  void sendOtp() async {
    EmailAuth.sessionName = "AKIRA";
    bool result =
    await EmailAuth.sendOtp(receiverMail: _emailcontroller.value.text);
    if (result) {
      setState(() {
        submitValid = true;
      });
    }
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
      child: TextField(
        controller: _emailcontroller,
        style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.black,
            letterSpacing: 0.24,
            fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          hintText: "Email address",
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
      onPressed: (){ sendOtp(); displayBottomSheet(context); },
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
      color: UIGuide.COLOR2
    );
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
                padding: EdgeInsets.symmetric(vertical: (MediaQuery.of(context).size.height / 100) * 5, horizontal: 50),
                height: MediaQuery.of(context).size.height  * 0.4,
                child: Column(
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Paste 6-digit verification code ",
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            color: UIGuide.COLOR1,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "sent to you on your email",
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            color: UIGuide.COLOR1,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),

                    SizedBox(height: (MediaQuery.of(context).size.height / 100) * 5),
                    Container(
                      child: PinPut(
                        fieldsCount: 6,
                        onSubmit: (String pin) => {},
                        focusNode: _pinPutFocusNode,
                        controller: _pinPutController,
                        submittedFieldDecoration: BoxDecoration(
                          border: Border.all(color: UIGuide.COLOR1),
                          borderRadius: BorderRadius.circular(15.0),
                        ).copyWith(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        selectedFieldDecoration: BoxDecoration(
                          border: Border.all(color: UIGuide.COLOR1),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        followingFieldDecoration: BoxDecoration(
                          border: Border.all(color: UIGuide.COLOR1),
                          borderRadius: BorderRadius.circular(15.0),
                        ).copyWith(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color: UIGuide.COLOR1,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: (MediaQuery.of(context).size.height / 100) * 3),

                      FlatButton(
                        onPressed: () {
                          if (verify()) {
                            _pinPutController.clear();
                            Navigator.of(context).pushNamed(
                                Register2.routeName);
                          }
                        },
                        padding: EdgeInsets.symmetric(
                            vertical: 18, horizontal: 100),
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
                      )

                  ],
                )
            ),
          );
        });
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
                        "Sign Up",
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
                        "to start working",
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
}


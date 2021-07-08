import 'dart:async';

import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shimmer/shimmer.dart';

import 'Register1.screen.dart';
import 'Home.screen.dart';
import 'Register2.screen.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 6));
    _animation = Tween(begin: 50.0, end: 200.0).animate(_controller)
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          print("completed");
        } else if (state == AnimationStatus.dismissed) {
          print("dismissed");
        }
      })
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
    Timer(
        Duration(seconds: 6),
            () {
          _controller.dispose();
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (BuildContext context) => Register1()
              )
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Container(
                color: Colors.white,
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Column(
                    children: <Widget>[

                      Center(
                          child: Container(
                            alignment: AlignmentDirectional.center,
                            child: Container(
                              margin: EdgeInsets.only(top: 50.0),
                              child: Transform.rotate(
                                angle: -2 * 3.14 * _animation.value / 200,
                                child: Image.asset(
                                 "assets/images/network.png",
                                  fit: BoxFit.fitHeight,
                                  width: _animation.value/2,
                                  height: _animation.value/2,
                                  color: UIGuide.COLOR1,
                                ),
                              ),
                            ),
                          ),

                      ),

                    ],
                  ),
          ),

        ],
      );
  }
}

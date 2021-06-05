import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/utils/constants.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shimmer/shimmer.dart';

class Splash extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(start: 0.0, end: 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: UIGuide.COLOR1,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 116.1, middle: 0.4881),
            Pin(size: 118.9, middle: 0.5368),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 53.6, end: 7.9),
                  Pin(size: 61.0, start: 0.0),
                  child: SvgPicture.string(
                    _svg_rkhk1b,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 54.7, start: 0.0),
                  Pin(size: 61.9, start: 0.0),
                  child: SvgPicture.string(
                    _svg_z7jpzl,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 6.1, end: 0.0),
                  Pin(size: 57.0, end: 0.0),
                  child: Shimmer.fromColors(
                    period: Duration(milliseconds: 1500),
                    baseColor: HexColor("#FDD017"),
                    highlightColor: HexColor("#F5F5DC"),
                    child:Text(
                        'AKIRA',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 35,
                          color: const Color(0x69cfd1d3),
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.center,
                      ),
                )
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 138.5, end: -6.0),
            Pin(size: 145.2, middle: 0.1865),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 48.0, end: 0.0),
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(size: 48.0, end: 0.0),
                        Pin(start: 0.7, end: 0.3),
                        child: SvgPicture.string(
                          _svg_riu22y,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 63.0, middle: 0.4636),
                        Pin(start: 0.0, end: 0.0),
                        child: SvgPicture.string(
                          _svg_tw3vuy,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 42.0, start: 0.0),
                        Pin(start: 0.0, end: 1.4),
                        child: SvgPicture.string(
                          _svg_77f3rt,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 48.0, middle: 0.5),
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(size: 48.0, end: 0.0),
                        Pin(start: 0.7, end: 0.3),
                        child: SvgPicture.string(
                          _svg_riu22y,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 63.0, middle: 0.4636),
                        Pin(start: 0.0, end: 0.0),
                        child: SvgPicture.string(
                          _svg_tw3vuy,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 42.0, start: 0.0),
                        Pin(start: 0.0, end: 1.4),
                        child: SvgPicture.string(
                          _svg_77f3rt,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 48.0, start: 0.0),
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(size: 48.0, end: 0.0),
                        Pin(start: 0.7, end: 0.3),
                        child: SvgPicture.string(
                          _svg_riu22y,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 63.0, middle: 0.4636),
                        Pin(start: 0.0, end: 0.0),
                        child: SvgPicture.string(
                          _svg_tw3vuy,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 42.0, start: 0.0),
                        Pin(start: 0.0, end: 1.4),
                        child: SvgPicture.string(
                          _svg_77f3rt,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 70.4, start: -9.7),
            Pin(size: 145.3, middle: 0.1863),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 6.7, end: 0.0),
                  Pin(size: 46.0, start: 0.0),
                  child: SvgPicture.string(
                    _svg_mn4lnb,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 6.2),
                  Pin(size: 48.4, end: 0.0),
                  child: SvgPicture.string(
                    _svg_zat2kd,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 6.2),
                  Pin(size: 47.4, middle: 0.4879),
                  child: SvgPicture.string(
                    _svg_857hm4,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_rkhk1b =
    '<svg viewBox="181.5 408.1 53.6 61.0" ><path transform="translate(-487.55, 203.96)" d="M 678.9605712890625 265.1148376464844 L 678.9605712890625 214.4638671875 L 680.7783813476563 214.4638671875 C 687.3676147460938 214.4638671875 691.48291015625 218.9368286132813 693.135986328125 223.123046875 C 694.789794921875 227.3088073730469 694.896240234375 233.5226745605469 690.236572265625 238.4088134765625 L 686.74365234375 242.0716247558594 L 708.71875 265.1148376464844 L 722.6904296875 265.1148376464844 L 700.3587036132813 241.6978149414063 C 704.5081176757813 235.0542602539063 705.2826538085938 226.8020324707031 702.2634887695313 219.1580810546875 C 698.5958251953125 209.8723754882813 690.363037109375 204.10400390625 680.7783813476563 204.10400390625 L 669.0810546875 204.10400390625 L 669.0810546875 265.1148376464844 L 678.9605712890625 265.1148376464844 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_z7jpzl =
    '<svg viewBox="126.9 408.1 54.7 61.9" ><path transform="matrix(-0.999848, -0.017452, 0.017452, -0.999848, 845.88, 685.75)" d="M 678.9605712890625 265.1148376464844 L 678.9605712890625 214.4638671875 L 680.7783813476563 214.4638671875 C 687.3676147460938 214.4638671875 691.48291015625 218.9368286132813 693.135986328125 223.123046875 C 694.789794921875 227.3088073730469 694.896240234375 233.5226745605469 690.236572265625 238.4088134765625 L 686.74365234375 242.0716247558594 L 708.71875 265.1148376464844 L 722.6904296875 265.1148376464844 L 700.3587036132813 241.6978149414063 C 704.5081176757813 235.0542602539063 705.2826538085938 226.8020324707031 702.2634887695313 219.1580810546875 C 698.5958251953125 209.8723754882813 690.363037109375 204.10400390625 680.7783813476563 204.10400390625 L 669.0810546875 204.10400390625 L 669.0810546875 265.1148376464844 L 678.9605712890625 265.1148376464844 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_riu22y =
    '<svg viewBox="327.0 246.6 48.0 47.0" ><path transform="translate(327.0, 246.59)" d="M 0 47 L 48 0" fill="none" stroke="#ffffff" stroke-width="10" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_tw3vuy =
    '<svg viewBox="271.5 245.9 63.0 48.0" ><path transform="translate(271.5, 245.87)" d="M 0 0 L 63 48" fill="none" stroke="#ffffff" stroke-width="10" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_77f3rt =
    '<svg viewBox="236.5 245.9 42.0 46.6" ><path transform="translate(236.5, 245.87)" d="M 0 46.63365173339844 L 42 0" fill="none" stroke="#ffffff" stroke-width="10" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_mn4lnb =
    '<svg viewBox="6.7 128.4 63.7 46.0" ><path transform="translate(6.71, 128.39)" d="M 0 0 L 63.71490478515625 46" fill="none" stroke="#fefefe" stroke-width="10" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_zat2kd =
    '<svg viewBox="0.0 225.3 64.2 48.4" ><path transform="translate(0.0, 225.29)" d="M 0 0 L 64.21490478515625 48.36634826660156" fill="none" stroke="#fff1f1" stroke-width="10" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_857hm4 =
    '<svg viewBox="0.0 176.2 64.2 47.4" ><path transform="translate(0.0, 176.16)" d="M 0 0 L 64.21490478515625 47.36636352539063" fill="none" stroke="#ffffff" stroke-width="10" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';

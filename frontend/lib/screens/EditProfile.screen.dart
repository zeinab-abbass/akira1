
import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class EditProfile extends StatefulWidget {

  static const String id = '/editprofile';
  static const routeName = '/editprofile';

  EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

    final TextEditingController _namecontroller = TextEditingController();

    bool showPassword = false;
    @override
    Widget build(BuildContext context) {
      return Scaffold(

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Container(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 130,
                          height: 130,
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
                                  image: AssetImage("assets/images/profile.png"),
                              )
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 4,
                                  color: Theme.of(context).scaffoldBackgroundColor,
                                ),
                                color: UIGuide.COLOR1,
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            )
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  buildTextField("Full Name", "Zeinab Abbas", false),
                  buildTextField("Password", "********", true),
                  buildTextField("Location", "Lebanon, Beirut", false),
                  buildTextField1(context, "Hobbies",),
                  buildTextField2(context, "Interests",),
                  buildTextField1(context, "Work Experiance",),

                  SizedBox(
                    height: 15,
                  ),

                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlineButton(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: Text(
                  "CANCEL",
                  style: GoogleFonts.montserrat(
                      fontSize: 15,
                      color: UIGuide.COLOR1,
                      letterSpacing: 0.168,
                      fontWeight: FontWeight.w500),
                ),
                color: UIGuide.WHITE,
                onPressed: () {  },
              ),
              RaisedButton(
                  onPressed: () {},
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    "SAVE",
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Colors.white,
                        letterSpacing: 0.168,
                        fontWeight: FontWeight.w500),
                  ),
                  color: UIGuide.COLOR2
              )
            ],
          ),
        ),
      );
    }

    Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: TextField(
          style: GoogleFonts.poppins(
              fontSize: 20,
              color: Colors.black,
              letterSpacing: 0.24,
              fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: TextStyle(
              color: Color(0xffA6B0BD),
            ),
            fillColor: Colors.white,
            filled: true,

            suffixIcon: isPasswordTextField
                ? IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
              ),
            )
                : null,

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(1),
              ),
              borderSide: BorderSide(color: Colors.white),
            ),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,

          ),

          obscureText: isPasswordTextField ? showPassword : false,
        ),

      );
    }

    List<String>? selectedHobbiesList = [];
    List<String> HobbiesList = ["Reading", "Art", "Music", "Watching Movies", "Dancing", "Singing", "Cooking", "Sleeping", "Travelling"];

    void _openHobbiesDialog() async {
      await FilterListDialog.display<String>(
        context,
        selectedTextBackgroundColor: UIGuide.COLOR1,
        headerTextColor: UIGuide.COLOR1,
        hideSelectedTextCount: true,
        applyButonTextBackgroundColor: UIGuide.COLOR1,
        listData: HobbiesList,
        selectedListData: selectedHobbiesList,
        height: 480,
        headlineText: "Add Hobbies",
        searchFieldHintText: "Search Here",
        choiceChipLabel: (item) {
          return item!;
        },
        validateSelectedItem: (list, val) {
          return list!.contains(val);
        },

        onItemSearch: (list, text) {
          if (list != null) {
            if (list.any((element) =>
                element.toLowerCase().contains(text.toLowerCase()))) {
              /// return list which contains matches
              return list
                  .where((element) =>
                  element.toLowerCase().contains(text.toLowerCase()))
                  .toList();
            }
          }

          return [];
        },

        onApplyButtonClick: (list) {
          setState(() {
            selectedHobbiesList = List.from(list!);
          });
          Navigator.pop(context);
        },

      );
    }

    List<String>? selectedInterestsList = [];
    List<String> InterestsList = ["Reading", "Art", "Music", "Watching Movies", "Dancing", "Singing", "Cooking", "Sleeping", "Travelling"];

    void _openInterestsDialog() async {
      await FilterListDialog.display<String>(
        context,
        selectedTextBackgroundColor: UIGuide.COLOR1,
        headerTextColor: UIGuide.COLOR1,
        hideSelectedTextCount: true,
        applyButonTextBackgroundColor: UIGuide.COLOR1,
        listData: InterestsList,
        selectedListData: selectedInterestsList,
        height: 480,
        headlineText: "Add Interests",
        searchFieldHintText: "Search Here",
        choiceChipLabel: (item) {
          return item!;
        },
        validateSelectedItem: (list, val) {
          return list!.contains(val);
        },

        onItemSearch: (list, text) {
          if (list != null) {
            if (list.any((element) =>
                element.toLowerCase().contains(text.toLowerCase()))) {
              /// return list which contains matches
              return list
                  .where((element) =>
                  element.toLowerCase().contains(text.toLowerCase()))
                  .toList();
            }
          }

          return [];
        },

        onApplyButtonClick: (list) {
          setState(() {
            selectedInterestsList = List.from(list!);
          });
          Navigator.pop(context);
        },

      );
    }


    Widget buildTextField1(context, String labelText) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: TextField(
          style: GoogleFonts.poppins(
              fontSize: 20,
              color: Colors.black,
              letterSpacing: 0.24,
              fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            hintText: "...",
            hintStyle: TextStyle(
                color: Color(0xffA6B0BD)
            ),
            fillColor: Colors.white,
            filled: true,

            suffixIcon: IconButton(
              icon: Icon(Icons.edit),
              onPressed: (){ _openHobbiesDialog(); },
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(1),
              ),
              borderSide: BorderSide(color: Colors.white),
            ),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,

          ),

        ),

      );
    }

    Widget buildTextField2(context, String labelText) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: TextField(
          style: GoogleFonts.poppins(
              fontSize: 20,
              color: Colors.black,
              letterSpacing: 0.24,
              fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            hintText: "...",
            hintStyle: TextStyle(
                color: Color(0xffA6B0BD)
            ),
            fillColor: Colors.white,
            filled: true,

            suffixIcon: IconButton(
              icon: Icon(Icons.edit),
              onPressed: (){ _openInterestsDialog(); },
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(1),
              ),
              borderSide: BorderSide(color: Colors.white),
            ),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,

          ),

        ),

      );
    }

}

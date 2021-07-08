
import 'dart:io';

import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:frontend/models/Experiance.model.dart';
import 'package:frontend/models/User.model.dart';
import 'package:frontend/services/auth.service.dart';
import 'package:frontend/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatefulWidget {

  static const String id = '/editprofile';
  static const routeName = '/editprofile';

  final User user;
  final String? imagePath;

  EditProfile({Key? key, required this.user, this.imagePath}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState(this.user, this.imagePath);
}

class _EditProfileState extends State<EditProfile> {

    AuthService _authService = new AuthService();

    bool showPassword = false;
    User user;
    final String? imagePath;

    _EditProfileState(this.user, this.imagePath);

    final TextEditingController _namecontroller = TextEditingController();
    final TextEditingController _passwordcontroller = TextEditingController();
    final TextEditingController _locationcontroller = TextEditingController();

    final TextEditingController _startcontroller = TextEditingController();
    final TextEditingController _endcontroller = TextEditingController();
    final TextEditingController _companycontroller = TextEditingController();
    final TextEditingController _titlecontroller = TextEditingController();
    final TextEditingController _descriptioncontroller = TextEditingController();

    List<String>? selectedLanguagesList;
    List<String> LanguagesList = ["Chineese", "Spanish", "English", "Hindi", "Bengali", "Russian", "Japanese", "Arabic", "Turkish", "French", "Korean", "Persian", "Italian", ];

    List<String>? selectedInterestsList;
    List<String> InterestsList = ["Reading", "Art", "Music", "Watching Movies", "Dancing", "Singing", "Cooking", "Sleeping", "Travelling"];

    List<String>? selectedHobbiesList;
    List<String> HobbiesList = ["Reading", "Art", "Music", "Watching Movies", "Dancing", "Singing", "Cooking", "Sleeping", "Travelling"];

    @override
    void initState() {
    // TODO: implement initState
    super.initState();
    _authService.get(user.email).then((value) => this.user = value );
    selectedLanguagesList = user.languages;
    selectedInterestsList = user.interests;
    selectedHobbiesList = user.hobbies;
  }


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
                                  image: FileImage(File(imagePath!) )
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
                  buildTextFieldn("Full Name", user.name, false,),
                  buildTextFieldp("Password", "********", true,),
                  buildTextFieldl("Location", user.location, false, ),
                  buildTextField1(context, "Hobbies",),
                  buildTextField2(context, "Interests",),
                  buildTextField3(context, "Work Experiance",),
                  buildTextField4(context, "Languages",),

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
                  onPressed: () {
                    _authService.edit(user.email,
                        _namecontroller.text.toString().trim(),
                        _passwordcontroller.text.toString().trim(),
                        _locationcontroller.text.toString().trim(),
                        selectedLanguagesList!, selectedHobbiesList!, selectedInterestsList!);

                  },
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

    Widget buildTextFieldn(String labelText, String placeholder, bool isPasswordTextField) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: TextField(
          controller: _namecontroller,
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

    Widget buildTextFieldp(String labelText, String placeholder, bool isPasswordTextField) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: TextField(
          controller: _passwordcontroller,
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

    Widget buildTextFieldl(String labelText, String placeholder, bool isPasswordTextField) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: TextField(
          controller: _locationcontroller,
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

    void _openLanguagesDialog() async {
      await FilterListDialog.display<String>(
        context,
        selectedTextBackgroundColor: UIGuide.COLOR1,
        headerTextColor: UIGuide.COLOR1,
        hideSelectedTextCount: true,
        applyButonTextBackgroundColor: UIGuide.COLOR1,
        listData: LanguagesList,
        selectedListData: selectedLanguagesList,
        height: 480,
        headlineText: "Add Languages",
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

    Widget setupFormContainer() {
      return Container(
        height: MediaQuery.of(context).size.height / 3, // Change as per your requirement
        width: MediaQuery.of(context).size.width / 2, // Change as per your requirement
        child: ListView(
          children: [

            TextField(
              controller: _startcontroller,
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.black,
                  letterSpacing: 0.24,
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                hintText: "Start-Year",
                hintStyle: TextStyle(
                    color: Color(0xffA6B0BD)
                ),
                fillColor: Colors.white,
                filled: true,

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
                floatingLabelBehavior: FloatingLabelBehavior.always,

              ),

            ),
            SizedBox(height: 10,),


            TextField(
              controller: _endcontroller,
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.black,
                  letterSpacing: 0.24,
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                hintText: "End-Year",
                hintStyle: TextStyle(
                    color: Color(0xffA6B0BD)
                ),
                fillColor: Colors.white,
                filled: true,

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
                floatingLabelBehavior: FloatingLabelBehavior.always,

              ),

            ),
            SizedBox(height: 10,),

            TextField(
              controller: _titlecontroller,
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.black,
                  letterSpacing: 0.24,
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                hintText: "Title",
                hintStyle: TextStyle(
                    color: Color(0xffA6B0BD)
                ),
                fillColor: Colors.white,
                filled: true,

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
                floatingLabelBehavior: FloatingLabelBehavior.always,

              ),

            ),

            SizedBox(height: 10,),
            TextField(
              controller: _companycontroller,
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.black,
                  letterSpacing: 0.24,
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                hintText: "Company",
                hintStyle: TextStyle(
                    color: Color(0xffA6B0BD)
                ),
                fillColor: Colors.white,
                filled: true,

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
                floatingLabelBehavior: FloatingLabelBehavior.always,

              ),

            ),

            SizedBox(height: 10,),
            TextField(
              controller: _descriptioncontroller,
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.black,
                  letterSpacing: 0.24,
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                hintText: "Description",
                hintStyle: TextStyle(
                    color: Color(0xffA6B0BD)
                ),
                fillColor: Colors.white,
                filled: true,

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
                floatingLabelBehavior: FloatingLabelBehavior.always,

              ),

            ),
          ],
        )
      );
    }



    _openWorkExperianceForm(BuildContext context){

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Row(
                children: [
                  Text('Add Experiance'),
                  SizedBox(width: 3,),
                  FlatButton(onPressed: (){}, child: Icon(Icons.add))
                ],
              ),
              content: setupFormContainer(),
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: (MediaQuery.of(context).size.width / 100) * 10 ),
                  child: Row(
                    children: [
                      OutlineButton(
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
                        onPressed: () { Navigator.of(context).pop(); },
                      ),
                      SizedBox(width: 10,),
                      RaisedButton(
                          onPressed: () {
                            _authService.addExperiance(_titlecontroller.text.toString().trim(),
                                _companycontroller.text.toString().trim(),
                                _descriptioncontroller.text.toString().trim(),
                                _startcontroller.text.toString().trim(),
                                _endcontroller.text.toString().trim(), user.id);

                          },
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
              ],
            );
          });
    }

    Widget setupAlertDialoadContainer() {
      return Container(
        height: MediaQuery.of(context).size.height / 2, // Change as per your requirement
        width: MediaQuery.of(context).size.width / 2, // Change as per your requirement
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Column(
                children: [
                  Text("2019-2021"),
                  Text("ASCII-AZKATECH"),
                  Text("h")
                ],
              )
            );
          },
        ),
      );
    }

    _openWorkExperianceDialog(BuildContext context){

      TextEditingController _workController = new TextEditingController();
      TextEditingController _dateController = new TextEditingController();

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Row(
                children: [
                  Text('Add Experiance'),
                  SizedBox(width: 3,),
                  FlatButton(onPressed: (){ _openWorkExperianceForm(context); }, child: Icon(Icons.add))
                ],
              ),
              content: setupAlertDialoadContainer(),
            );
          });
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


    Widget buildTextField3(context, String labelText) {
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
              onPressed: (){ _openWorkExperianceDialog(context); },
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

    Widget buildTextField4(context, String labelText) {
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
              onPressed: (){ _openLanguagesDialog(); },
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

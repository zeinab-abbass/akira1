import 'package:flutter/material.dart';
import 'package:frontend/models/Experiance.model.dart';
import 'package:frontend/models/User.model.dart';
import 'package:frontend/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  Future<User> register(name, username, email, password, phone, location) async {

    User list;
    var response = await http.post(
        Uri.parse(UIGuide.host + "/register"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': name,
          'username': username,
          'email': email,
          'password': password,
          'location': location,
          'phone': phone,
        })
    );

    if (response.statusCode == 201) {
      Map<String,dynamic> user = json.decode(response.body);
      print(user);
      list = User.fromJson(user);
      print(list);
      return list;
    }
    else {
      throw Exception('Failed to create user');
    }
  }


  Future<bool> validate(email) async {

    var response = await http.post(
        Uri.parse(UIGuide.host + "/validate"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
        })
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      bool res = json.decode(response.body)['result'];
      print(res);
      return res;
    }
    else {
      throw Exception('Failed to validate user');
    }
  }

  Future<int> edit(email, name, password, location, List<String> languages, List<String> hobbies, List<String> interests) async {

    var response = await http.post(
        Uri.parse(UIGuide.host + "/edit"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'email': email,
          'name': name,
          'location': location,
          'password': password,
          'languages': languages,
          'hobbies': hobbies,
          'interests': interests

        })
    );

    if (response.statusCode == 201 ) {
      int res = json.decode(response.body)['result']['ok'];
      print(res);
      return res;
    }
    else {
      throw Exception('Failed to update user');
    }
  }

  Future<User> get(email) async{

    var response = await http.post(
        Uri.parse(UIGuide.host + "/edit"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'email': email,

        })
    );

    if (response.statusCode == 201 ) {
      User res = User.fromJson(json.decode(response.body));
      print(res);
      return res;
    }
    else {
      throw Exception('Failed to get user');
    }

  }

  Future<Experiance> addExperiance(title, company, description, start_year, end_year, user) async {

    Experiance res;
    var response = await http.post(
        Uri.parse(UIGuide.host + "/addExperiance"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'company': company,
          'title': title,
          'description': description,
          'start_year': start_year,
          'end_year': end_year,
          'user': user
        })
    );

    if (response.statusCode == 201) {
      Map<String,dynamic> json1 = json.decode(response.body);
      res = Experiance.fromJson(json1);
      return res;
    }
    else {
      throw Exception('Failed to create experiance');
    }
  }

}



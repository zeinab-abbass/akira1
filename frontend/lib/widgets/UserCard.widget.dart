import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/models/User.model.dart';
import 'package:frontend/models/User.model.dart';
import 'package:frontend/screens/Chat.screen.dart';

class UserCard extends StatefulWidget {

  final User user;
  final User UserP;

  const UserCard({Key? key, required this.user, required this.UserP }) : super(key: key);

  @override
  _UserCardState createState() => _UserCardState(this.user, this.UserP);
}

class _UserCardState extends State<UserCard>{

  User user;
  User UserP;

  _UserCardState( this.user, this.UserP);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
      child: Card(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Container(
                    width: 80,
                    height: 80,
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
                          fit: BoxFit.contain,
                          image: FileImage(File(user.photo)),
                        )
                    ),
                  ),
                  title: Text(user.name),
                  subtitle: Text(user.username),
                  onTap: (){

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Chat(
                            user: UserP,
                            friend: user,
                          ),
                        )
                    );

                  },
                ),

              ]
          )
      ),
    );

  }

}
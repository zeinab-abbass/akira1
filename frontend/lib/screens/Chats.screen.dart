import 'package:flutter/material.dart';
import 'package:frontend/models/User.model.dart';
import 'package:frontend/services/auth.service.dart';
import 'package:frontend/widgets/UserCard.widget.dart';


class Chats extends StatefulWidget {
  static const String id = '/chats';
  static const routeName = '/chats';

  final User user;

  const Chats( {Key? key, required this.user, }) : super(key: key);

  @override
  _ChatsState createState() => _ChatsState(this.user);
}

class _ChatsState extends State<Chats>{

  User user;
  AuthService _authService = new AuthService();

  _ChatsState(this.user);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Chats"),
        ),
        body: FutureBuilder(
            future: _authService.users(),
            builder: (context, snapshot) {
              return snapshot.data != null
                  ? listUsers(snapshot.data)
                  : Center(child: CircularProgressIndicator());
            })
    );
  }

  Widget listUsers(users){
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index){
          return Column( children: [ SizedBox(height: 10,), UserCard(user: users[index], UserP: user) ] );
        }
    );
  }


}
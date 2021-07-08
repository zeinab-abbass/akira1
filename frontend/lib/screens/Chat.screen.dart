
import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/models/User.model.dart';
import 'package:frontend/screens/Chats.screen.dart';
import 'package:frontend/screens/Home.screen.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/widgets/ImageSendMessage.widget.dart';
import 'package:frontend/widgets/ImageReplyMessage.widget.dart';
import 'package:frontend/widgets/TxtReplyMessage.widget.dart';
import 'package:frontend/widgets/TxtSendMessage.widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../models/User.model.dart';
import '../models/Message.model.dart';

class Chat extends StatefulWidget {
  final User user;
  final User friend;
  Chat( {Key? key, required this.user, required this.friend,}) : super(key: key);

  @override
  _ChatState createState() => _ChatState(this.user, this.friend);
}

class _ChatState extends State<Chat> {

  String? _pickedImage;
  final User user;
  final User friend;
  IO.Socket? socket;
  List<Message> messages = [];
  final TextEditingController _messageController = new TextEditingController();
  ScrollController _scrollController = ScrollController();
  bool show = false;
  bool sendButton = false;
  bool micButton = true;
  FocusNode focusNode = FocusNode();

  String? imagepath;
  PickedFile? _imageFile;
  final _picker = ImagePicker();

  _ChatState(this.user, this.friend);

  @override
  void initState() {
    // TODO: implement initState

    //to make emoji button not focused when pressed will be focused
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });

    connect();
    super.initState();
  }

  //connect socket client to socket backend server
  void connect(){
    socket = IO.io("http://192.168.0.29:6060", <String,dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket!.connect();

    socket!.onConnect((data){
      print("Connected");

      socket!.on("message", (msg){
        setMessage("destination", msg["message"], "txt");
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      });

      socket!.on("image", (msg){
        setMessage("destination", msg["message"], "img");
        print(msg["message"]);
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      });
    });
    socket!.emit("signin", user.id);

    //test event &we have to listen this event on the back side
    socket!.emit("/test", "hello world!! test test");

  }

  void setMessage(String type, var message, String t) {
    Message messageModel = Message(type: type, message: message, type_file: t);

    if (!mounted) return;

    setState(() {
      messages.add(messageModel);
    });
  }

  void sendMessage(String message,String sourceId,String targetId) {
    setMessage("source", message, "txt");
    socket!.emit("message", {"message": message, "sourceId": sourceId, "targetId": targetId});

  }

  void sendImageMessage(var message,String sourceId,String targetId) {
    setMessage("source", message, "img");
    print("hello");
    print(message);
    socket!.emit("image", {"message": message, "sourceId": sourceId, "targetId": targetId});

  }

  void _pickImage() async {
    final imageSource = await showDialog<ImageSource>(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: Text("Select the image source"),
              actions: <Widget>[
                MaterialButton(
                  child: Text("Camera"),
                  onPressed: () => Navigator.pop(context, ImageSource.camera),
                ),
                MaterialButton(
                  child: Text("Gallery"),
                  onPressed: () => Navigator.pop(context, ImageSource.gallery),
                )
              ],
            )
    );

    if (imageSource != null) {
      _imageFile = await _picker.getImage(source: imageSource);
      if (_imageFile != null) {
        setState(()
        {
          _pickedImage = _imageFile!.path;
          _scrollController.animateTo(
              _scrollController
                  .position.maxScrollExtent,
              duration: Duration(
                  milliseconds: 300),
              curve: Curves.easeOut
          );
          sendImageMessage(_pickedImage, user.id, friend.id);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
        children: [
          Image.asset("assets/images/wallpaper.jpg", height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width, fit: BoxFit.cover),
          Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                leadingWidth: 100,
                titleSpacing: 0,
                leading: InkWell(
                  onTap: () {

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.black12,
                        radius: 20.0,
                        child: ClipOval(
                            child: Image.asset("assets/images/profile.png")
                        ),
                      ),
                    ],
                  ),
                ),

                title: InkWell(
                  onTap: () {

                  },

                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          friend.username,
                          style: TextStyle(
                            fontSize: 18.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

              ),

              body: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            controller: _scrollController,
                            itemCount: messages.length,
                            itemBuilder: (context, index) {
                              if (index == messages.length) {
                                return Container(
                                  height: 70,
                                );
                              }
                              if (messages[index].type == "source") {

                                if(messages[index].type_file == "txt")
                                  return TxtSendMessage(
                                    message: messages[index].message,
                                  );
                                else{
                                  return ImageSendMessage(image: _pickedImage!);
                                }
                              }
                              else {
                                if(messages[index].type_file == "txt")
                                  return TxtReplyMessage(
                                    message: messages[index].message,
                                  );
                                else{
                                  return ImageReplyMessage(image: _pickedImage!);
                                }

                              }
                            },
                          ),
                        ),

                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width - 60,
                                    child: Card(
                                      margin: EdgeInsets.only(left: 2, right: 2, bottom: 8),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: TextFormField(
                                        controller: _messageController,
                                        focusNode: focusNode,
                                        textAlignVertical: TextAlignVertical.center,
                                        keyboardType: TextInputType.multiline,
                                        maxLines: 5,
                                        minLines: 1,
                                        onChanged: (value) {
                                          if (value.length > 0) {
                                            setState(() {
                                              sendButton = true;
                                              micButton = false;
                                            });
                                          } else {
                                            setState(() {
                                              sendButton = false;
                                              micButton = true;
                                            });
                                          }
                                        },
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Type a message",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          //emoji icon button
                                          prefixIcon: IconButton(
                                            icon: Icon(
                                              Icons.keyboard,
                                            ),
                                            onPressed: () {
                                              if (!show) {
                                                focusNode.unfocus();
                                                focusNode.canRequestFocus = false;
                                              }
                                              setState(() {
                                                show = !show;
                                              });
                                            },
                                          ),

                                          suffixIcon: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CircleAvatar(
                                                radius: 20,
                                                backgroundColor: UIGuide.COLOR2,
                                                child: FloatingActionButton(
                                                  onPressed: _pickImage,
                                                  child: Icon(Icons.image),
                                                ),
                                              ),
                                            ],
                                          ),
                                          contentPadding: EdgeInsets.all(5),
                                        ),
                                      ),

                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 8,
                                      right: 2,
                                      left: 2,
                                    ),
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: UIGuide.COLOR2,
                                      child: IconButton(
                                        icon: Icon(
                                          sendButton ? Icons.send : Icons.mic,
                                          color: Colors.white,
                                        ),
                                        onPressed: () async {
                                          if (sendButton) {
                                            _scrollController.animateTo(
                                                _scrollController
                                                    .position.maxScrollExtent,
                                                duration: Duration(
                                                    milliseconds: 300),
                                                curve: Curves.easeOut
                                            );
                                            sendMessage(_messageController.text,
                                                user.id, friend.id);
                                            _messageController.clear();
                                          }
                                          else{

                                          }
                                        },
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
              )

        ]
    );
  }
}
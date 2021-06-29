
class User {
  String id;
  String name;
  String username;
  String password;
  String email;
  String phone;
  String location;
  String type;
  bool status;
  List<String> languages;
  List<String> hobbies;
  List<String> interests;
  List<dynamic> experiances;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
    required this.location,
    required this.languages,
    required this.interests,
    required this.experiances,
    required this.hobbies,
    required this.status,
    required this.type
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['result']['_id'],
        name: json['result']['name'],
        username: json['result']['username'],
        email: json['result']['email'],
        phone: json['result']["phone"],
        password: json['result']["password"],
        location: json['result']["location"],
        status: json['result']["status"],
        type: json['result']["type"],
        languages:  List<String>.from(json['result']["languages"]),
        experiances: json['result']["experiance"],
        hobbies:  List<String>.from(json['result']["hobbies"]),
        interests:  List<String>.from(json['result']["interests"]),
    );
  }
}


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
        id: json['_id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        phone: json["phone"],
        password: json["password"],
        location: json["location"],
        status: json["status"],
        type: json["type"],
        languages:  List<String>.from(json["languages"]),
        experiances: json["experiance"],
        hobbies:  List<String>.from(json["hobbies"]),
        interests:  List<String>.from(json["interests"]),
    );
  }
}

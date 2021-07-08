
class User {
  String id;
  String name;
  String username;
  String password;
  String email;
  String phone;
  String location;
  String type;
  String photo;
  bool status;
  List<String> languages;
  List<String> hobbies;
  List<String> interests;
  List<dynamic> experiences;

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
    required this.experiences,
    required this.hobbies,
    required this.status,
    required this.type,
    required this.photo
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
        photo: json["photo"],
        languages:  List<String>.from(json["languages"]),
        experiences: json["experience"],
        hobbies:  List<String>.from(json["hobbies"]),
        interests:  List<String>.from(json["interests"]),
    );
  }
}

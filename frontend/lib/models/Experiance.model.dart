import 'User.model.dart';

class Experiance {
  String id;
  String startDate;
  String endDate;
  String company;
  String description;
  String user;

  Experiance({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.company,
    required this.description,
    required this.user
  });

  factory Experiance.fromJson(Map<String, dynamic> json) {
    return Experiance(
        id: json['result']['_id'],
        startDate: json['result']['start_year'],
        endDate: json['result']['end_year'],
        company: json['result']['company'],
        description: json['result']['description'],
        user: json['result']['user']
    );
  }
}

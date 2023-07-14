import 'dart:convert';

class Birthday {
  late String name;
  late DateTime date;

  Birthday({ required this.name, required this.date });

  String toJson() {
    Map<String, dynamic> jsonMap = {
      'name': name,
      'date': date.toIso8601String(),
    };

    String jsonString = jsonEncode(jsonMap);

    return jsonString;
  }

  String getFormattedDate() {
    String formattedDate = '${date.month}/${date.day}/${date.year}';

    return formattedDate;
  }

  factory Birthday.fromJson(Map<String, dynamic> json) {
    return Birthday(
      name: json['name'],
      date: json['date'],
    );
  }
}
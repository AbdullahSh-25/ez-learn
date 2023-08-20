import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Lecture {
  final String id;
  final String url;
  final String date;
  final int expectedPeriod;
  final int type;
  Lecture({
    required this.id,
    required this.url,
    required this.date,
    required this.expectedPeriod,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'url': url,
      'date': date,
      'expectedPeriod': expectedPeriod,
      'type': type,
    };
  }

  factory Lecture.fromMap(Map<String, dynamic> map) {
    return Lecture(
      id: map['id'] as String,
      url: map['url'] as String,
      date: map['date'] as String,
      expectedPeriod: map['expectedPeriod'] as int,
      type: map['type'] as int,
    );
  }
}

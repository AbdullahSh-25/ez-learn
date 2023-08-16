import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SubjectModel {
  final String id;
  final String name;
  final String description;
  final int year;
  final int semester;
  SubjectModel({
    required this.id,
    required this.name,
    required this.description,
    required this.year,
    required this.semester,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'year': year,
      'semester': semester,
    };
  }

  factory SubjectModel.fromMap(Map<String, dynamic> map) {
    return SubjectModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      year: map['year'] as int,
      semester: map['semester'] as int,
    );
  }
}

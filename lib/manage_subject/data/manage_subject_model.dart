import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ManageSubjectModel {
  final String id;
  final String name;
  final String description;
  final int year;
  final int semester;
  final bool isOptional;
  final String marks;
  ManageSubjectModel({
    required this.id,
    required this.name,
    required this.description,
    required this.year,
    required this.semester,
    required this.isOptional,
    required this.marks,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'year': year,
      'semester': semester,
      'isOptional': isOptional,
      'mark': marks,
    };
  }

  factory ManageSubjectModel.fromMap(Map<String, dynamic> map) {
    return ManageSubjectModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      year: map['year'] as int,
      semester: map['semester'] as int,
      isOptional: map['isOptional'] as bool,
      marks: map['mark'] as String,
    );
  }
}

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Video {
  final String id;
  final String url;
  final String coverUrl;
  final String date;
  final int duration;
  Video({
    required this.id,
    required this.url,
    required this.coverUrl,
    required this.date,
    required this.duration,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'url': url,
      'coverUrl': coverUrl,
      'date': date,
      'duration': duration,
    };
  }

  factory Video.fromMap(Map<String, dynamic> map) {
    return Video(
      id: map['id'] as String,
      url: map['url'] as String,
      coverUrl: map['coverUrl'] as String,
      date: map['date'] as String,
      duration: map['duration'] as int,
    );
  }
}

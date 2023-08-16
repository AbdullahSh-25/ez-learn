// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class EditProfileEvent extends ProfileEvent {
  final String firstName;
  final String lastName;
  final String universityId;
  final int year;
  final String? avtarUrl;
  EditProfileEvent({
    required this.firstName,
    required this.lastName,
    required this.universityId,
    required this.year,
    this.avtarUrl,
  });
}

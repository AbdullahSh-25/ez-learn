// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

class AuthState {
  final BlocStatus status;

  AuthState({
    this.status = const BlocStatus.initial(),
  });

  AuthState copyWith({
    BlocStatus? status,
  }) {
    return AuthState(
      status: status ?? this.status,
    );
  }
}

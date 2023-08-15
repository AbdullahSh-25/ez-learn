import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:equatable/equatable.dart';
import 'package:ez_learn/core/common/helper/bloc_status.dart';
import 'package:ez_learn/features/auth/application/auth_facade.dart';
import 'package:ez_learn/features/auth/domain/entities/signup_param.dart';
import 'package:ez_learn/features/auth/domain/entities/user_param.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthFacade _facade;

  AuthBloc({required AuthFacade facade})
      : _facade = facade,
        super(AuthState()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        await login(event, emit);
      } else if (event is SignUpEvent) {
        await signUp(event, emit);
      }
    });
  }

  login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: const BlocStatus.initial()));
    final result = await _facade.login(UserParam(universcityId: event.univercityId, password: event.password));
    result.fold(
      (left) {
        emit(state.copyWith(status: BlocStatus.fail(error: left)));
        BotToast.showText(text: left);
      },
      (right) => emit(state.copyWith(status: const BlocStatus.success())),
    );
  }

  signUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: const BlocStatus.loading()));
    final result = await _facade.create(
        signupParam: SignupParam(
      avatar: event.avatar,
      firstName: event.firstName,
      lastName: event.lastName,
      universityId: event.universityId,
      password: event.password,
    ));
    result.fold(
      (left) {
        emit(state.copyWith(status: BlocStatus.fail(error: left)));
        BotToast.showText(text: left);
      },
      (right) => emit(state.copyWith(status: const BlocStatus.success())),
    );
  }
}

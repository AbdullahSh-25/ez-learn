import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:equatable/equatable.dart';
import 'package:ez_learn/core/common/injection/injection.dart';
import 'package:ez_learn/features/auth/data/datasources/local/auth_local.dart';
import 'package:ez_learn/features/edit_profile/application/profile_facade.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileFacade _facade;

  ProfileBloc({required ProfileFacade facade})
      : _facade = facade,
        super(ProfileState()) {
    on<ProfileEvent>((event, emit) async {
      if (event is EditProfileEvent) {
        await editProfile(event, emit);
      }
    });
  }

  editProfile(EditProfileEvent event, Emitter<ProfileState> emit) async {
    BotToast.showLoading();
    final editingUser = getIt<AuthLocal>().getUser()!.copyWith(
          firstName: event.firstName,
          lastName: event.lastName,
          year: event.year,
          avatarUrl: event.avtarUrl,
          universityId: event.universityId,
        );

    final result = await _facade.modifyProfile(editingUser);
    result.fold(
      (left) => BotToast.showText(text: 'لم يتم التعديل!'),
      (right) {
        getIt<AuthLocal>().setUser(editingUser);
        BotToast.showText(text: 'تم التعديل بنجاح');
      },
    );
    BotToast.closeAllLoading();
  }
}

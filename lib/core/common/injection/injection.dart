import 'package:ez_learn/core/common/injection/src/auth_injection.dart';
import 'package:ez_learn/core/common/injection/src/general_injection.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> initInjection() async {
  await generalInjection();
  authInjection();
}

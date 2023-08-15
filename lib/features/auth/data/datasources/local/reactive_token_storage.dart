import 'dart:async';
import 'dart:convert';

import 'package:dio_refresh_bot/dio_refresh_bot.dart';
import 'package:ez_learn/core/common/utils/storage_service.dart';
import 'package:ez_learn/core/constant/keys.dart';
import 'package:ez_learn/features/auth/data/models/auth_model.dart';

class ReactiveTokenStorage extends BotMemoryTokenStorage<AuthTokenModel>
    with RefreshBotMixin<AuthTokenModel> {
  final StorageService storageService;

  ReactiveTokenStorage(this.storageService) : super();

  @override
  FutureOr<void> delete([String? message]) async {
    await storageService.remove(kTokenKey);
    super.delete(message);
  }

  @override
  FutureOr<void> write(AuthTokenModel? token) async {
    if (token != null) {
      await storageService.setString(kTokenKey, json.encode(token.toMap()));
    } else {
      await storageService.remove(kTokenKey);
    }
    super.write(token);
  }

  @override
  AuthTokenModel? read() {
    final String? string = storageService.getString(kTokenKey);
    if (string != null) {
      return AuthTokenModel.fromMap(json.decode(string));
    }
    return null;
  }
}
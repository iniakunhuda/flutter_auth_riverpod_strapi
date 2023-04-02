import 'dart:convert';

import 'package:auth_riverpod/features/user/data/error_data.dart';
import 'package:auth_riverpod/features/user/data/user_data.dart';
import 'package:auth_riverpod/features/user/repositories/auth_repository.dart';
import 'package:auth_riverpod/features/user/repositories/user_repository.dart';
import 'package:auth_riverpod/features/user/requests/user_request.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserController extends StateNotifier<AsyncValue<dynamic>> {
  Ref ref;

  UserController({
    required this.ref,
  }) : super(const AsyncData(null));

  Future<Either<String, bool>> login(
      {required String email, required String password}) async {
    state = const AsyncLoading();

    UserRequest userReq = UserRequest(identifier: email, password: password);
    final response = await ref.read(userRepositoryProvider).login(userReq);
    if (response is ErrorResponse) {
      return Left(response.error.message);
    } else {
      ref.read(setAuthStateProvider.notifier).state = response;
      ref.read(setIsAuthenticatedProvider(true));
      ref.read(setAuthenticatedUserProvider(response.user));
      return const Right(true);
    }

    // final prettyString =
    //     JsonEncoder.withIndent('  ').convert(response.toJson());
    // debugPrint(prettyString);
  }
}

final userControllerProvider =
    StateNotifierProvider<UserController, AsyncValue<dynamic>>((ref) {
  return UserController(ref: ref);
});

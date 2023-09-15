import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../models/custom_error_model.dart';
import '../../../models/user_model.dart';
import '../auth_repos/auth_repos.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository authRepository;
  SignUpBloc({required this.authRepository}) : super(SignUpState.initial()) {
    on<SignUpWithCredential>(_mapSignInWithCredentialToState);
  }

  FutureOr<void> _mapSignInWithCredentialToState(
      SignUpWithCredential event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(status: SignUpStatus.submitting));

    try {
      await authRepository.signUp(user: event.user, password: event.password);

      emit(state.copyWith(status: SignUpStatus.success));
    } on CustomError catch (err) {
      emit(state.copyWith(
        status: SignUpStatus.error,
        error: err,
      ));

      debugPrint(state.toString());
    }
  }
}

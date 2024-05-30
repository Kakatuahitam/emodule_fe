import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

// import 'package:emodule_fe/domain/usecase/authentication.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'empty_state.dart';

class EmptyCubit extends Cubit<emptyState> {
  EmptyCubit() : super(InitialState());
  // EmptyCubit({required AuthenticationUseCase authenticationUseCase}) : _authenticationUseCase = authenticationUseCase, super(InitialState());
  // final AuthenticationUseCase _authenticationUseCase;

  // Future checkIfLoggedIn() async {
  //   final result = await _storage.read(key: 'isLoggedIn');
  //   bool isLoggedIn = result == "true";
  //   if (isLoggedIn) {
  //     emit(LoggedInState());
  //   } else {
  //     emit(LoggedOutState());
  //   }
  //
  //   return isLoggedIn;
  // }

  // Future loggingOut() async {
  //
  //   // final result = await _storage.write(key: 'isLoggedIn', value: 'false');
  // }

  Future empty() async {
    // final result = await _authenticationUseCase.empty(username, password);
    //
    // result.fold(
    //   (failure) async {
    //     emit(emptyFailed(failure));;
    //   },
    //   (response) async {
    //     emit(emptySuccess(response.data));
    //     // print(response.data);
    //     // return response.data;
    //   }
    // );
    print("dummy");

    // final result = await _storage.write(key: 'isLoggedIn', value: 'true');
    // emit(LoggedInState());
  }
}

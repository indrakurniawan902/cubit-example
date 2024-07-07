import 'package:bloc_example/model/user_model.dart';
import 'package:bloc_example/services/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void getAllUSer() async {
    emit(UserLoading());
    try {
      final data = await UserService.getAllUSer();
      emit(UserSuccess(data));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}

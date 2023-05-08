import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_mini_project/models/add_user_model.dart';
import 'package:flutter_mini_project/models/form_add_model.dart';
import 'package:flutter_mini_project/models/user_detail_model.dart';
import 'package:flutter_mini_project/models/user_detail_model.dart';
import 'package:flutter_mini_project/models/user_model.dart';
import 'package:flutter_mini_project/services/user_service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is UserGet) {
        try {
          emit(UserLoading());
          final users = await UserService().getUsers();
          emit(UserSuccess(users));
        } catch (e) {
          emit(UserFailed(e.toString()));
        }
      }

      if (event is UserDetail) {
        try {
          emit(UserLoading());
          final user = await UserService().getUserById(event.id);
          emit(UserDetailSuccess(user));
        } catch (e) {
          emit(UserFailed(e.toString()));
        }
      }

      if (event is UserCreate) {
        try {
          emit(UserLoading());
          final user = await UserService().addUser(event.user);
          emit(UserAddSuccess(user));
        } catch (e) {
          emit(UserFailed(e.toString()));
        }
      }
    });
  }
}

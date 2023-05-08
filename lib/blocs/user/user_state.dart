// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserFailed extends UserState {
  final String e;

  const UserFailed(this.e);

  @override
  List<Object> get props => [e];
}

class UserSuccess extends UserState {
  final List<UserModel> users;
  const UserSuccess(this.users);

  @override
  List<Object> get props => [users];
}

class UserDetailSuccess extends UserState {
  final UserDetailModel user;
  const UserDetailSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class UserAddSuccess extends UserState {
  final AddUserModel user;
  const UserAddSuccess(this.user);

  @override
  List<Object> get props => [user];
}

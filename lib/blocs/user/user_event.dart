// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserGet extends UserEvent {}

class UserCreate extends UserEvent {
  final FormAddModel user;
  const UserCreate(this.user);

  @override
  List<Object> get props => [user];
}

class UserDetail extends UserEvent {
  final int id;
  const UserDetail(this.id);

  @override
  List<Object> get props => [id];
}

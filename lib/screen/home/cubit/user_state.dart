part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserSuccess extends UserState {
  final List<UserModel> allUser;
  const UserSuccess(this.allUser);

  @override
  List<Object> get props => [allUser];
}

final class UserError extends UserState {
  final String error;

  const UserError(this.error);

  @override
  List<Object> get props => [error];
}

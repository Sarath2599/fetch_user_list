part of 'user_list_cubit.dart';

@immutable
sealed class UserListState {}

final class UserListInitial extends UserListState {}

final class UserListLoading extends UserListState {}

final class UserListLoaded extends UserListState {
  final List<UserDataEntity> users;
  final List<UserDataEntity> filteredUsers;

  UserListLoaded(this.users, {List<UserDataEntity>? filteredUsers})
      : filteredUsers = filteredUsers ?? users;
}

final class UserListError extends UserListState {
  final String message;

  UserListError(this.message);
}
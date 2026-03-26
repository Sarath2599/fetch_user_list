import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entity/user_data_entity.dart';
import '../../../domain/use_case/user_data_use_case.dart';

part 'user_list_state.dart';

class UserListCubit extends Cubit<UserListState> {
  final UserDataUseCase userDataUseCase;

  UserListCubit({required this.userDataUseCase}) : super(UserListInitial());

  Future<void> fetchUsers() async {
    emit(UserListLoading());
    try {
      final users = await userDataUseCase.fetchUserData();
      emit(UserListLoaded(users));
    } catch (e) {
      emit(UserListError(e.toString()));
    }
  }

  void searchUsers(String query) {
    final current = state;
    if (current is! UserListLoaded) return;
    if (query.isEmpty) {
      emit(UserListLoaded(current.users));
      return;
    }
    final q = query.toLowerCase();
    final filtered = current.users
        .where((u) =>
            (u.name?.toLowerCase().contains(q) ?? false) ||
            (u.email?.toLowerCase().contains(q) ?? false))
        .toList();
    emit(UserListLoaded(current.users, filteredUsers: filtered));
  }
}

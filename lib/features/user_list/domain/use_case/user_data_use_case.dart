import '../entity/user_data_entity.dart';
import '../repository/user_data_repository.dart';

class UserDataUseCase {
  final UserDataRepository repository;

  UserDataUseCase({required this.repository});

  Future<List<UserDataEntity>> fetchUserData() async {
    return await repository.fetchUserData();
  }
}

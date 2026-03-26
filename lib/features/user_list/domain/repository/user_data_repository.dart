import '../entity/user_data_entity.dart';

abstract class UserDataRepository {
  Future<List<UserDataEntity>> fetchUserData();
}
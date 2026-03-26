import 'dart:developer';

import 'package:user_data_fetch/features/user_list/domain/entity/user_data_entity.dart';

import '../../domain/repository/user_data_repository.dart';
import '../data_source/data_source.dart';

class UserDataRepositoryImpl extends UserDataRepository {
  final UserDataDataSource dataSource;

  UserDataRepositoryImpl({required this.dataSource});
  @override
  Future<List<UserDataEntity>> fetchUserData() async {
    try {
      return await dataSource.fetchUserData();
    } catch (e) {
      log('Error fetching user data: $e');
      rethrow;
    }
  }
}
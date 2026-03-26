import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/user_list/data/data_source/data_source.dart';
import 'features/user_list/data/repository/user_data_repository_impl.dart';
import 'features/user_list/domain/use_case/user_data_use_case.dart';
import 'features/user_list/presentation/cubit/user_list/user_list_cubit.dart';
import 'features/user_list/presentation/screens/user_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => UserListCubit(
          userDataUseCase: UserDataUseCase(
            repository: UserDataRepositoryImpl(
              dataSource: UserDataDataSourceImpl(),
            ),
          ),
        ),
        child: const UserListScreen(),
      ),
    );
  }
}
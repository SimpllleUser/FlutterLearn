import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/bloc/user_bloc.dart';
import 'package:myapp/cubit/user_cubit.dart';
import 'package:myapp/services/user_repository.dart';

import '../bloc/user_event.dart';
import '../widgets/action_buttons.dart';
import '../widgets/user_list.dart';

class HomePage extends StatelessWidget {
  final userRepository = UserRepository();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<UserCubit>(
      create: (context) => UserCubit(userRepository),
      child: BlocProvider(
        create: (context) =>
            UserBloc(userRepository: context.read<UserRepository>())
              ..add(UserLoadEvent()),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('User List'),
            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              ActionButtons(),
              Expanded(child: UserList()),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/bloc/user_bloc.dart';
import 'package:myapp/bloc/user_event.dart';
import 'package:myapp/cubit/user_cubit.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final UserBloc userBloc = BlocProvider.of<UserBloc>(context, listen: false);
    // final UserBloc userBloc = context.read<UserBloc>();
    // final UserBloc userBloc = BlocProvider.of<UserBloc>(context, listen: true);
    // final UserBloc userBloc = context.watch<UserBloc>();
    final UserCubit userCubit = context.read<UserCubit>();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            userCubit.fetchUsers();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
          ),
          child: const Text('Load'),
        ),
        const SizedBox(width: 8.0),
        ElevatedButton(
          onPressed: () {
            userCubit.clearUsers();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
          ),
          child: const Text('Clear'),
        ),
      ],
    );
  }
}

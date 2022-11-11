import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/bloc/user_state.dart';

import '../models/user.dart';
import '../services/user_repository.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;

  UserCubit(this.userRepository) : super(UserEmptyState());

  Future<void> fetchUsers() async {
    try {
      emit(UserLoadingState());
      final List<User> loadedUserList = await userRepository.getAllUsers();
      emit(UserLoadedState(loadedUser: loadedUserList));
    } catch (_) {
      emit(UserErrorState());
    }
  }

  Future<void> clearUsers() async {
    emit(UserEmptyState());
  }
}

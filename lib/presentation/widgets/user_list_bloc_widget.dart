import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/user_list_response.dart';
import '../business_logic/blocs/user_list_bloc/bloc/user_list_bloc_bloc.dart';

class UserListBlocWidget extends StatefulWidget {
  UserListBlocWidget(BuildContext context, List<EmployeeData> rooms,
      {super.key});

  @override
  State<UserListBlocWidget> createState() => _UserListBlocWidgetState();
}

class _UserListBlocWidgetState extends State<UserListBlocWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserListBlocBloc, UserListBlocState>(
        builder: (context, state) {
      if (state is Loading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is Failure) {
        return Center(
          child: Text(state.toString()),
        );
      } else if (state is Success) {
        return Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: UserListBlocWidget(context, state.users),
        );
      } else {
        return const SizedBox();
      }
    });
  }
}

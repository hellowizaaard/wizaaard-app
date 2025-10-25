import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/blocs/auth_bloc/auth_bloc.dart';
import '../../business_logic/blocs/auth_bloc/auth_state.dart';
import '../../business_logic/cubits/internet_cubit.dart';
class RoomScreen extends StatefulWidget {
  const RoomScreen({super.key});

  @override
  State<RoomScreen> createState() => _MeetingRoomState();
}

class _MeetingRoomState extends State<RoomScreen> {
  @override
  void initState() {
    super.initState();

    final authState = context.read<AuthBloc>().state;
    if (authState is AuthAuthorized) {
     // context.read<RoomBloc>().add(GetRoomList(apiToken: authState.token));
    }
  }

  // void _openBottomSheet(RoomData roomData) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (ctx) => RoomSheet(roomData: roomData),
  //   );
  // }

  Future<void> _refreshData() async {
    await Future.delayed(const Duration(seconds: 2));

    final authState = context.read<AuthBloc>().state;
    if (authState is AuthAuthorized) {
      //context.read<RoomBloc>().add(GetRoomList(apiToken: authState.token));
    }
  }

  static List<String> img = [
    'assets/logo/room1.png',
    'assets/logo/room2.png',
    'assets/logo/room3.png',
    'assets/logo/room4.png',
  ];

  static const _iconList = <IconData>[
    Icons.cake,
    Icons.add_location_sharp,
    Icons.zoom_in_outlined,
    Icons.auto_awesome_motion,
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<InternetCubit, InternetState>(
          listener: (context, state) {
            if (state is InternetDisconnected) {
              String errorMessage = "No Internet Connection!";

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(errorMessage),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state is InternetConnected) {
              final authState = context.read<AuthBloc>().state;
              if (authState is AuthAuthorized) {
                // context
                //     .read<RoomBloc>()
                //     .add(GetRoomList(apiToken: authState.token));
              }
            }
          },
        ),
      ],
      child: Text('data'),
    );
  }


  String getRandomData(List<String> dataList) {
    Random random = Random();
    int randomIndex = random.nextInt(dataList.length);
    return dataList[randomIndex];
  }
}

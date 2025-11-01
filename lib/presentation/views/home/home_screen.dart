import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/theme/app_theme.dart';
import '../../business_logic/cubits/internet_cubit.dart';
import '../../widgets/home_card_content_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    // Add logic to retrieve the token from AuthBloc and initialize RoomBloc
    loadDashboardAPIs();
  }

  Future<void> _refreshData() async {
    await Future.delayed(const Duration(seconds: 2));

    loadDashboardAPIs();
  }

  loadDashboardAPIs() {
    // final authState = context.read<AuthBloc>().state;
    // if (authState is AuthAuthorized) {
    //   context
    //       .read<DashboardDataBloc>()
    //       .add(GetDashboardList(apiToken: authState.token));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<InternetCubit, InternetState>(
          listener: (context, state) {
            if (state is InternetDisconnected) {
              String errorMessage = "No Internet Connection!";
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.red,
              ));
            } else if (state is InternetConnected) {
              loadDashboardAPIs();
            }
          },
        ),
        
      ],
      child: Column(
        children: [
          _buildTopView(),
          _buildLoadingView()

        ],
      )
      
    );
  }

  Widget _buildLoadingView() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 140,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
            ),
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return const HomeCardContentWidget(
                    title: "Total Meeting",
                    imagePath: "assets/logo/Group.svg",
                    count: '0',
                  );
                case 1:
                  return const HomeCardContentWidget(
                    title: "Completed",
                    imagePath: "assets/logo/Group-1.svg",
                    count: '0',
                  );
                case 2:
                  return const HomeCardContentWidget(
                    title: "Upcoming",
                    imagePath: "assets/logo/Group-3.svg",
                    count: '0',
                  );
                case 3:
                  return const HomeCardContentWidget(
                    title: "Pending",
                    imagePath: "assets/logo/Group-4.svg",
                    count: '0',
                  );
                default:
                  return const SizedBox(); // Placeholder, you can customize as needed
              }
            },
            itemCount: 4, // Always display 4 items
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
        ),
      ],
    );
  }

  Widget _buildTopView() {
    return Container(
      width: double.infinity, // full width
      decoration: BoxDecoration(
        color: AppColorTheme.primaryDark,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 3),
            blurRadius: 8,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Top Logo
          Image.asset(
              'assets/icons/app_logo.png',
              height: 28,
            ),

          const SizedBox(height: 24),
          buildWelcomeText("Ramananda Sarkar"),
          const SizedBox(height: 16),
          // 🔹 Subtitle Text
          const Text(
            "Let's complete your digital profile fully and express your professional life to the world...",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }


  Widget buildWelcomeText(String name) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'Welcome back, ',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 20,
            ),
          ),
          TextSpan(
            text: name,
            style:  TextStyle(
              color: AppColorTheme.primary,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }


}

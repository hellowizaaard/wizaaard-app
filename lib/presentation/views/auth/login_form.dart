import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/routes/app_page.dart';
import '../../../config/theme/app_theme.dart';
import '../../../data/session_manager/user_prefs_manager.dart';
import '../../business_logic/blocs/login_bloc/login_bloc.dart';
import '../../business_logic/cubits/internet_cubit.dart';
import '../../widgets/ddc_bottomlogo_widget.dart';

class LoginForm extends StatefulWidget {
  final UserPrefsManager userPrefsManager;

  LoginForm({super.key, required this.userPrefsManager});

  @override
  State<LoginForm> createState() => _LoginFormState(userPrefsManager);
}

class _LoginFormState extends State<LoginForm> {
  final UserPrefsManager userPrefsManager;

  //final _deviceToken = MessagingService.fcmToken.toString();

  _LoginFormState(this.userPrefsManager);

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final String assetName = 'assets/logo/logo.png';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    userPrefsManager.storeFirstIntro(true);
  }

  bool passToggle = true;
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // Dispose the focus nodes
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Listen for focus changes and update the visibility of the logo
    _usernameFocusNode.addListener(() {
      setState(() {});
    });

    _passwordFocusNode.addListener(() {
      setState(() {});
    });

    // Determine the visibility of the logo
    final bool isLogoVisible =
        !_usernameFocusNode.hasFocus && !_passwordFocusNode.hasFocus;
    onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
        employeeId: _usernameController.text,
        password: _passwordController.text,
      ));
    }

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
            }
          },
        ),
        BlocListener<LoginBloc, LoginState>(listener: (context, state) {
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error.toString()),
                backgroundColor: Colors.red,
              ),
            );
          }

          if (state is LoginInitial) {
            // print("login start---");
          }

          if (state is EmptyEntry) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Enter Employee ID or Password!"),
                backgroundColor: Colors.red,
              ),
            );
          }

          if (state is LoginSuccess) {
            // Navigate to the MainScreen after successful login

            // context.read<NotificationBloc>().add(
            //       NotificationButtonPressed(
            //         apiToken: state.token,
            //         deviceToken: _deviceToken,
            //       ),
            //     );

            // userPrefsManager.setNotificationState(true);

           // MessagingService().subscribeToNotifications();

            Navigator.of(context).pushReplacementNamed(
              Pages.home,
            );
          }
        }),
      ],
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      child: Stack(
                        children: [
                          Visibility(
                            visible: isLogoVisible,
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.1),
                                    child: SvgPicture.asset(
                                      'assets/logo/group_1.svg',
                                      height: 200.0,
                                      width: 200.0,
                                      allowDrawingOutsideViewBox: true,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(25.0),
                                    child: TextFormField(
                                      controller: _usernameController,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        labelText: 'Employee ID',
                                      ),
                                      validator: (value) {
                                        if (value.toString().isEmpty) {
                                          return "Enter Employee ID";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(25, 0, 25, 0),
                                    child: TextFormField(
                                      controller: _passwordController,
                                      obscureText: passToggle,
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        labelText: 'Password',
                                        suffix: InkWell(
                                          onTap: () {
                                            setState(() {
                                              passToggle = !passToggle;
                                            });
                                          },
                                          child: Icon(passToggle
                                              ? Icons.visibility
                                              : Icons.visibility_off),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Enter Password';
                                        } else if (_passwordController
                                                .text.length <
                                            6) {
                                          return 'Password should be more that 6 characters';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 25.0, top: 15),
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pushNamed(
                                              Pages.forgot_pass,
                                            );
                                          },
                                          child: Text(
                                            'Forgot Password',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: AppColorTheme.primary,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 32.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 45,
                                          child: state is LoginLoading
                                              ? const Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Center(
                                                        child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          height: 36.0,
                                                          width: 36.0,
                                                          child:
                                                              CupertinoActivityIndicator(),
                                                        )
                                                      ],
                                                    ))
                                                  ],
                                                )
                                              : ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    foregroundColor:
                                                        AppColorTheme.primary,
                                                    backgroundColor:
                                                        AppColorTheme.primary,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                    ),
                                                  ),
                                                  onPressed:
                                                      onLoginButtonPressed,
                                                  child: const Text(
                                                    "Sign In",
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 12.00),
                  child: DdcCustomWidget(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

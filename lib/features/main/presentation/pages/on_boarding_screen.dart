import 'package:flutter/material.dart';
import 'package:flutter_86_vazifa/features/main/presentation/blocs/main_bloc.dart';
import 'package:flutter_86_vazifa/features/main/presentation/blocs/main_event.dart';
import 'package:flutter_86_vazifa/features/main/presentation/blocs/main_state.dart';
import 'package:flutter_86_vazifa/features/main/presentation/pages/sign_up_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 454,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/gym_hall.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 340),
                child: Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 10,
                        blurRadius: 20,
                        color: Colors.black.withAlpha(175),
                      )
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "Start practicing the best workout programs based on your goals",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          InkWell(
            onTap: () {
              context.read<MainBloc>().add(ChengedStateEvent(statePosition: 1));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Row(
                spacing: 15,
                children: [
                  BlocBuilder<MainBloc, MainState>(
                    builder: (context, state) {
                      return Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          color:
                              state.acceptOne ? Colors.red : Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1,
                            color: state.acceptOne ? Colors.red : Colors.white,
                          ),
                        ),
                        child: Center(
                          child: state.acceptOne
                              ? Icon(
                                  Icons.check,
                                  size: 15,
                                )
                              : null,
                        ),
                      );
                    },
                  ),
                  Expanded(
                    child: Text(
                      'I agree to the processing of my personal data according to Privacy Policy (including, to sharing my personal data with third parties)',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              context.read<MainBloc>().add(ChengedStateEvent(statePosition: 2));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Row(
                spacing: 15,
                children: [
                  BlocBuilder<MainBloc, MainState>(
                    builder: (context, state) {
                      return Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          color:
                              state.acceptTwo ? Colors.red : Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1,
                            color: state.acceptTwo ? Colors.red : Colors.white,
                          ),
                        ),
                        child: Center(
                          child: state.acceptTwo
                              ? Icon(
                                  Icons.check,
                                  size: 15,
                                )
                              : null,
                        ),
                      );
                    },
                  ),
                  Expanded(
                    child: Text(
                      'I accept the Terms and Conditions of Use',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          BlocBuilder<MainBloc, MainState>(builder: (context, state) {
            return InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: state.acceptOne == true && state.acceptTwo
                  ? () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ));
                    }
                  : () {},
              child: Container(
                width: 327,
                height: 60,
                decoration: BoxDecoration(
                  gradient: state.acceptOne == true && state.acceptTwo == true
                      ? LinearGradient(
                          colors: [
                            Color(0xff1D9D53),
                            Color(0xff47F490),
                          ],
                        )
                      : null,
                  color: Color(0xffA6AAB4),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          }),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "By tapping Continue you agree to the Privacy Policy and Terms and Conditions of Use",
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}

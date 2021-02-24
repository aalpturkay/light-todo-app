import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:light_todo_app/constants/constants.dart';
import 'package:light_todo_app/cubits/onboard/onboard_cubit.dart';
import 'package:light_todo_app/presentation/Onboarding/widgets/onboard_page_content.dart';
import 'package:sizer/sizer.dart';

class OnBoardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardCubit(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              SizerUtil().init(constraints, orientation);
              return Scaffold(
                floatingActionButton: BlocBuilder<OnboardCubit, OnboardState>(
                  builder: (context, state) {
                    return FloatingActionButton(
                      onPressed: () {
                        context.read<OnboardCubit>().goNextPage();
                      },
                      backgroundColor: Constants.color2,
                      child: Icon(
                        context.read<OnboardCubit>().isLastPage
                            ? Icons.done
                            : Icons.arrow_forward_ios,
                        color: Constants.color3,
                      ),
                    );
                  },
                ),
                body: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 4.0.h,
                      ),
                      Text(
                        Constants.onBoardPageTitle,
                        style: GoogleFonts.exo2(
                          fontSize: 36,
                          color: Constants.color1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: BlocBuilder<OnboardCubit, OnboardState>(
                          builder: (context, state) {
                            return PageView.builder(
                              controller: context
                                  .read<OnboardCubit>()
                                  .state
                                  .pageController,
                              onPageChanged: (value) {
                                context
                                    .read<OnboardCubit>()
                                    .setCurrentPage(value);
                              },
                              itemBuilder: (context, index) =>
                                  OnboardPageContent(
                                imgPath:
                                    Constants.onBoardPageList[index].imagePath,
                                description: Constants
                                    .onBoardPageList[index].description,
                                orientation: orientation,
                                constraints: constraints,
                              ),
                              itemCount: Constants.onBoardPageList.length,
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                Constants.onBoardPageList.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 2,
                                  ),
                                  child:
                                      BlocBuilder<OnboardCubit, OnboardState>(
                                    builder: (context, state) {
                                      return buildDot(
                                          context, index, state.currentPage);
                                    },
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
              );
            },
          );
        },
      ),
    );
  }

  AnimatedContainer buildDot(context, index, int currentPage) {
    return AnimatedContainer(
      duration: Duration(
        milliseconds: 300,
      ),
      width: currentPage == index ? 20 : 10,
      height: 10,
      decoration: BoxDecoration(
        color: currentPage == index ? Constants.color1 : Constants.color2,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}

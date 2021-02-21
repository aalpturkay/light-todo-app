import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:light_todo_app/constants/constants.dart';
import 'package:light_todo_app/cubits/cubit/onboard_cubit.dart';
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
                floatingActionButton: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Constants.color2,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Constants.color3,
                  ),
                ),
                body: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 4.0.h,
                      ),
                      Text(
                        "LiTo'ya Hoşgeldin",
                        style: GoogleFonts.exo2(
                          fontSize: 36,
                          color: Constants.color1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: PageView.builder(
                          onPageChanged: (value) {
                            context.read<OnboardCubit>().setCurrentPage(value);
                          },
                          itemBuilder: (context, index) => OnboardPageContent(
                            imgPath: Constants.onBoardPageList[index].imagePath,
                            description:
                                Constants.onBoardPageList[index].description,
                          ),
                          itemCount: Constants.onBoardPageList.length,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            BlocBuilder<OnboardCubit, int>(
                              builder: (context, state) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    Constants.onBoardPageList.length,
                                    (index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 2,
                                      ),
                                      child: buildDot(context, index, state),
                                    ),
                                  ),
                                );
                              },
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

  AnimatedContainer buildDot(context, index, state) {
    return AnimatedContainer(
      duration: Duration(
        milliseconds: 300,
      ),
      width: state == index ? 20 : 10,
      height: 10,
      decoration: BoxDecoration(
        color: state == index ? Constants.color1 : Constants.color2,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}

class OnboardPageContent extends StatelessWidget {
  final String imgPath;
  final String description;
  const OnboardPageContent({
    Key key,
    this.imgPath,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SvgPicture.asset(
            imgPath,
            height: 45.0.h,
            width: 90.0.w,
          ),
        ),
        SizedBox(
          height: 2.0.h,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: GoogleFonts.lora(
            color: Constants.color1,
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}

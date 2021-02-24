import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:light_todo_app/constants/constants.dart';
import 'package:sizer/sizer.dart';

class OnboardPageContent extends StatelessWidget {
  final constraints, orientation;
  final String imgPath;
  final String description;
  const OnboardPageContent({
    Key key,
    this.imgPath,
    this.description,
    this.constraints,
    this.orientation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizerUtil().init(constraints, orientation);
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

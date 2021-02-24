import 'package:flutter/cupertino.dart';
import 'package:light_todo_app/data/model/onboard_page_model.dart';

class Constants {
  static final Color color1 = Color(0xFF071A52);
  static final Color color2 = Color(0xFF086972);
  static final Color color3 = Color(0xFFA7FF83);

  static final String onBoardPageTitle = "LiTo'ya Hoşgeldin";

  static final List<OnboardPageModel> onBoardPageList = [
    OnboardPageModel(
      description:
          'LiTo ile sade ve yönetilebilir bir şekilde yapılacaklar listeni oluşturabileceksin.',
      imagePath: 'assets/images/onboardPic1.svg',
    ),
    OnboardPageModel(
      description:
          'LiTo ile sade ve yönetilebilir bir şekilde yapılacaklar listeni oluşturabileceksin.',
      imagePath: 'assets/images/onboardPic1.svg',
    ),
    OnboardPageModel(
      description:
          'LiTo ile sade ve yönetilebilir bir şekilde yapılacaklar listeni oluşturabileceksin.',
      imagePath: 'assets/images/onboardPic1.svg',
    ),
  ];
}

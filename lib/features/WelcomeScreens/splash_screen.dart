import 'package:flutter/material.dart';
import 'package:healthandwellness/res/components/app_sized_box.dart';
import 'package:healthandwellness/res/components/responsive_height_width.dart';
import 'package:healthandwellness/res/const_string/const_controls.dart';
import 'package:healthandwellness/res/const_string/const_strings.dart';
import 'package:healthandwellness/res/components/widget_repo.dart';
import 'package:healthandwellness/features/Navigation/bottomnavbar.dart';

import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      ///actual route
      // Navigator.of(context).pushReplacementNamed(RouteAddress.onboarding);

      ///Route changed for testing (dummy route)
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => BottomNavbar(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Constant.screenHeight = displayHeight(context);
    // Constant.screenWidth = displayWidth(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.cWhite,
        body: Container(
          width: displayWidth(context), //Constant.screenWidth,
          height: displayHeight(context), //Constant.screenHeight,
          decoration: BoxDecoration(
            // color: ColorCode.cRed,
            image: DecorationImage(
              scale: 1,
              image: AssetImage(
                ImagePath.splashFrontImage,
              ),
              fit: BoxFit.scaleDown,
              alignment: Alignment.topRight,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: displayHeight(context) / 2.3,
              //Constant.screenHeight / 2.3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    ImagePath.appLogo,
                  ),
                  20.ph, // verticalCavity(20),
                  TextInit(
                    textIn: Document.appLable,
                    fSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  20.ph, // verticalCavity(20),
                  SizedBox(
                    width: displayWidth(context) / 1.3,
                    //Constant.screenWidth / 1.3,
                    child: TextInit(
                      textIn: Document.splashInfo,
                      fSize: 14,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

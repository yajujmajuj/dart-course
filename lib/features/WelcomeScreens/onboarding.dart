import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthandwellness/res/components/app_sized_box.dart';
import 'package:healthandwellness/res/components/responsive_height_width.dart';
import 'package:healthandwellness/res/const_string/const_controls.dart';
import 'package:healthandwellness/res/const_string/const_strings.dart';
import 'package:healthandwellness/res/routes/route_paths.dart';
import 'package:healthandwellness/res/components/widget_repo.dart';
import '../../Repository/generic_repository.dart';
import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';

class Onboarding extends ConsumerWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageNumber = ref.watch(onboardingStateProvider);
    Constant.onboardingScreenNumber = pageNumber;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: displayWidth(context), //Constant.screenWidth,
          height: displayHeight(context), //Constant.screenHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              scale: 1.15,
              fit: BoxFit.none,
              image: AssetImage(
                ImagePath.onboarding1Image[pageNumber],
              ),
            ),
          ),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: displayHeight(context) *
                        0.02, //Constant.screenHeight * 0.02,
                    right: 20,
                  ),
                  child: SkipButton(
                    clickAble: true,
                    buttonColor: AppColors.cWhite,
                    doThis: (() {
                      Navigator.of(context)
                          .pushReplacementNamed(RouteAddress.signIn);
                    }),
                    buttonTitle: TextInit(
                      textIn: Document.skip,
                      fSize: 14,
                    ),
                  ),
                ),
              ),
              20.ph, // verticalCavity(20),
              SizedBox(
                width:
                    displayWidth(context) / 1.2, //Constant.screenWidth / 1.2,
                height: 65,
                child: TextInit(
                  textIn: Document.onboardingTitle[pageNumber],
                  fSize: 22,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width:
                    displayWidth(context) / 1.2, //Constant.screenWidth / 1.2,
                height: 100,
                child: TextInit(
                  textIn: Document.onboarding1Info,
                  fSize: 14,
                  textAlign: TextAlign.center,
                  clr: AppColors.cBlack,
                ),
              ),
              10.ph, //verticalCavity(Constant.screenHeight * 0.42),
              Image.asset(
                ImagePath.radioButton[pageNumber],
                width: displayWidth(context) / 5, //Constant.screenWidth / 5,
              ),
              30.ph, //  verticalCavity(30),
              GeneralButton(
                horizontalScale:
                    displayWidth(context) / 1.2, //Constant.screenWidth / 1.2,
                verticalScale: 50,
                clickAble: true,
                buttonColor: AppColors.cTheme,
                doThis: () {
                  if (pageNumber == 5) {
                    ref.invalidate(onboardingStateProvider);
                    Navigator.of(context)
                        .pushReplacementNamed(RouteAddress.signIn);
                  } else {
                    ref.read(onboardingStateProvider.notifier).state++;
                  }
                },
                buttonTitle: TextInit(
                  textIn:
                      (pageNumber == 5) ? Document.getStarted : Document.next,
                  fSize: 16,
                  clr: AppColors.cWhite,
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

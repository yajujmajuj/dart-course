import 'package:flutter/material.dart';
import 'package:healthandwellness/res/components/app_sized_box.dart';
import 'package:healthandwellness/res/components/responsive_height_width.dart';
import '../../res/const_string/const_controls.dart';
import '../../res/const_string/const_strings.dart';
import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/widget_repo.dart';

class BuyPackage extends StatelessWidget {
  const BuyPackage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: Container(
              height:
                  displayHeight(context) / 2.1, //Constant.screenHeight / 2.1,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: <Widget>[
                  TextInit(
                    textIn: Document.programsBuyPackage,
                    fSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  5.ph, // verticalCavity(5),
                  TextInit(
                    textIn: Document.availableBuyPackage,
                    fSize: 14,
                    clr: AppColors.cGrey,
                  ),
                  SizedBox(
                    height: displayHeight(context) *
                        0.27, //Constant.screenHeight * 0.27,
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: displayHeight(context) *
                              0.07, //Constant.screenHeight * 0.07,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.cBlack),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                TextInit(
                                    textIn: 'Level ${index + 1}', fSize: 14),
                                const Icon(Icons.keyboard_arrow_down_rounded)
                              ]),
                        );
                      },
                    ),
                  ),
                  // GeneralButton(
                  //   clickAble: true,
                  //   verticalScale: 50,
                  //   horizontalScale: Constant.screenWidth / 1.1,
                  //   buttonColor: ColorCode.cTheme,
                  //   doThis: () {},
                  //   buttonTitle: TextInit(
                  //     textIn: Document.login,
                  //     fSize: 14,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

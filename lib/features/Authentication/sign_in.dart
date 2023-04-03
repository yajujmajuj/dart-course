import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthandwellness/res/components/app_sized_box.dart';
import 'package:healthandwellness/res/components/responsive_height_width.dart';
import 'package:healthandwellness/res/routes/route_paths.dart';
import '../../res/const_string/const_controls.dart';
import '../../Repository/generic_repository.dart';
import '../../res/const_string/const_strings.dart';
import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/widget_repo.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

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
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: <Widget>[
                  TextInit(textIn: Document.loginWelcome, fSize: 14),
                  TextInit(
                    textIn: Document.login,
                    fSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  10.ph, //verticalCavity(10),
                  InputField(
                    inputAction: TextInputAction.done,
                    horizontalScale: displayWidth(context),
                    //Constant.screenWidth,
                    fieldLabel: Document.emailAddress.toUpperCase(),
                    fieldHint: 'yo@gmail.com',
                    controller: email,
                  ),
                  20.ph, //verticalCavity(20),
                  InputField(
                    inputAction: TextInputAction.done,
                    horizontalScale: displayWidth(context),
                    //Constant.screenWidth,
                    fieldLabel: Document.password.toUpperCase(),
                    fieldHint: '*******',
                    controller: password,
                    ispassword: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: displayWidth(context) / 3,
                        //Constant.screenWidth / 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Consumer(
                                builder: (context, ref, child) {
                                  final rememberCheck =
                                      ref.watch(rememberSignInProvider);
                                  Constant.rememberMeState = rememberCheck;
                                  return Checkbox(
                                    value: rememberCheck,
                                    onChanged: (value) {
                                      ref
                                          .read(rememberSignInProvider.notifier)
                                          .state = value!;
                                    },
                                  );
                                },
                              ),
                            ),
                            TextInit(textIn: Document.rememberMe, fSize: 10)
                          ],
                        ),
                      ),
                      TextInit(textIn: Document.recoverPassword, fSize: 10),
                    ],
                  ),
                  20.ph, // verticalCavity(20),
                  GeneralButton(
                    clickAble: true,
                    verticalScale: 50,
                    horizontalScale: displayWidth(context) / 1.1,
                    //Constant.screenWidth / 1.1,
                    buttonColor: AppColors.cTheme,
                    doThis: () {},
                    buttonTitle: TextInit(
                      textIn: Document.login,
                      fSize: 14,
                    ),
                  ),
                  20.ph, // verticalCavity(20),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: Document.signup,
                          style:
                              TextStyle(color: AppColors.cGrey, fontSize: 14),
                        ),
                        TextSpan(
                          text: 'Create',
                          style: TextStyle(
                              color: AppColors.cTheme,
                              decoration: TextDecoration.underline,
                              fontSize: 14),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                context,
                                RouteAddress.signUp,
                              );
                            },
                        ),
                      ],
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

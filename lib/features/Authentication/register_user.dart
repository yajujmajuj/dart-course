import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthandwellness/res/components/app_sized_box.dart';
import 'package:healthandwellness/res/components/responsive_height_width.dart';
import 'package:healthandwellness/res/const_string/const_controls.dart';
import 'package:healthandwellness/res/const_string/const_strings.dart';
import 'package:healthandwellness/res/components/widget_repo.dart';
import 'package:healthandwellness/features/Navigation/bottomnavbar.dart';
import '../../Repository/generic_repository.dart';
import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  TextEditingController firstName = TextEditingController();

  TextEditingController lastName = TextEditingController();

  TextEditingController emailAddress = TextEditingController();

  TextEditingController phoneCountry = TextEditingController();

  TextEditingController phoneNumber = TextEditingController();

  TextEditingController passwordSignUp = TextEditingController();

  TextEditingController confirmPasswordSignUp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: displayWidth(context) * 0.05,
              //Constant.screenWidth * 0.05,
              vertical:
                  displayHeight(context) * 0.06, //Constant.screenWidth * 0.06,
            ),
            width: displayWidth(context), //Constant.screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 5, color: AppColors.cAvatarImage),
                    shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 10,
                        color: AppColors.cBlack,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage(ImagePath.appLogo),
                  ),
                ),
                10.ph, //verticalCavity(10),
                TextInit(
                  textIn: Document.editProfilePicture,
                  fSize: 14,
                  clr: AppColors.cGrey,
                ),
                20.ph, // verticalCavity(20),
                InputField(
                  horizontalScale: displayWidth(context),
                  //Constant.screenWidth,
                  fieldLabel: Document.emailAddress,
                  fieldHint: 'yo@gmail.com',
                  controller: emailAddress,
                  inputAction: TextInputAction.done,
                ),
                20.ph, //verticalCavity(20),
                InputField(
                  horizontalScale: displayWidth(context),
                  //Constant.screenWidth,
                  fieldLabel: Document.fName,
                  fieldHint: 'Justin',
                  controller: firstName,
                  inputAction: TextInputAction.done,
                ),
                20.ph, //verticalCavity(20),
                InputField(
                  horizontalScale: displayWidth(context),
                  // Constant.screenWidth,
                  fieldLabel: Document.lName,
                  fieldHint: 'Trudeau',
                  controller: lastName,
                  inputAction: TextInputAction.done,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: displayWidth(context) / 1.9,
                    //Constant.screenWidth / 1.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Consumer(
                            builder: (context, ref, child) {
                              final genderValue =
                                  ref.watch(genderChoiceProvider);
                              return RadioListTile(
                                contentPadding: const EdgeInsets.all(0),
                                title: TextInit(
                                  fSize: 10,
                                  textIn: 'Male',
                                ),
                                groupValue: genderValue,
                                value: GenderChoice.male,
                                onChanged: (value) {
                                  Constant.genderChosen = value.toString();
                                  ref
                                      .read(genderChoiceProvider.notifier)
                                      .state = value!;
                                },
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: Consumer(
                            builder: ((context, ref, child) {
                              final genderValue =
                                  ref.watch(genderChoiceProvider);
                              return RadioListTile(
                                contentPadding: const EdgeInsets.all(0),
                                title: TextInit(
                                  fSize: 10,
                                  textIn: 'Female',
                                ),
                                groupValue: genderValue,
                                value: GenderChoice.female,
                                onChanged: (value) {
                                  Constant.genderChosen = value.toString();
                                  ref
                                      .read(genderChoiceProvider.notifier)
                                      .state = value!;
                                },
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    DropInField(
                      horizontalScale: displayWidth(context) * 0.3,
                      //Constant.screenWidth * 0.3,
                      hintText: TextInit(
                        textIn: 'Country',
                        fSize: 14,
                        clr: AppColors.cGrey,
                      ),
                    ),
                    InputField(
                      horizontalScale: displayWidth(context) * 0.57,
                      //Constant.screenWidth * 0.57,
                      fieldLabel: 'fieldLabel',
                      fieldHint: 'fieldHint',
                      controller: phoneNumber,
                      inputAction: TextInputAction.done,
                    )
                  ],
                ),
                20.ph, // verticalCavity(20),
                InputField(
                  ispassword: true,
                  horizontalScale: displayWidth(context),
                  //Constant.screenWidth,
                  fieldLabel: Document.password,
                  fieldHint: '*******',
                  controller: passwordSignUp,
                  inputAction: TextInputAction.done,
                ),
                20.ph, //verticalCavity(20),
                InputField(
                  ispassword: true,
                  horizontalScale: displayWidth(context),
                  //Constant.screenWidth,
                  fieldLabel: Document.confirmPassword,
                  fieldHint: '*******',
                  controller: confirmPasswordSignUp,
                  inputAction: TextInputAction.done,
                ),
                20.ph, // verticalCavity(20),
                DropInField(
                  horizontalScale: displayWidth(context),
                  //Constant.screenWidth,
                  hintText: TextInit(
                    textIn: 'Country Time Zone',
                    fSize: 14,
                    clr: AppColors.cGrey,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextInit(
                      textIn:
                          'It looks like you\'re in Asia/Karachi using GMT +5',
                      fSize: 10,
                    ),
                  ),
                ),
                20.ph, //verticalCavity(20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Consumer(
                      builder: (context, ref, child) {
                        final permissionSignUpStatus =
                            ref.watch(signUpPermissionProvider);
                        Constant.permissionState = permissionSignUpStatus;
                        return Checkbox(
                          value: permissionSignUpStatus,
                          onChanged: (value) {
                            ref.read(signUpPermissionProvider.notifier).state =
                                value!;
                          },
                        );
                      },
                    ),
                    TextInit(textIn: Document.permissionSignUp, fSize: 10),
                  ],
                ),
                GeneralButton(
                  horizontalScale: displayWidth(context),
                  // Constant.screenWidth,
                  verticalScale: 50,
                  clickAble: true,
                  buttonColor: AppColors.cTheme,
                  doThis: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => BottomNavbar(),
                      ),
                    );
                  },
                  buttonTitle:
                      TextInit(textIn: Document.signupButton, fSize: 14),
                ),
                20.ph, //verticalCavity(10),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: Document.alreadyAccount,
                        style: TextStyle(color: AppColors.cGrey, fontSize: 14),
                      ),
                      TextSpan(
                        text: 'Create',
                        style: TextStyle(
                          color: AppColors.cTheme,
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    BottomNavbar(),
                              ),
                            );
                            // Navigator.pushNamed(context, RouteAddress.signIn);
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
    );
  }
}

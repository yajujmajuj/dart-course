import 'package:flutter/material.dart';
import 'package:healthandwellness/res/components/app_sized_box.dart';
import 'package:healthandwellness/res/components/responsive_height_width.dart';
import 'package:healthandwellness/res/const_string/const_strings.dart';
import 'package:healthandwellness/res/components/widget_repo.dart';
import '../../res/const_string/const_controls.dart';
import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';

// ignore: must_be_immutable
class AddSchedule extends StatelessWidget {
  AddSchedule({Key? key}) : super(key: key);
  TextEditingController dateEvent = TextEditingController();
  TextEditingController dateTitle = TextEditingController();
  TextEditingController event = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cTheme,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(126),
        child: TitleBar(
          barLeading: const GoBack(),
          barTitle: TextInit(
            textIn: 'Add Event',
            fSize: 18,
            fontWeight: FontWeight.bold,
            clr: AppColors.cWhite,
          ),
          barActions: [
            Padding(
              padding: EdgeInsets.only(
                right:
                    displayWidth(context) * 0.05, //Constant.screenWidth * 0.05,
              ),
              child: ImageIcon(
                AssetImage(ImagePath.scheduleAppbarFilter),
              ),
            ),
          ],
          bottomWidgets: const Text(''),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        width: displayWidth(context),
        //Constant.screenWidth,
        height: displayHeight(context),
        // Constant.screenHeight,
        decoration: BoxDecoration(
            color: AppColors.cWhite,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              child: Column(
                children: <Widget>[
                  InputField(
                    horizontalScale: displayWidth(context),
                    //Constant.screenWidth,
                    fieldLabel: 'Date',
                    fieldHint: '18 - 0 - 2022',
                    controller: dateEvent,
                    inputAction: TextInputAction.done,
                  ),
                  20.ph, //verticalCavity(20),
                  InputField(
                    horizontalScale: displayWidth(context),
                    //Constant.screenWidth,
                    fieldLabel: 'Title',
                    fieldHint: '',
                    controller: dateTitle,
                    inputAction: TextInputAction.done,
                  ),
                  20.ph, //verticalCavity(20),
                  InputField(
                    horizontalScale: displayWidth(context),
                    //Constant.screenWidth,
                    fieldLabel: 'Note',
                    fieldHint: '',
                    controller: event,
                    inputAction: TextInputAction.done,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: displayHeight(context) *
                    0.05, //Constant.screenHeight * 0.05,
              ),
              child: GeneralButton(
                horizontalScale: displayWidth(context) / 1.2,
                //Constant.screenWidth / 1.2,
                verticalScale: 50,
                clickAble: true,
                buttonColor: AppColors.cTheme,
                doThis: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                buttonTitle: TextInit(
                  textIn: Document.save,
                  fSize: 16,
                  clr: AppColors.cWhite,
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

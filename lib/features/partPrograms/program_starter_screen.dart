import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthandwellness/features/partPrograms/program_overview.dart';
import 'package:healthandwellness/res/components/app_sized_box.dart';
import 'package:healthandwellness/res/components/app_text.dart';
import '../../res/components/responsive_height_width.dart';
import '../../res/const_string/const_controls.dart';
import '../../Repository/generic_repository.dart';
import '../../res/const_string/const_strings.dart';
import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/float_button.dart';
import '../../res/components/widget_repo.dart';

class ProgramStarterScreen extends StatefulWidget {
  const ProgramStarterScreen({Key? key}) : super(key: key);

  @override
  State<ProgramStarterScreen> createState() => _ProgramStarterScreenState();
}

class _ProgramStarterScreenState extends State<ProgramStarterScreen> {
  bool showButton = true;
  bool showText = true;

  void showSnackBar() {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 60),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: TextInit(
              textIn: 'SET STOPWATCH',
              fSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          20.ph, //verticalCavity(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Wrap(
                  spacing: 0,
                  children: List.generate(
                    Constant.watches.length,
                    (index) => Consumer(
                      builder: (context, ref, child) {
                        List<bool> isButtonSelected =
                            ref.watch(snackBarButtonProvider);
                        return SnackBarButtonWidget(
                          isButtonSelected: isButtonSelected[index],
                          func: () {
                            log(Constant.watches.toList().toString());
                            for (int i = 0; i < Constant.watches.length; i++) {
                              Constant.watches[i] = i == index;
                            }
                            ref.read(snackBarButtonProvider.notifier).state =
                                Constant.watches.toList();
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          40.ph,
          TextInit(
            textIn: '00:00.00',
            fSize: 57,
            fontWeight: FontWeight.bold,
            clr: const Color(0xFF231F20),
          ),

          40.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GeneralButton(
                horizontalScale: 150,
                verticalScale: 50,
                clickAble: true,
                buttonColor: AppColors.cTheme,
                doThis: () {},
                buttonTitle: TextInit(
                  textIn: 'Reset',
                  fSize: 14,
                  clr: AppColors.cWhite,
                ),
              ),
              GeneralButton(
                horizontalScale: 150,
                verticalScale: 50,
                clickAble: true,
                buttonColor: AppColors.cTheme,
                doThis: () {},
                buttonTitle: TextInit(
                  textIn: 'Start'
                      '',
                  fSize: 14,
                  clr: AppColors.cWhite,
                ),
              )
            ],
          ),
          40.ph,
        ],
      ),
      backgroundColor: (AppColors.cWhite),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cTheme,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: TitleBar(
          barLeading: const GoBack(),
          barTitle: TextInit(
            textIn: Document.navbarTitles[2],
            fSize: 18,
            fontWeight: FontWeight.bold,
            clr: AppColors.cWhite,
          ),
          barActions: const [],
          bottomWidgets: Container(
            padding: EdgeInsets.only(
              left: displayWidth(context) * 0.1, //Constant.screenWidth * 0.1,
            ),
            height: 54,
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width:
                    displayWidth(context) * 0.7, //Constant.screenWidth * 0.7,
                child: TextInit(
                  textIn: 'Mobility, Activation & Prep',
                  fSize: 18,
                  clr: AppColors.cWhite,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: displayWidth(context), //Constant.screenWidth,
            height: displayHeight(context),
            decoration: BoxDecoration(
              color: AppColors.cWhite,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                  left: 10,
                  right: 10,
                ),
                height: displayWidth(context), //Constant.screenHeight,
                decoration: BoxDecoration(
                  color: AppColors.lightSkyBlue,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: ListView.builder(
                  itemCount: tempTitles.length,
                  itemBuilder: ((context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            Radio(
                                toggleable: false,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                splashRadius: 0,
                                visualDensity: VisualDensity.compact,
                                value: 't',
                                groupValue: 't',
                                onChanged: (v) {}),
                            TextInit(
                              textIn: tempTitles[index],
                              fSize: 12,
                            ),
                          ],
                        ),
                        SizedBox(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: tempCricuits.length,
                            itemBuilder: ((context, index1) {
                              return Row(
                                children: const [
                                  Expanded(
                                    child: ProgramStarterContainer(),
                                  ),
                                ],
                              );
                            }),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.only(bottom: 20, right: 20),
              child: FloatButton(
                onPressed: () async {
                  setState(() {
                    showButton = !showButton;
                  });
                  showSnackBar();
                },
                floatIcon: ImageIcon(
                  AssetImage(ImagePath.stopWatchIcon),
                ),
                floatLabel: AppText.title(
                  ' STOPWATCH \n 00:00:00',
                  fontSize: 14,
                  color: AppColors.cWhite,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

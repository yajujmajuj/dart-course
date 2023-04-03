import 'package:flutter/material.dart';
import 'package:healthandwellness/res/components/app_sized_box.dart';
import 'package:healthandwellness/res/routes/route_paths.dart';
import '../../../../res/const_string/const_controls.dart';
import '../../../../res/const_string/const_strings.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../res/components/widget_repo.dart';
import '../../res/components/responsive_height_width.dart';

List<String> tempTitles = <String>[
  "Mobility, Activation & Prep",
  'Core Training',
  'Resistance Training Exercise DI -D2',
  'Resistance Training Exercise DI -D2',
  'Resistance Training Exercise DI -D2',
];

List<List> tempCricuits = [
  ['1', '2', '3', '4', '5'],
  ['1', '2', '3', '4', '5'],
  ['1', '2', '3', '4', '5'],
  ['1', '2', '3', '4', '5'],
  ['1', '2', '3', '4', '5'],
];

class ProgramOverview extends StatelessWidget {
  const ProgramOverview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return SafeArea(
      child: Scaffold(
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
                  width: displayWidth(context) * 0.7,
                  child: TextInit(
                    textIn: args,
                    fSize: 18,
                    clr: AppColors.cWhite,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Container(
          width: displayWidth(context),
          decoration: BoxDecoration(
            color: AppColors.cWhite,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                const ProgramOverviewContains(),
                20.ph, //verticalCavity(20),
                Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
                  height: displayHeight(context) *
                      0.53, //Constant.screenHeight * 0.53,
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
                            height: 60,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: tempCricuits.length,
                              itemBuilder: ((context, index1) {
                                return Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Container(
                                        color: (index == tempTitles.length - 1)
                                            ? AppColors.lightSkyBlue
                                            : AppColors.cBlack,
                                        height: 5,
                                        width: 1,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: TextInit(
                                        textIn:
                                            'Sample Text here ${tempCricuits[index][index1]}',
                                        fSize: 10,
                                      ),
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
                20.ph,
                GeneralButton(
                  horizontalScale:
                      displayWidth(context), //Constant.screenWidth,
                  verticalScale: 50,
                  clickAble: true,
                  buttonColor: AppColors.cTheme,
                  doThis: () {
                    Navigator.of(context)
                        .pushNamed(RouteAddress.programStartScreen);
                  },
                  buttonTitle: TextInit(
                    textIn: Document.start,
                    fSize: 14,
                    clr: AppColors.cWhite,
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
//TextInit(textIn: tempTitles[index], fSize: 14)

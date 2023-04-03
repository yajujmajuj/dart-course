import 'package:flutter/material.dart';
import 'package:healthandwellness/res/components/app_sized_box.dart';
import 'package:healthandwellness/res/routes/route_paths.dart';
import '../../../../res/const_string/const_strings.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../res/components/widget_repo.dart';
import '../../res/components/responsive_height_width.dart';

var tempListTitles = [
  '12 week Phase 2 Day 3',
  'Arms Day',
  'Bodyweight Program Phase 1 Day 2 of 2',
  'Core Training',
  'Full Body TFT Phase 1 Day 1',
];

class ProgramsFromNav extends StatelessWidget {
  const ProgramsFromNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.cTheme,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(126),
          child: TitleBar(
            barTitle: TextInit(
              textIn: Document.navbarTitles[2],
              fSize: 18,
              clr: AppColors.cWhite,
              fontWeight: FontWeight.bold,
            ),
            barActions: [
              Padding(
                padding: EdgeInsets.only(
                  right: displayWidth(context) *
                      0.05, //Constant.screenWidth * 0.05,
                ),
                child: const Icon(Icons.search),
              ),
            ],
            bottomWidgets: Container(
              padding: EdgeInsets.only(
                left: displayWidth(context) * 0.1, //Constant.screenWidth * 0.1,
              ),
              height: 70,
              child: Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width:
                      displayWidth(context) * 0.7, //Constant.screenWidth * 0.7,
                  child: TextInit(
                    textIn: Document.programNavbarBottomText,
                    fSize: 12,
                    clr: AppColors.cWhite,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: AppColors.cWhite,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListView.builder(
              itemCount: tempListTitles.length,
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    ProgramsTile(
                      title: tempListTitles[index],
                      workoutCount: '1 Workout',
                      goto: () {
                        Navigator.of(context).pushNamed(
                            RouteAddress.programOverview,
                            arguments: tempListTitles[index]);
                      },
                    ),
                    10.ph, //verticalCavity(10),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

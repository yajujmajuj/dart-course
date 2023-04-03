import 'package:flutter/material.dart';
import 'package:healthandwellness/res/components/app_sized_box.dart';
import '../../res/components/responsive_height_width.dart';
import '../../res/const_string/const_controls.dart';
import '../../res/routes/route_paths.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/widget_repo.dart';
import 'dart:math' as math;

var tempListTitles = [
  'Food Diary',
  'Progress Photos',
  'Result Tracking',
  'Habits',
  'Meal Adherence',
  'Forms',
];

class LogBook extends StatefulWidget {
  const LogBook({Key? key}) : super(key: key);

  @override
  State<LogBook> createState() => _LogBookState();
}

class _LogBookState extends State<LogBook> {
  List<bool> isClicked = List.generate(
    tempListTitles.length,
    (index) => false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cTheme,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(126),
        child: TitleBar(
          barTitle: TextInit(
            textIn: 'Logbook',
            fSize: 18,
            clr: AppColors.cWhite,
            fontWeight: FontWeight.bold,
          ),
          barActions: [
            Padding(
              padding: EdgeInsets.only(
                right:
                    displayWidth(context) * 0.05, //Constant.screenWidth * 0.05,
              ),
              child: Transform.rotate(
                angle: 90 * math.pi / 180,
                child: const Icon(Icons.search),
              ),
            ),
            const SizedBox(width: 10)
          ],
          bottomWidgets: Container(
            padding: EdgeInsets.only(
              left: displayWidth(context) * 0.1, //Constant.screenWidth * 0.1,
            ),
            height: 60,
            child: Align(
              alignment: Alignment.topLeft,
              child: TextInit(
                textIn:
                    'Click the icon to select your tracking method, then record new results or view previous ones.',
                fSize: 12,
                clr: AppColors.cWhite,
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
                  LogBookTile(
                    title: tempListTitles[index],
                    clicked: isClicked[index],
                    goto: () {
                      setState(() {
                        isClicked[index] = !isClicked[index];
                      });
                      Navigator.of(context).pushNamed(
                          RouteAddress.logBookItemScreen,
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
    );
  }
}

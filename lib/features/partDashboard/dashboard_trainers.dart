import 'package:flutter/material.dart';
import 'package:healthandwellness/res/components/app_sized_box.dart';
import 'package:healthandwellness/res/components/responsive_height_width.dart';
import 'package:healthandwellness/res/components/widget_repo.dart';
import 'package:healthandwellness/res/routes/route_paths.dart';
import 'dart:math' as math;
import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';

List trainersNames = <String>[
  'Kelly Brown',
  'Christan Dalanzo',
  'Sylvia Brown',
  'Waseem Tahir',
  'Kashif Ali',
  'Nasir Khan',
];

List trainersTiming = <String>[
  '9:32 am',
  '8:45 am',
  '8:25 pm',
  'Sun',
  'Mon',
  'Tue',
];

class DashBoardTrainers extends StatelessWidget {
  const DashBoardTrainers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Transform.rotate(
            angle: 90 * math.pi / 180,
            child: const Icon(
              Icons.search,
              color: AppColors.textColor2,
              size: 30,
            ),
          ),
          10.pw,
        ],
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: AppColors.textColor2,
            size: 30,
          ),
        ),
        title: TextInit(
          textIn: 'Messages',
          fontWeight: FontWeight.bold,
          fSize: 18,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(5).copyWith(top: 40),
        child: ListView.builder(
          itemCount: trainersNames.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteAddress.tChatScreen,
                      arguments: trainersNames[index],
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5).copyWith(bottom: 10),
                    width: displayWidth(context),
                    height: displayHeight(context) * 0.11,
                    child: Row(
                      children: [
                        Image.asset(
                          ImagePath.dashboardProfileImage,
                          height: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextInit(
                                textIn: trainersNames[index],
                                fSize: 14,
                                clr: AppColors.textColor2,
                              ),
                              TextInit(textIn: 'Dinner tongight ?', fSize: 14)
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 90, bottom: 30),
                          child: TextInit(
                            textIn: trainersTiming[index],
                            fSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12, right: 12),
                  child: Divider(
                    color: Color(0xffC7C7C7),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

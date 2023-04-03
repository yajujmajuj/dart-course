import 'package:flutter/material.dart';
import 'package:healthandwellness/features/partDashboard/dashboard_trainer_profile.dart';
import 'package:healthandwellness/res/components/app_sized_box.dart';
import 'package:healthandwellness/res/components/responsive_height_width.dart';
import 'package:healthandwellness/res/const_string/const_controls.dart';
import 'package:healthandwellness/res/const_string/const_strings.dart';
import 'package:healthandwellness/res/routes/route_paths.dart';
import 'package:healthandwellness/res/components/widget_repo.dart';
import '../../chart.dart';
import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: displayWidth(context),
          height: displayHeight(context),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                ImagePath.dashBoardBackground,
              ),
              alignment: Alignment.topCenter,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                30.ph, // verticalCavity(30),
                Row(
                  children: <Widget>[
                    //1st is here
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: displayWidth(context) *
                          0.65, //Constant.screenWidth * 0.65,
                      height: displayHeight(context) *
                          0.28, //Constant.screenHeight * 0.28,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ImageIcon(
                                  AssetImage(ImagePath.dashboardExit),
                                  color: AppColors.cWhite,
                                ),
                                TextInit(
                                  textIn: Document.dashboardTitle,
                                  fSize: 18,
                                  clr: AppColors.cWhite,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: displayHeight(context) /
                                6, //Constant.screenHeight / 6,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: TextInit(
                                      textIn: 'viewing as:',
                                      fSize: 10,
                                      clr: AppColors.cWhite,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: TextInit(
                                      textIn: 'Kylie Jenner',
                                      fSize: 14,
                                      clr: AppColors.cWhite,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  30.ph, //verticalCavity(30),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: TextInit(
                                      textIn: 'My Dashboard',
                                      fSize: 20,
                                      clr: AppColors.cWhite,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: displayWidth(context) *
                          0.30, //Constant.screenWidth * 0.30,
                      height: displayHeight(context) *
                          0.28, //Constant.screenHeight * 0.28,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              ImageIcon(
                                AssetImage(ImagePath.titleChatSignUp),
                                color: AppColors.cWhite,
                              ),
                              10.pw, //horizontalCavity(10),
                              ImageIcon(
                                AssetImage(ImagePath.titleSwitchProfileSignUp),
                                color: AppColors.cWhite,
                              ),
                            ],
                          ),
                          30.ph, //verticalCavity(30),
                          Image.asset(
                            ImagePath.appLogo,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: displayWidth(context),
                  height: 800,
                  decoration: BoxDecoration(
                    color: AppColors.cWhite,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: displayWidth(context) * 0.15,
                          top: displayHeight(context) * 0.035,
                          bottom: displayHeight(context) * 0.010,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextInit(
                            textIn: 'Today\'s Schedule',
                            fSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: displayWidth(context) * 0.10,
                            child: Column(
                              children: <Widget>[
                                TextInit(textIn: '9:00 AM', fSize: 14),
                                Radio(
                                  value: 'd',
                                  groupValue: 'd',
                                  onChanged: ((value) {}),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.cAvatarImage,
                                borderRadius: BorderRadius.circular(20)),
                            width: displayWidth(context) * 0.80,
                            //Constant.screenWidth * 0.80,
                            height: 80,
                            child: ListTile(
                              leading: ImageIcon(
                                AssetImage(ImagePath.dashboardTilePower),
                                size: 30,
                                color: AppColors.cBlack,
                              ),
                              title: TextInit(
                                textIn: 'Full Body Total Fitness Training',
                                fSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              // contentPadding: EdgeInsets.non,
                              minLeadingWidth: 0,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              subtitle: TextInit(
                                clr: AppColors.cGrey,
                                textIn: '0 of 1 Completed',
                                fSize: 14,
                              ),
                            ),
                          )
                        ],
                      ),
                      responsiveVerticalCavity(displayHeight(context) * 0.02),
                      Padding(
                        padding:
                            EdgeInsets.only(left: displayWidth(context) * 0.15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextInit(
                            textIn: 'Progress',
                            fSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      responsiveVerticalCavity(displayHeight(context) * 0.01),
                      const Expanded(
                          child: Chart(text: 'Overall Completion : January')),
                      10.ph,
                      const Expanded(child: Chart(text: 'Workout Completion')),
                      SizedBox(
                        width: displayWidth(context),
                        height: 110,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              child: Row(
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                        RouteAddress
                                            .dashBoardTrainerProfilePage,
                                      );
                                    },
                                    child: Image.asset(
                                      ImagePath.dashboardProfileImage,
                                      height: 100,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 55,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        TextInit(
                                            textIn: Document
                                                .dashboardTrainerNameTileTitle,
                                            fSize: 12),
                                        TextInit(
                                          textIn: 'Awan Johnson',
                                          fSize: 14,
                                          fontWeight: FontWeight.bold,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  RouteAddress.dbTrainersPAge,
                                );
                              },
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Image.asset(
                                  ImagePath.dashboardTrainerChat,
                                  height: 50,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

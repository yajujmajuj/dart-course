import 'package:flutter/material.dart';
import 'package:healthandwellness/res/components/app_sized_box.dart';
import 'package:healthandwellness/res/components/app_text.dart';
import 'package:healthandwellness/res/const_string/const_strings.dart';
import 'package:healthandwellness/res/routes/route_paths.dart';
import 'package:healthandwellness/res/components/widget_repo.dart';
import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/customized_toggle_button.dart';
import '../../res/components/float_button.dart';
import '../../res/components/responsive_height_width.dart';

class ScheduleFromNav extends StatelessWidget {
  const ScheduleFromNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.cTheme,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(126),
          child: TitleBar(
            barTitle: TextInit(
              textIn: Document.navbarTitles[1],
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
                child: ImageIcon(
                  AssetImage(ImagePath.scheduleAppbarFilter),
                ),
              ),
            ],
            bottomWidgets: Container(
              padding: EdgeInsets.only(
                left: displayWidth(context) * 0.1, //Constant.screenWidth * 0.1,
              ),
              height: 60,
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextInit(
                      textIn: 'Wednesday',
                      fSize: 14,
                      clr: AppColors.cWhite,
                    ),
                    TextInit(
                      textIn: '18 Jan 23',
                      fSize: 22,
                      clr: AppColors.cWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          width: displayWidth(context),
          //Constant.screenWidth,
          height: displayHeight(context),
          //Constant.screenHeight,
          decoration: BoxDecoration(
              color: AppColors.cWhite,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              )),
          child: Column(
            children: <Widget>[
              const CustomizedToggleButton(
                options: ['Day', 'Week'],
              ),
              20.ph, //verticalCavity(20),
              Row(
                children: [
                  const TileRadioDate(),
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
                        horizontal: 10,
                        vertical: 5,
                      ),
                      subtitle: TextInit(
                        clr: AppColors.cGrey,
                        textIn: '0 of 1 Completed',
                        fSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatButton(
          floatIcon: const Icon(
            Icons.add,
          ),
          floatLabel: AppText.title(
            'Add',
            fontSize: 14,
            color: AppColors.cWhite,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(RouteAddress.addSchedule);
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:healthandwellness/res/components/app_sized_box.dart';
import 'package:healthandwellness/res/components/responsive_height_width.dart';
import 'package:healthandwellness/res/const_string/const_strings.dart';
import 'package:healthandwellness/res/components/widget_repo.dart';
import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';

class DashboardTrainerProfile extends StatelessWidget {
  const DashboardTrainerProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: AppColors.cTransparent,
          elevation: 0,
        ),
        body: Container(
          height: displayHeight(context),
          width: displayWidth(context),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                ImagePath.trainerBackground,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                ImagePath.dashboardProfileImage,
              ),
              TextInit(
                textIn: Document.dashboardTrainerNameTileTitle,
                fSize: 14,
                clr: AppColors.cWhite,
              ),
              TextInit(
                textIn: 'Awan Johnson',
                fSize: 18,
                clr: AppColors.cWhite,
                fontWeight: FontWeight.bold,
              ),
              20.ph, //verticalCavity(20),
              SizedBox(
                width: displayWidth(context) * 0.7,
                child: TextInit(
                  textIn: Document.trainerProfileInfo,
                  fSize: 12,
                  clr: AppColors.cWhite,
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

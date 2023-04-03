import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthandwellness/res/components/app_sized_box.dart';
import 'package:healthandwellness/res/components/logbook_drink_items.dart';
import 'package:healthandwellness/res/components/logbook_meal_items.dart';
import 'package:healthandwellness/res/components/responsive_height_width.dart';
import 'dart:math' as math;
import '../../res/const_string/const_controls.dart';
import '../../Repository/generic_repository.dart';
import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/customized_toggle_button.dart';
import '../../res/components/widget_repo.dart';

var logBookItemsMeals = [
  'My Fitness Pal',
  'MyFitnessPal Daily Macros Totals',
];
var logBookItemsDrink = [
  'Water',
  'Coffee',
  'Tea',
  'Juice',
  'Milk',
];
var logBookItemsMealsImage = [
  ImagePath.foodDiaryMealsItem2,
  ImagePath.foodDiaryMealsItem1,
];
var logBookItemsDrinkImage = [
  ImagePath.foodDiaryDrink1,
  ImagePath.foodDiaryDrink2,
  ImagePath.foodDiaryDrink3,
  ImagePath.foodDiaryDrink4,
  ImagePath.foodDiaryDrink5,
];

class LogBookItemScreen extends StatelessWidget {
  const LogBookItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: AppColors.cTheme,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(126),
        child: TitleBar(
          barLeading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
            ),
          ),
          barTitle: TextInit(
            textIn: args,
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
            margin: const EdgeInsets.only(left: 10),
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
                    fSize: 12,
                    clr: AppColors.cWhite,
                  ),
                  TextInit(
                    textIn: '18 Jan 23',
                    fSize: 22,
                    fontWeight: FontWeight.bold,
                    clr: AppColors.cWhite,
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
          ),
        ),
        child: Column(
          children: [
            const CustomizedToggleButton(
              options: ['Meals', 'Drinks'],
            ),
            20.ph, // verticalCavity(20),
            Consumer(builder: (context, ref, child) {
              final dayOrWeekSwitch = ref.watch(dayWeekTileSwitch);
              return Expanded(
                child: (dayOrWeekSwitch == 0)
                    ? ListView.builder(
                        itemCount: logBookItemsMeals.length,
                        itemBuilder: ((context, index) {
                          return Column(
                            children: [
                              LogBookMealItem(
                                assetImage:
                                    AssetImage(logBookItemsMealsImage[index]),
                                title: logBookItemsMeals[index],
                                //clicked: isClicked[index],
                                goto: () {},
                              ),
                              10.ph, //  verticalCavity(10),
                            ],
                          );
                        }),
                      )
                    : ListView.builder(
                        itemCount: logBookItemsDrink.length,
                        itemBuilder: ((context, index) {
                          return Column(
                            children: [
                              LogBookDrinkItem(
                                assetImage:
                                    AssetImage(logBookItemsDrinkImage[index]),
                                title: logBookItemsDrink[index],
                                //clicked: isClicked[index],
                                goto: () {},
                              ),
                              10.ph, //verticalCavity(10),
                            ],
                          );
                        }),
                      ),
              );
            })
          ],
        ),
      ),
    );
  }
}

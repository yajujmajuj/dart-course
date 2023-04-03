import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthandwellness/res/components/responsive_height_width.dart';
import '../const_string/const_controls.dart';
import '../../Repository/generic_repository.dart';
import '../colors/app_color.dart';

class CustomizedToggleButton extends ConsumerWidget {
  final List<String> options;

  const CustomizedToggleButton({
    Key? key,
    required this.options,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dayOrWeekSwitch = ref.watch(dayWeekTileSwitch);
    Constant.dayOrWeek = dayOrWeekSwitch;
    return Container(
      height: displayHeight(context) * 0.058, //Constant.screenHeight * 0.058,
      decoration: BoxDecoration(
        color: AppColors.cAvatarImage,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          options.length,
          (index) {
            return GestureDetector(
              onTap: () {
                if (Constant.dayOrWeek == 1) {
                  ref.read(dayWeekTileSwitch.notifier).state = 0;
                } else {
                  ref.read(dayWeekTileSwitch.notifier).state = 1;
                }
              },
              child: Container(
                height: displayHeight(context) *
                    0.05, //Constant.screenHeight * 0.05,
                width:
                    displayWidth(context) * 0.3, //Constant.screenWidth * 0.3,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: (dayOrWeekSwitch == index)
                      ? AppColors.cTheme
                      : AppColors.cAvatarImage,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  textAlign: TextAlign.center,
                  options[index],
                  style: TextStyle(
                    color: (Constant.dayOrWeek == index)
                        ? AppColors.cWhite
                        : AppColors.cGrey,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

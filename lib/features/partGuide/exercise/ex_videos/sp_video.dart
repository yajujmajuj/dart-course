import 'package:flutter/material.dart';
import 'package:healthandwellness/features/partGuide/exercise/view/seal_jacks_view.dart';
import 'package:healthandwellness/features/partGuide/exercise/view/side_lunges_view.dart';
import 'package:healthandwellness/features/partGuide/exercise/view/side_plank_view.dart';
import 'package:healthandwellness/res/const_string/const_controls.dart';
import 'package:healthandwellness/res/const_string/const_strings.dart';
import 'package:healthandwellness/res/components/widget_repo.dart';
import 'package:healthandwellness/features/partGuide/exercise/view/sumo_pulses_view.dart';
import 'package:healthandwellness/res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../ex_components/exercise_video_screen.dart';
import '../../../../res/components/responsive_height_width.dart';

class SumoPulsesVideo extends StatefulWidget {
  final String text;
  final String imagePath;
  final Function() onTap;

  const SumoPulsesVideo({
    Key? key,
    required this.text,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  State<SumoPulsesVideo> createState() => _SumoPulsesVideoState();
}

class _SumoPulsesVideoState extends State<SumoPulsesVideo> {
  @override
  Widget build(BuildContext context) {
    return ExerciseVideoScreen(
      text: widget.text,
      imagePath: widget.imagePath,
      generalButton: GeneralButton(
        horizontalScale: displayWidth(context) - 100,
        verticalScale: 45,
        clickAble: true,
        buttonColor: AppColors.cTheme,
        buttonTitle: TextInit(
          textIn: Document.start,
          fSize: 14,
          clr: AppColors.cWhite,
        ),
        doThis: widget.onTap,
      ),
    );
  }
}

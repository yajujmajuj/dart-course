import 'package:flutter/material.dart';
import 'package:healthandwellness/res/components/app_sized_box.dart';
import 'package:healthandwellness/res/components/responsive_height_width.dart';
import 'package:healthandwellness/res/const_string/const_strings.dart';
import 'package:healthandwellness/res/components/widget_repo.dart';
import 'package:video_player/video_player.dart';

import '../../../../res/colors/app_color.dart';

class ExerciseVideoScreen extends StatefulWidget {
  final String imagePath;
  final GeneralButton generalButton;
  final String text;
  const ExerciseVideoScreen({
    Key? key,
    required this.imagePath,
    required this.generalButton,
    required this.text,
  }) : super(key: key);

  @override
  State<ExerciseVideoScreen> createState() => _ExerciseVideoScreenState();
}

class _ExerciseVideoScreenState extends State<ExerciseVideoScreen> {
  late VideoPlayerController controller;
  bool isPlaying = false;

  @override
  void initState() {
    startVideoPlayController();
    super.initState();
  }

  startVideoPlayController() {
    controller = VideoPlayerController.asset(widget.imagePath)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cTheme,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          barTitle: TextInit(
            textIn: widget.text,
            fSize: 18,
            clr: AppColors.cWhite,
            fontWeight: FontWeight.bold,
          ),
          barActions: const [Center()],
        ),
      ),
      body: Container(
        height: displayHeight(context),
        decoration: BoxDecoration(
          color: AppColors.cWhite,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  height: 280,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: VideoPlayer(
                      controller,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 20,
                  child: IconButton(
                    onPressed: () {
                      if (!isPlaying) {
                        setState(() {
                          isPlaying = !isPlaying;
                          controller.play();
                        });
                      } else {
                        setState(() {
                          isPlaying = !isPlaying;
                          controller.pause();
                        });
                      }
                    },
                    icon: Icon(
                      (!isPlaying) ? Icons.play_circle : Icons.pause_circle,
                      color: AppColors.cWhite,
                      size: 40,
                    ),
                  ),
                )
              ],
            ),
            30.ph,
            //verticalCavity(30),
            widget.generalButton,
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:healthandwellness/features/partGuide/exercise/ex_videos/sp_video.dart';
import 'package:healthandwellness/features/partGuide/exercise/view/sit_up_view.dart';
import 'package:healthandwellness/features/partGuide/exercise/view/sumo_squats_view.dart';
import 'package:healthandwellness/res/assets/image_assets.dart';
import 'package:healthandwellness/res/components/part_guide_tile.dart';
import 'package:healthandwellness/res/const_string/const_strings.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/widget_repo.dart';
import 'exercise/view/seal_jacks_view.dart';
import 'exercise/view/side_lunges_view.dart';
import 'exercise/view/side_plank_view.dart';
import 'exercise/view/sumo_pulses_view.dart';

class VideoListView extends StatefulWidget {
  const VideoListView({Key? key}) : super(key: key);

  @override
  State<VideoListView> createState() => _VideoListViewState();
}

class _VideoListViewState extends State<VideoListView> {
  List<bool> isClicked = List.generate(
    Document.workOutTitle.length,
    (index) => false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          barTitle: TextInit(
            textIn: Document.workOutVideos,
            fSize: 18,
            clr: AppColors.cWhite,
            fontWeight: FontWeight.bold,
          ),
          barActions: const [
            Center(),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: ListView.builder(
          itemCount: Document.workOutTitle.length,
          itemBuilder: (context, index) {
            return PartGuideTile(
              image: ImagePath.exImageIcon[index],
              title: Document.workOutTitle[index],
              clicked: isClicked[index],
              goto: () {
                // setState(() {
                //   isClicked[index] = !isClicked[index];
                // });

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SumoPulsesVideo(
                        text: Document.workOutTitle[index],
                        imagePath: ImagePath.exVideos[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return exScreens[index];
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

List exScreens = [
  const SumoPulsesExerciseMain(),
  const SealJacksExerciseView(),
  const SideLungesView(),
  const SidePlankExerciseView(),
  const SumoSquatsView(),
  const SitUpView(),
];

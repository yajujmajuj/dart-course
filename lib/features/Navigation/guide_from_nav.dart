import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:healthandwellness/res/components/responsive_height_width.dart';
import 'package:healthandwellness/res/const_string/const_controls.dart';
import 'package:healthandwellness/res/const_string/const_strings.dart';
import 'package:healthandwellness/res/components/widget_repo.dart';
import 'package:healthandwellness/res/assets/image_assets.dart';
import 'dart:math' as math hide log;

import '../../res/colors/app_color.dart';
import '../partGuide/exercise/view/sumo_pulses_view.dart';

class GuideFromNav extends StatefulWidget {
  const GuideFromNav({super.key});

  @override
  GuideFromNavState createState() => GuideFromNavState();
}

class GuideFromNavState extends State<GuideFromNav> {
  late List<dynamic> _recognitions = [];
  int _imageHeight = 0;
  int _imageWidth = 0;

  bool clicked = true;

  @override
  void initState() {
    loadModel();
    super.initState();
  }

  loadModel() async {
    String res;
    res = (await Tflite.loadModel(
      numThreads: 1,
      //model: "assets/weights/lite-model_movenet_singlepose_lightning_3.tflite",
      model: "assets/weights/posenet_mv1_075_float_from_checkpoints.tflite",
    ).then(
      (value) {
        return '';
      },
    ));
  }

  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cTheme,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: HomeAppBar(
          barTitle: TextInit(
            textIn: Document.guides,
            fSize: 18,
            clr: AppColors.cWhite,
            fontWeight: FontWeight.bold,
          ),
          barActions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 30,
              ),
            )
          ],
          bottomWidgets: SizedBox(
            width: displayWidth(context) - 40, //Constant.screenWidth - 40,
            child: TextInit(
              textIn: Document.guideScreenMessage,
              fSize: 13.5,
              clr: AppColors.cWhite,
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.cWhite,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        child: ListView.builder(
          itemCount: Document.guidesList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: GuideBookTile(
                title: Document.guidesList[index],
                leading: ImagePath.guideBook[index],
                clicked: clicked,
                goto: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SumoPulsesExerciseMain(),
                    ),
                  );
                  // if (Document.guidesList[index] == Document.guidesList[0]) {
                  // Navigator.of(context).pushNamed(
                  //   RouteAddress.workOutVideos,
                  // );
                  // }
                },
              ),
            );
          },
        ),
      ),
    );
    // return SafeArea(
    //   child: Scaffold(
    //     backgroundColor: ColorCode.cWhite,
    //     body: Stack(
    //       children: [
    //         Camera(
    //           cameras,
    //           setRecognitions,
    //         ),
    //         // BndBox(
    //         //   _recognitions,
    //         //   math.max(_imageHeight, _imageWidth),
    //         //   math.min(_imageHeight, _imageWidth),
    //         //   screen.height,
    //         //   screen.width,
    //         // ),
    //         // RenderData(
    //         //   data: _recognitions,
    //         //   previewH: math.max(_imageHeight, _imageWidth),
    //         //   previewW: math.min(_imageHeight, _imageWidth),
    //         //   screenH: screen.height,
    //         //   screenW: screen.width,
    //         // ),
    //         // RenderDataArmPress(
    //         //   data: _recognitions,
    //         //   previewH: math.max(_imageHeight, _imageWidth),
    //         //   previewW: math.min(_imageHeight, _imageWidth),
    //         //   screenH: screen.height,
    //         //   screenW: screen.width,
    //         // ),
    //         SumoPulsesExercise(
    //           data: _recognitions,
    //           previewH: math.max(_imageHeight, _imageWidth),
    //           previewW: math.min(_imageHeight, _imageWidth),
    //           screenH: screen.height,
    //           screenW: screen.width,
    //         ),
    //         // Container(
    //         //   height: Constant.screenHeight,
    //         //   width: Constant.screenWidth,
    //         //   decoration: BoxDecoration(
    //         //     border: Border.all(
    //         //       width: 25,
    //         //       color: (isInBound)
    //         //           ? (const Color.fromARGB(61, 76, 175, 79))
    //         //           : const Color.fromARGB(62, 244, 67, 54),
    //         //     ),
    //         //   ),
    //         // ),
    //         // Center(
    //         //   child: SizedBox(
    //         //     height: 450,
    //         //     child: Column(
    //         //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         //       children: [
    //         //         SizedBox(
    //         //           child: Column(
    //         //             children: <Widget>[
    //         //               Text(
    //         //                 'Count ${count.toString()}',
    //         //                 style: const TextStyle(
    //         //                   fontSize: 50,
    //         //                   color: Colors.white,
    //         //                 ),
    //         //               ),
    //         //               GeneralButton(
    //         //                 clickAble: true,
    //         //                 buttonColor: ColorCode.cTheme,
    //         //                 doThis: (() {
    //         //                   count = 0;
    //         //                 }),
    //         //                 buttonTitle: TextInit(
    //         //                   textIn: 'Reset !',
    //         //                   fSize: 15,
    //         //                   clr: ColorCode.cWhite,
    //         //                 ),
    //         //                 horizontalScale: 100,
    //         //               )
    //         //             ],
    //         //           ),
    //         //         ),
    //         //         (isInBound)
    //         //             ? const Center(
    //         //                 child: Text(
    //         //                   '',
    //         //                 ),
    //         //               )
    //         //             : const Center(
    //         //                 child: Text(
    //         //                   'out of frame',
    //         //                   style: TextStyle(
    //         //                     fontSize: 50,
    //         //                     color: Colors.red,
    //         //                   ),
    //         //                 ),
    //         //               ),
    //         //       ],
    //         //     ),
    //         //   ),
    //         // )
    //       ],
    //     ),
    //   ),
    // );
  }
}

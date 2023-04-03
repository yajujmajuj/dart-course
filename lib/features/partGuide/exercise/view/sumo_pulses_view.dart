import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:healthandwellness/res/components/app_sized_box.dart';
import 'package:healthandwellness/res/components/responsive_height_width.dart';
import 'package:healthandwellness/res/const_string/const_strings.dart';
import 'dart:math' as math hide log;
import '../../../../main.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../res/components/widget_repo.dart';
import '../ex_components/cameraa.dart';
import '../ex_model/load_model.dart';
import '../repository/sumo_pulses_exercise.dart';

class SumoPulsesExerciseMain extends StatefulWidget {
  const SumoPulsesExerciseMain({super.key});

  @override
  SumoPulsesExerciseMainState createState() => SumoPulsesExerciseMainState();
}

class SumoPulsesExerciseMainState extends State<SumoPulsesExerciseMain> {
  late List<dynamic> _recognitions = [];
  int _imageHeight = 0;
  int _imageWidth = 0;

  @override
  void initState() {
    loadModel();
    super.initState();
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.cWhite,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBar(
            barTitle: TextInit(
              textIn: Document.workOut,
              fSize: 18,
              clr: AppColors.cWhite,
              fontWeight: FontWeight.bold,
            ),
            barActions: [
              const Center(),
              5.pw,
            ],
          ),
        ),
        body: Stack(
          children: [
            Camera(
              cameras,
              setRecognitions,
            ),
            SumoPulsesExercise(
              data: _recognitions,
              previewH: math.max(_imageHeight, _imageWidth),
              previewW: math.min(_imageHeight, _imageWidth),
              screenH: displaySize(context).height,
              screenW: displaySize(context).width,
            ),
          ],
        ),
      ),
    );
  }
}

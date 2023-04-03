import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:healthandwellness/res/const_string/const_strings.dart';
import 'dart:math' as math hide log;
import '../../../../main.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../res/components/widget_repo.dart';
import '../ex_components/cameraa.dart';
import '../ex_model/load_model.dart';
import '../repository/seal_jacks_exercise.dart';

class SealJacksExerciseView extends StatefulWidget {
  const SealJacksExerciseView({super.key});

  @override
  SeaJacksExerciseViewState createState() => SeaJacksExerciseViewState();
}

class SeaJacksExerciseViewState extends State<SealJacksExerciseView> {
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
    Size screen = MediaQuery.of(context).size;
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
            barActions: const [Center()],
          ),
        ),
        body: Stack(
          children: [
            Camera(
              cameras,
              setRecognitions,
            ),
            SealJacksExercise(
              data: _recognitions,
              previewH: math.max(_imageHeight, _imageWidth),
              previewW: math.min(_imageHeight, _imageWidth),
              screenH: screen.height,
              screenW: screen.height,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:healthandwellness/features/partGuide/exercise/repository/side_lunges_exercise.dart';
import 'dart:math' as math hide log;
import '../../../../main.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../res/components/widget_repo.dart';
import '../../../../res/const_string/const_strings.dart';
import '../ex_components/cameraa.dart';
import '../ex_model/load_model.dart';

class SideLungesView extends StatefulWidget {
  const SideLungesView({super.key});

  @override
  SideLungesViewState createState() => SideLungesViewState();
}

class SideLungesViewState extends State<SideLungesView> {
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
            SideLungesExercise(
              data: _recognitions,
              previewH: math.max(_imageHeight, _imageWidth),
              previewW: math.min(_imageHeight, _imageWidth),
              screenH: screen.height,
              screenW: screen.width,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:healthandwellness/res/components/responsive_height_width.dart';
import 'package:healthandwellness/res/const_string/const_strings.dart';
import 'dart:math' as math hide log;
import '../../../../main.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../res/components/widget_repo.dart';
import '../ex_components/cameraa.dart';
import '../ex_model/load_model.dart';
import '../repository/sit_up_exercise.dart';
import '../repository/sumo_pulses_exercise.dart';

class SitUpView extends StatefulWidget {
  const SitUpView({super.key});

  @override
  SitUpViewState createState() => SitUpViewState();
}

class SitUpViewState extends State<SitUpView> {
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
            barActions: const [Center()],
          ),
        ),
        body: Stack(
          children: [
            Camera(
              cameras,
              setRecognitions,
            ),
            SitUpExercise(
              data: _recognitions,
              screenW: displaySize(context).width,
              screenH: displaySize(context).height,
              previewH: math.max(_imageHeight, _imageWidth),
              previewW: math.min(_imageHeight, _imageWidth),
            ),
          ],
        ),
      ),
    );
  }
}

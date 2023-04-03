import 'dart:math' hide log;
import 'package:flutter/material.dart';

class SumoSquatsExercise extends StatefulWidget {
  final List<dynamic> data;
  final int previewH;
  final int previewW;
  final double screenH;
  final double screenW;

  const SumoSquatsExercise({
    Key? key,
    required this.previewH,
    required this.previewW,
    required this.screenH,
    required this.screenW,
    required this.data,
  }) : super(key: key);

  @override
  State<SumoSquatsExercise> createState() => _SumoSquatsExerciseState();
}

class _SumoSquatsExerciseState extends State<SumoSquatsExercise> {
  late Map<String, List<double>> inputArr;
  String exercise = 'squat';
  double upperRange = 300;
  double lowerRange = 500;
  late bool midCount, isCorrectPosture;
  late int _counter;
  late Color correctColor;
  late double shoulderLY;
  late double shoulderRY;
  late double kneeRY;
  late double kneeLY;
  late bool squatUp;
  String whatToDo = 'Finding Posture';
  var leftEyePos = Vector(0, 0);
  var rightEyePos = Vector(0, 0);
  var leftShoulderPos = Vector(0, 0);
  var rightShoulderPos = Vector(0, 0);
  var leftHipPos = Vector(0, 0);
  var rightHipPos = Vector(0, 0);
  var leftElbowPos = Vector(0, 0);
  var rightElbowPos = Vector(0, 0);
  var leftWristPos = Vector(0, 0);
  var rightWristPos = Vector(0, 0);
  var leftKneePos = Vector(0, 0);
  var rightKneePos = Vector(0, 0);
  var leftAnklePos = Vector(0, 0);
  var rightAnklePos = Vector(0, 0);

  @override
  void initState() {
    inputArr = new Map();
    midCount = false;
    isCorrectPosture = false;
    _counter = 0;
    correctColor = Colors.red;
    shoulderLY = 0;
    shoulderRY = 0;
    kneeRY = 0;
    kneeLY = 0;
    squatUp = true;
    super.initState();
  }

  bool _postureAccordingToExercise(Map<String, List<double>> poses) {
    setState(() {
      shoulderLY = poses['leftShoulder']![1];
      shoulderRY = poses['rightShoulder']![1];
      kneeLY = poses['leftKnee']![1];
      kneeRY = poses['rightKnee']![1];
    });
    if (exercise == 'squat') {
      if (squatUp) {
        return poses['leftShoulder']![1] < 320 &&
            poses['leftShoulder']![1] > 280 &&
            poses['rightShoulder']![1] < 320 &&
            poses['rightShoulder']![1] > 280 &&
            poses['rightKnee']![1] > 570 &&
            poses['leftKnee']![1] > 570;
      } else {
        return poses['leftShoulder']![1] > 475 &&
            poses['rightShoulder']![1] > 475;
      }
    }
    return false;
  }

  _checkCorrectPosture(Map<String, List<double>> poses) {
    if (_postureAccordingToExercise(poses)) {
      if (!isCorrectPosture) {
        setState(() {
          isCorrectPosture = true;
          correctColor = Colors.green;
        });
      }
    } else {
      if (isCorrectPosture) {
        setState(() {
          isCorrectPosture = false;
          correctColor = Colors.red;
        });
      }
    }
  }

  Future<void> _countingLogic(Map<String, List<double>> poses) async {
    if (poses != null) {
      _checkCorrectPosture(poses);

      if (isCorrectPosture && squatUp && midCount == false) {
        //in correct initial posture
        setState(() {
          whatToDo = 'Squat Down';
          correctColor = Colors.green;
        });
        squatUp = !squatUp;
        isCorrectPosture = false;
      }

      //lowered all the way
      if (isCorrectPosture && !squatUp && midCount == false) {
        midCount = true;
        isCorrectPosture = false;
        squatUp = !squatUp;
        setState(() {
          whatToDo = 'Go Up';
          correctColor = Colors.green;
        });
      }

      //back up
      if (midCount &&
          poses['leftShoulder']![1] < 320 &&
          poses['leftShoulder']![1] > 280 &&
          poses['rightShoulder']![1] < 320 &&
          poses['rightShoulder']![1] > 280) {
        incrementCounter();
        midCount = false;
        squatUp = !squatUp;
        setState(() {
          //whatToDo = 'Go Up';
        });
      }
    }
  }

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    void _getKeyPoints(k, x, y) {
      if (k["part"] == 'leftEye') {
        leftEyePos.x = x;
        leftEyePos.y = y - 100;
      }
      if (k["part"] == 'rightEye') {
        rightEyePos.x = x;
        rightEyePos.y = y - 100;
      }
      if (k["part"] == 'leftShoulder') {
        leftShoulderPos.x = x;
        leftShoulderPos.y = y - 100;
      }
      if (k["part"] == 'rightShoulder') {
        rightShoulderPos.x = x;
        rightShoulderPos.y = y - 100;
      }
      if (k["part"] == 'leftElbow') {
        leftElbowPos.x = x;
        leftElbowPos.y = y - 100;
      }
      if (k["part"] == 'rightElbow') {
        rightElbowPos.x = x;
        rightElbowPos.y = y - 100;
      }
      if (k["part"] == 'leftWrist') {
        leftWristPos.x = x;
        leftWristPos.y = y - 100;
      }
      if (k["part"] == 'rightWrist') {
        rightWristPos.x = x;
        rightWristPos.y = y - 100;
      }
      if (k["part"] == 'leftHip') {
        leftHipPos.x = x;
        leftHipPos.y = y - 100;
      }
      if (k["part"] == 'rightHip') {
        rightHipPos.x = x;
        rightHipPos.y = y - 100;
      }
      if (k["part"] == 'leftKnee') {
        leftKneePos.x = x;
        leftKneePos.y = y - 100;
      }
      if (k["part"] == 'rightKnee') {
        rightKneePos.x = x;
        rightKneePos.y = y - 100;
      }
      if (k["part"] == 'leftAnkle') {
        leftAnklePos.x = x;
        leftAnklePos.y = y - 100;
      }
      if (k["part"] == 'rightAnkle') {
        rightAnklePos.x = x;
        rightAnklePos.y = y - 100;
      }
    }

    List<Widget> _renderKeypoints() {
      var lists = <Widget>[];
      widget.data.forEach((re) {
        var list = re["keypoints"].values.map<Widget>((k) {
          var _x = k["x"];
          var _y = k["y"];
          var scaleW, scaleH, x, y;

          if (widget.screenH / widget.screenW >
              widget.previewH / widget.previewW) {
            scaleW = widget.screenH / widget.previewH * widget.previewW;
            scaleH = widget.screenH;
            var difW = (scaleW - widget.screenW) / scaleW;
            x = (_x - difW / 2) * scaleW;
            y = _y * scaleH;
          } else {
            scaleH = widget.screenW / widget.previewW * widget.previewH;
            scaleW = widget.screenW;
            var difH = (scaleH - widget.screenH) / scaleH;
            x = _x * scaleW;
            y = (_y - difH / 2) * scaleH;
          }
          inputArr[k['part']] = [x, y];
          //Mirroring
          // if (x > 320) {
          //   var temp = x - 320;
          //   x = 320 - temp;
          // } else {
          //   var temp = 320 - x;
          //   x = 320 + temp;
          // }

          _getKeyPoints(k, x, y);

          if (k["part"] == 'leftEye') {
            leftEyePos.y = x - 230;
            leftEyePos.x = y - 100;
          }
          if (k["part"] == 'rightEye') {
            rightEyePos.y = x - 230;
            rightEyePos.x = y - 100;
          }
          return Positioned(
            left: x - 230,
            top: y - 50,
            width: 100,
            height: 15,
            child: Container(
                // color: Colors.black,
                // child: Column(
                //   children: [
                //     Expanded(
                //       child: Text(
                //         "$wristLY",
                //         style: const TextStyle(
                //           color: Color.fromRGBO(37, 213, 253, 1.0),
                //           fontSize: 7.0,
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Text(
                //         "$wristRY",
                //         style: const TextStyle(
                //           color: Color.fromRGBO(37, 213, 253, 1.0),
                //           fontSize: 7.0,
                //         ),
                //       ),
                //     ),
                //     // Expanded(
                //     //   child: Text(
                //     //     "$rightWristY",
                //     //     style: const TextStyle(
                //     //       color: Color.fromRGBO(37, 213, 253, 1.0),
                //     //       fontSize: 7.0,
                //     //     ),
                //     //   ),
                //     // ),
                //     // Expanded(
                //     //   child: Text(
                //     //     "$rightWristX",
                //     //     style: const TextStyle(
                //     //       color: Color.fromRGBO(37, 213, 253, 1.0),
                //     //       fontSize: 7.0,
                //     //     ),
                //     //   ),
                //     // ),
                //   ],
                // ),
                ),
          );
        }).toList();

        _countingLogic(inputArr);
        inputArr.clear();

        lists.addAll(list);
      });
      //lists.clear();

      return lists;
    }

    return Stack(
      children: [
        Stack(
          children: [
            CustomPaint(
              painter: MyPainter(
                  left: leftShoulderPos,
                  right: rightShoulderPos,
                  color: correctColor),
            ),
            CustomPaint(
              painter: MyPainter(
                  left: leftElbowPos,
                  right: leftShoulderPos,
                  color: correctColor),
            ),
            CustomPaint(
              painter: MyPainter(
                  left: leftWristPos, right: leftElbowPos, color: correctColor),
            ),
            CustomPaint(
              painter: MyPainter(
                left: rightElbowPos,
                right: rightShoulderPos,
                color: correctColor,
              ),
            ),
            CustomPaint(
              painter: MyPainter(
                  left: rightWristPos,
                  right: rightElbowPos,
                  color: correctColor),
            ),
            CustomPaint(
              painter: MyPainter(
                left: leftShoulderPos,
                right: leftHipPos,
                color: correctColor,
              ),
            ),
            CustomPaint(
              painter: MyPainter(
                left: leftHipPos,
                right: leftKneePos,
                color: correctColor,
              ),
            ),
            CustomPaint(
              painter: MyPainter(
                left: leftKneePos,
                right: leftAnklePos,
                color: correctColor,
              ),
            ),
            CustomPaint(
              painter: MyPainter(
                left: rightShoulderPos,
                right: rightHipPos,
                color: correctColor,
              ),
            ),
            CustomPaint(
              painter: MyPainter(
                left: rightHipPos,
                right: rightKneePos,
                color: correctColor,
              ),
            ),
            CustomPaint(
              painter: MyPainter(
                left: rightKneePos,
                right: rightAnklePos,
                color: correctColor,
              ),
            ),
            CustomPaint(
              painter: MyPainter(
                left: leftHipPos,
                right: rightHipPos,
                color: correctColor,
              ),
            ),
          ],
        ),
        Stack(
          children: _renderKeypoints(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 50,
            width: widget.screenW,
            decoration: BoxDecoration(
              color: correctColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25),
              ),
            ),
            child: Center(
              child: Text(
                '$whatToDo\nArm Presses: ${_counter.toString()}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Vector {
  double x, y;

  Vector(this.x, this.y);
}

class MyPainter extends CustomPainter {
  Vector left;
  Vector right;
  Color color;

  MyPainter({
    required this.left,
    required this.right,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(left.x, left.y);
    final p2 = Offset(right.x, right.y);
    final paint = Paint()
      ..color = color
      ..strokeWidth = 4;
    canvas.drawLine(
      p1,
      p2,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';

class SealJacksExercise extends StatefulWidget {
  final List<dynamic> data;
  final int previewH;
  final int previewW;
  final double screenH;
  final double screenW;

  const SealJacksExercise({
    super.key,
    required this.data,
    required this.previewH,
    required this.previewW,
    required this.screenH,
    required this.screenW,
  });

  @override
  _SealJacksExerciseState createState() => _SealJacksExerciseState();
}

class _SealJacksExerciseState extends State<SealJacksExercise> {
  late Map<String, List<double>> inputArr;

  String excercise = 'warrior';
  late Color correctColor;
  late Color armColor, shoulderColor, legColor;
  int counter = 0;
  String memo = 'Warrior position not aligned.';

  late double leftShoulderY = 0,
      rightShoulderY = 0,
      leftWristX = 0,
      leftWristY = 0,
      rightWristX = 0,
      rightWristY = 0,
      leftAnkleX = 0,
      rightAnkleX = 0,
      leftKneeY,
      leftHipY;

  late bool wristAlignment,
      shoulderAlignment,
      ankleAlignment,
      kneeAndHipAlignment;

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
    correctColor = Colors.red;
    wristAlignment = false;
    shoulderAlignment = false;
    ankleAlignment = false;
    kneeAndHipAlignment = false;
    armColor = Colors.red;
    shoulderColor = Colors.red;
    legColor = Colors.red;
    super.initState();
  }

  void _postureAccordingToExercise(Map<String, List<double>> poses) {
    setState(() {
      leftShoulderY = poses['leftShoulder']![1];
      rightShoulderY = poses['rightShoulder']![1];
      leftWristX = poses['leftWrist']![0];
      leftWristY = poses['leftWrist']![1];
      rightWristX = poses['rightWrist']![0];
      rightWristY = poses['leftWrist']![1];
      leftAnkleX = poses['leftAnkle']![0];
      rightAnkleX = poses['rightAnkle']![0];
      leftKneeY = poses['leftKnee']![1];
      leftHipY = poses['leftHip']![1];
    });

    // if (leftShoulderY > 300 && rightShoulderY > 400) {
    if (leftWristX < 230 && rightWristX < 230 //&&
        // leftAnkleX > 500 &&
        // rightAnkleX > 200
        ) {
      if (!wristAlignment) {
        wristAlignment = true;
        incrementCounter();
      }
      armColor = Colors.green;
      memo = 'Position aligned!';
      shoulderColor = Colors.green;
      correctColor = Colors.green;
    } else {
      wristAlignment = false;
      armColor = Colors.red;
      memo = 'Position not aligned.';
      shoulderColor = Colors.red;
      correctColor = Colors.red;
    }
  }

  void incrementCounter() {
    setState(() {
      counter++;
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
            left: x,
            top: y - 100,
            width: 100,
            height: 25,
            child: Container(
              color: Colors.black,
              child: Column(
                children: [
                  Expanded(
                    child: Text(
                      "$rightShoulderY",
                      style: const TextStyle(
                        color: Color.fromRGBO(37, 213, 253, 1.0),
                        fontSize: 7.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "$leftShoulderY",
                      style: const TextStyle(
                        color: Color.fromRGBO(37, 213, 253, 1.0),
                        fontSize: 7.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList();

        _postureAccordingToExercise(inputArr);
        //_countingLogic(inputArr);
        inputArr.clear();
        lists.addAll(list);
      });
      return lists;
    }

    return Stack(
      children: <Widget>[
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
                left: leftWristPos,
                right: leftElbowPos,
                color: correctColor,
              ),
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
                color: correctColor,
              ),
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
        Stack(children: _renderKeypoints()),
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
            child: Column(
              children: [
                Text(
                  //'$whatToDo\nArm Presses: ${_counter.toString()}',
                  memo + counter.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
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

  MyPainter({required this.left, required this.right, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(left.x, left.y);
    final p2 = Offset(right.x, right.y);
    final paint = Paint()
      ..color = color //Colors.blue
      ..strokeWidth = 4;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

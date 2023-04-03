import 'package:flutter/material.dart';
import '../ex_components/key_points.dart';

class SidePlankExercise extends StatefulWidget {
  final List<dynamic> data;
  final int previewH;
  final int previewW;
  final double screenH;
  final double screenW;

  const SidePlankExercise(
      {super.key,
      required this.data,
      required this.previewH,
      required this.previewW,
      required this.screenH,
      required this.screenW});

  @override
  _SidePlankExerciseState createState() => _SidePlankExerciseState();
}

class _SidePlankExerciseState extends State<SidePlankExercise> {
  late Map<String, List<double>> inputArr;

  late Color correctColor;
  late Color armColor, shoulderColor, legColor;
  String memo = 'Warrior position not aligned.';
  int counter = 0;

  late double leftShoulderY,
      rightShoulderY,
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

    if (leftWristY > 230 &&
        leftWristX > 250 &&
        rightWristY > 230 &&
        rightWristX > 140) {
      wristAlignment = true;
      setState(() {
        armColor = Colors.green;
        shoulderColor = Colors.green;
      });
    } else {
      wristAlignment = false;
      setState(() {
        armColor = Colors.red;
        shoulderColor = Colors.red;
      });
    }

    if (wristAlignment) {
      setState(() {
        correctColor = Colors.green;
        memo = 'Position aligned!';
      });
    } else {
      setState(() {
        correctColor = Colors.red;
        memo = 'Position not aligned.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> renderKeyPoints() {
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

          getKeyPoints(
            k,
            x,
            y,
            leftEyePos,
            rightEyePos,
            leftHipPos,
            leftShoulderPos,
            leftAnklePos,
            rightKneePos,
            rightAnklePos,
            rightShoulderPos,
            leftElbowPos,
            rightElbowPos,
            rightHipPos,
            leftKneePos,
            leftWristPos,
            rightWristPos,
          );

          if (k["part"] == 'leftEye') {
            leftEyePos.x = x - 230;
            leftEyePos.y = y - 100;
          }
          if (k["part"] == 'rightEye') {
            rightEyePos.x = x - 230;
            rightEyePos.y = y - 100;
          }
          return Positioned(
            left: x,
            top: y - 100,
            width: 100,
            height: 25,
            child: Container(
                // color: Colors.black,
                // child: Column(
                //   children: [
                //     Expanded(
                //       child: Text(
                //         "leftWristX$leftWristX",
                //         style: const TextStyle(
                //           color: Color.fromRGBO(37, 213, 253, 1.0),
                //           fontSize: 7.0,
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Text(
                //         "rightWristX$rightWristX",
                //         style: const TextStyle(
                //           color: Color.fromRGBO(37, 213, 253, 1.0),
                //           fontSize: 7.0,
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Text(
                //         "leftAnkleX$leftAnkleX",
                //         style: const TextStyle(
                //           color: Color.fromRGBO(37, 213, 253, 1.0),
                //           fontSize: 7.0,
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Text(
                //         "rightAnkleX$rightAnkleX",
                //         style: const TextStyle(
                //           color: Color.fromRGBO(37, 213, 253, 1.0),
                //           fontSize: 7.0,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                ),
          );
        }).toList();

        _postureAccordingToExercise(inputArr);
        inputArr.clear();

        lists.addAll(list);
      });
      //lists.clear();

      return lists;
    }

    return Stack(
      children: <Widget>[
        Stack(
          children: [
            ///between shoulders
            CustomPaint(
              painter: MyPainter(
                left: leftShoulderPos,
                right: rightShoulderPos,
                color: shoulderColor,
              ),
            ),

            ///left upper arm
            CustomPaint(
              painter: MyPainter(
                left: leftElbowPos,
                right: leftShoulderPos,
                color: armColor,
              ),
            ),

            ///left lower arm
            CustomPaint(
              painter: MyPainter(
                left: leftWristPos,
                right: leftElbowPos,
                color: armColor,
              ),
            ),

            ///right arm
            CustomPaint(
              painter: MyPainter(
                left: rightElbowPos,
                right: rightShoulderPos,
                color: armColor,
              ),
            ),
            CustomPaint(
              painter: MyPainter(
                left: rightWristPos,
                right: rightElbowPos,
                color: armColor,
              ),
            ),
            CustomPaint(
              painter: MyPainter(
                left: leftShoulderPos,
                right: leftHipPos,
                color: shoulderColor,
              ),
            ),
            CustomPaint(
              painter: MyPainter(
                left: leftHipPos,
                right: leftKneePos,
                color: shoulderColor,
              ),
            ),
            CustomPaint(
              painter: MyPainter(
                left: leftKneePos,
                right: leftAnklePos,
                color: shoulderColor,
              ),
            ),
            CustomPaint(
              painter: MyPainter(
                left: rightShoulderPos,
                right: rightHipPos,
                color: shoulderColor,
              ),
            ),
            CustomPaint(
              painter: MyPainter(
                left: rightHipPos,
                right: rightKneePos,
                color: shoulderColor,
              ),
            ),
            CustomPaint(
              painter: MyPainter(
                left: rightKneePos,
                right: rightAnklePos,
                color: shoulderColor,
              ),
            ),
            CustomPaint(
              painter: MyPainter(
                left: leftHipPos,
                right: rightHipPos,
                color: shoulderColor,
              ),
            ),
          ],
        ),
        Stack(children: renderKeyPoints()),
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
                  memo,
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

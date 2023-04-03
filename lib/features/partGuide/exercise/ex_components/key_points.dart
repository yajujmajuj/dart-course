import 'package:flutter/material.dart';

void getKeyPoints(
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
    rightWristPos) {
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

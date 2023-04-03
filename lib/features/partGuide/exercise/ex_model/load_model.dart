import 'package:flutter_tflite/flutter_tflite.dart';

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

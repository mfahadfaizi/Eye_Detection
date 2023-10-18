import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:task_hashone/Screens/end_page.dart';

import 'camera_view.dart';
import 'painters/face_detector_painter.dart';

class EyeDetector extends StatefulWidget {
  const EyeDetector({super.key});

  @override
  State<EyeDetector> createState() => _EyeDetectorState();
}

class _EyeDetectorState extends State<EyeDetector> {
  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableContours: false,
      enableClassification: true,
      enableLandmarks: false,
      enableTracking: true,
      minFaceSize: 0.1,
      performanceMode: FaceDetectorMode.fast,
    ),
  );
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;

  String rightEye = "Fit your face in the box";
  String leftEye = "Fit your face in the box";

  @override
  void dispose() {
    _canProcess = false;
    _faceDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CameraView(
      title: 'Eye Detector',
      customPaint: _customPaint,
      text: _text,
      onImage: (inputImage) {
        navigateToLast();
        processImage(inputImage);
        if (kDebugMode) {
          // print(inputImage.toJson());
        }
      },
      initialDirection: CameraLensDirection.front,
      rightEyesStatus: rightEye,
      leftEyesStatus: leftEye,
    );
  }

  navigateToLast() {
    if (leftEye == "Closed" && rightEye == "Closed") {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (c) => const EndPage()));
    }
  }

  Future<void> processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    setState(() {
      _text = '';
    });
    final faces = await _faceDetector.processImage(inputImage);
    if (inputImage.inputImageData?.size != null &&
        inputImage.inputImageData?.imageRotation != null) {
      final painter = FaceDetectorPainter(
          faces,
          inputImage.inputImageData!.size,
          inputImage.inputImageData!.imageRotation);
      _customPaint = CustomPaint(painter: painter);

      for (final face in faces) {
        if (face.leftEyeOpenProbability! >= 0.5) {
          setState(() {
            rightEye = "Open";
          });
        } else {
          setState(() {
            rightEye = "Closed";
          });
        }
        if (face.rightEyeOpenProbability! >= 0.5) {
          setState(() {
            leftEye = "Open";
          });
        } else {
          setState(() {
            leftEye = "Closed";
          });
        }
      }
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }
}

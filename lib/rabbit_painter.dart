
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RabbitPainter extends CustomPainter{

  final Listenable controller;
  final Animation bodyAnimation;
  final Animation fillAnimation;
  final Animation fillRadishHeaderAnimation;
  final Animation fillRadishBodyAnimation;
  final Animation fillLeftEarAnimation;
  final Animation fillRightEarAnimation;
  final Animation fillLeftFaceAnimation;
  final Animation fillRightFaceAnimation;

  RabbitPainter({
    required this.controller,
    required this.bodyAnimation,
    required this.fillAnimation,
    required this.fillRadishHeaderAnimation,
    required this.fillRadishBodyAnimation,
    required this.fillLeftEarAnimation,
    required this.fillRightEarAnimation,
    required this.fillLeftFaceAnimation,
    required this.fillRightFaceAnimation,
  }) : super(repaint: controller);

  late final Paint _paint = Paint()..isAntiAlias = true..strokeCap = StrokeCap.round;


  @override
  void paint(Canvas canvas, Size size) async{
    _paint.color = Colors.yellow;
    _paint.style = PaintingStyle.fill;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), _paint);


    var position1 = Offset(110.w, 100.w);
    var position2 = Offset(30.w, position1.dy + 20.w);
    var position3 = Offset(40.w, position2.dy + 100.w);
    var position4 = Offset(110.w, position3.dy + 10.w);

    var position5 = Offset(50.w, position4.dy + 20.w);
    var position6 = Offset(60.w, position5.dy + 80.w);
    var position7 = Offset(125.w, position6.dy + 10.w);

    var leftBodyPath = getThreePath(position1, position2, position3, position4, position5, position6, position7);





    var matrix4 = Matrix4.translationValues(0.8.sw, 0, 0);
    matrix4.rotateY(2*pi/2);
    var rightPath = leftBodyPath.transform(matrix4.storage);



    var leftPathMetric = leftBodyPath.computeMetrics().first;
    var leftFirstPosition = leftPathMetric.getTangentForOffset(0)?.position ?? Offset.zero;
    var rightPathMetric = rightPath.computeMetrics().first;
    var rightFirstPosition = rightPathMetric.getTangentForOffset(0)?.position ?? Offset.zero;

    var centerWidth = rightFirstPosition.dx - leftFirstPosition.dx;

    Path earPath = Path();
    earPath.moveTo(leftFirstPosition.dx, leftFirstPosition.dy);
    earPath.cubicTo(leftFirstPosition.dx  -50.w, -20.w, leftFirstPosition.dx  + centerWidth/2, -20.w, leftFirstPosition.dx  + centerWidth/2, leftFirstPosition.dy);

    earPath.cubicTo(leftFirstPosition.dx  + centerWidth/2 + 5.w, -12.w, rightFirstPosition.dx  + 55.w, -12.w, rightFirstPosition.dx, rightFirstPosition.dy);



    var handsFeetPosition1 = Offset(position4.dx + 10.w, position4.dy + 10.w);
    var handsFeetPosition2 = Offset(handsFeetPosition1.dx + 20.w, handsFeetPosition1.dy + 5.w);
    var handsFeetPosition3 = Offset(handsFeetPosition2.dx + 20.w, handsFeetPosition2.dy + 40.w);
    var handsFeetPosition4 = Offset(handsFeetPosition1.dx, handsFeetPosition3.dy + 15.w);

    var handsFeetPosition5 = Offset(handsFeetPosition4.dx + 20.w, handsFeetPosition4.dy + 10.w);
    var handsFeetPosition6 = Offset(handsFeetPosition5.dx + 10.w, handsFeetPosition5.dy + 20.w);
    var handsFeetPosition7 = Offset(position7.dx, position7.dy);

    var leftHandsFeetPath = getThreePath(handsFeetPosition1, handsFeetPosition2, handsFeetPosition3, handsFeetPosition4, handsFeetPosition5, handsFeetPosition6, handsFeetPosition7);


    var rightHandsFeetPosition1 = Offset(position4.dx + 80.w, position4.dy + 15.w);
    var rightHandsFeetPosition2 = Offset(rightHandsFeetPosition1.dx - 20.w, rightHandsFeetPosition1.dy + 5.w);
    var rightHandsFeetPosition3 = Offset(rightHandsFeetPosition2.dx - 15.w, rightHandsFeetPosition2.dy + 30.w);
    var rightHandsFeetPosition4 = Offset(rightHandsFeetPosition1.dx - 15.w, rightHandsFeetPosition3.dy + 15.w);

    var rightHandsFeetPosition5 = Offset(rightHandsFeetPosition4.dx - 15.w, rightHandsFeetPosition4.dy + 10.w);
    var rightHandsFeetPosition6 = Offset(rightHandsFeetPosition5.dx - 5.w, rightHandsFeetPosition5.dy + 20.w);

    var rightLastPosition = rightPathMetric.getTangentForOffset(rightPathMetric.length)?.position ?? Offset.zero;
    var rightHandsFeetPosition7 = Offset(rightLastPosition.dx, rightLastPosition.dy);

    var rightHandsFeetPath = getThreePath(rightHandsFeetPosition1, rightHandsFeetPosition2, rightHandsFeetPosition3, rightHandsFeetPosition4, rightHandsFeetPosition5, rightHandsFeetPosition6, rightHandsFeetPosition7);


    Path radishHeadPath = Path();
    radishHeadPath.moveTo(handsFeetPosition1.dx + 20.w, handsFeetPosition1.dy - 5.w);
    radishHeadPath.cubicTo(handsFeetPosition1.dx -5.w, handsFeetPosition1.dy -45.w, handsFeetPosition1.dx  + 45.w, handsFeetPosition1.dy-45.w, handsFeetPosition1.dx + 35.w, handsFeetPosition1.dy - 10.w);

    radishHeadPath.cubicTo(handsFeetPosition1.dx + 40.w, handsFeetPosition1.dy -35.w, rightFirstPosition.dx  + 0.w, handsFeetPosition1.dy-35.w, handsFeetPosition1.dx + 50.w, handsFeetPosition1.dy - 5.w);



    var radishHeadMinYPosition = getMinYPositionFromPath(radishHeadPath);
    var mouthPosition1 = Offset(radishHeadMinYPosition.dx - 10.w, radishHeadMinYPosition.dy - 20.w);
    var mouthPosition2 = Offset(mouthPosition1.dx - 2.w, mouthPosition1.dy + 10.w);
    var mouthPosition3 = Offset(mouthPosition2.dx + 18.w, mouthPosition2.dy + 5.w);
    var mouthPosition4 = Offset(mouthPosition3.dx + 2.w, mouthPosition1.dy + 2.w);

    var mouthPosition5 = Offset(mouthPosition4.dx , mouthPosition4.dy + 10.w);
    var mouthPosition6 = Offset(mouthPosition5.dx + 18.w, mouthPosition5.dy + 2.w);
    var mouthPosition7 = Offset(mouthPosition6.dx + 2.w, mouthPosition1.dy);

    var mouthPath = getThreePath(mouthPosition1, mouthPosition2, mouthPosition3, mouthPosition4, mouthPosition5, mouthPosition6, mouthPosition7);



    Path leftEyesPath = Path();
    var leftEyesPosition1 = Offset(position1.dx - 5.w, position1.dy + 50.w);
    leftEyesPath.moveTo(leftEyesPosition1.dx, leftEyesPosition1.dy);
    leftEyesPath.quadraticBezierTo(leftEyesPosition1.dx + 10.w, leftEyesPosition1.dy - 13.w, leftEyesPosition1.dx + 20.w, leftEyesPosition1.dy);

    Path rightEyesPath = Path();
    var rightEyesPosition1 = Offset(rightFirstPosition.dx - 15.w, rightFirstPosition.dy + 50.w);
    rightEyesPath.moveTo(rightEyesPosition1.dx, rightEyesPosition1.dy);
    rightEyesPath.quadraticBezierTo(rightEyesPosition1.dx + 10.w, rightEyesPosition1.dy - 13.w, rightEyesPosition1.dx + 20.w, rightEyesPosition1.dy);







    var tailPath = Path();
    var tailPosition1 = getPositionFromPathPercent(rightPath, 0.8);
    var tailPosition2 = Offset(tailPosition1.dx + 35.w, tailPosition1.dy - 30.w);
    var tailPosition3 = Offset(tailPosition1.dx + 35.w, tailPosition1.dy + 40.w);
    var tailPosition4 = getPositionFromPathPercent(rightPath, 0.9);

    tailPath.moveTo(tailPosition1.dx, tailPosition1.dy);
    tailPath.cubicTo(tailPosition2.dx, tailPosition2.dy, tailPosition3.dx, tailPosition3.dy, tailPosition4.dx,  tailPosition4.dy);



    var radishTopPath = Path();
    var radishTopPosition1 = getPositionFromPathPercent(leftHandsFeetPath, 0.07);
    var radishTopPosition2 = getPositionFromPathPercent(radishHeadPath, 0).translate(0, -6.w);
    var radishTopPosition3 = getPositionFromPathPercent(radishHeadPath, 1).translate(0, -9.w);
    var radishTopPosition4 = getPositionFromPathPercent(rightHandsFeetPath, 0.07);
    radishTopPath.moveTo(radishTopPosition1.dx, radishTopPosition1.dy);
    radishTopPath.cubicTo(radishTopPosition2.dx, radishTopPosition2.dy, radishTopPosition3.dx, radishTopPosition3.dy, radishTopPosition4.dx,  radishTopPosition4.dy);



    var radishBottomPath = Path();
    var radishBottomPosition1 = getPositionFromPathPercent(leftHandsFeetPath, 0.9);
    var radishBottomPosition2 = Offset(radishBottomPosition1.dx + 18.w, radishBottomPosition1.dy+40.w);
    var radishBottomPosition3 = getPositionFromPathPercent(rightHandsFeetPath, 0.9);
    radishBottomPath.moveTo(radishBottomPosition1.dx, radishBottomPosition1.dy);
    radishBottomPath.quadraticBezierTo(radishBottomPosition2.dx, radishBottomPosition2.dy,  radishBottomPosition3.dx,  radishBottomPosition3.dy);



    var radishBodyPath1 = Path();
    var radishBodyPosition1 = getPositionFromPathPercent(leftHandsFeetPath, 0.3);
    var radishBodyPosition2 = Offset(radishBodyPosition1.dx + 5.w, radishBodyPosition1.dy-3.w);
    var radishBodyPosition3 = Offset(radishBodyPosition2.dx + 10.w, radishBodyPosition1.dy+3.w);
    radishBodyPath1.moveTo(radishBodyPosition1.dx, radishBodyPosition1.dy);
    radishBodyPath1.quadraticBezierTo(radishBodyPosition2.dx, radishBodyPosition2.dy,  radishBodyPosition3.dx,  radishBodyPosition3.dy);


    var radishBodyPath2 = Path();
    var radishBodyPosition4 = getPositionFromPathPercent(rightHandsFeetPath, 0.7);
    var radishBodyPosition5 = Offset(radishBodyPosition4.dx - 5.w, radishBodyPosition4.dy-3.w);
    var radishBodyPosition6 = Offset(radishBodyPosition5.dx - 10.w, radishBodyPosition5.dy+3.w);
    radishBodyPath2.moveTo(radishBodyPosition4.dx, radishBodyPosition4.dy);
    radishBodyPath2.quadraticBezierTo(radishBodyPosition5.dx, radishBodyPosition5.dy,  radishBodyPosition6.dx,  radishBodyPosition6.dy);


    var radishBodyPath3 = Path();
    var radishBodyPosition7 = getPositionFromPathPercent(rightHandsFeetPath, 0.78);
    var radishBodyPosition8 = Offset(radishBodyPosition7.dx - 3.w, radishBodyPosition7.dy-3.w);
    var radishBodyPosition9 = Offset(radishBodyPosition8.dx - 5.w, radishBodyPosition8.dy+3.w);
    radishBodyPath3.moveTo(radishBodyPosition7.dx, radishBodyPosition7.dy);
    radishBodyPath3.quadraticBezierTo(radishBodyPosition8.dx, radishBodyPosition8.dy,  radishBodyPosition9.dx,  radishBodyPosition9.dy);






    var whitePath = Path();
    var positionFromPathPercent = getPositionFromPathPercent(earPath, 0);
    whitePath.moveTo(positionFromPathPercent.dx, positionFromPathPercent.dy);
    copyPath(whitePath, earPath);
    copyPath(whitePath, rightPath);
    copyPath(whitePath, getPathFromPathPercent(rightHandsFeetPath, 0.9, 1), isReverse: true);
    copyPath(whitePath, radishBottomPath, isReverse: true);
    copyPath(whitePath, getPathFromPathPercent(leftHandsFeetPath, 0.9, 1));
    copyPath(whitePath, leftBodyPath, isReverse: true);
    // whitePath.close();

    // _paint.strokeWidth = 8.w;

    var whitePms = whitePath.computeMetrics();
    var whitePm = whitePms.first;

    _paint.style = PaintingStyle.fill;
    _paint.color = Colors.white;
    // canvas.drawPath(whitePm.extractPath(0, fillAnimation.value * whitePm.length), _paint);

    canvas.drawPath(tailPath, _paint);

    canvas.save();
    canvas.clipPath(whitePath);
    var bodyRect = whitePath.getBounds();
    canvas.drawRect(Rect.fromLTWH(bodyRect.left, bodyRect.top, bodyRect.width, bodyRect.height * fillAnimation.value), _paint);
    canvas.restore();




    _paint.color = Color(0xFFE79EC3);
    canvas.save();

    Path leftFacePath = Path();
    Rect leftFaceRect = Rect.fromLTWH(position1.dx - 25.w - 15.w, position1.dy + 80.w - 15.w, 30.w, 30.w);
    leftFacePath.addOval(leftFaceRect);
    canvas.clipPath(leftFacePath);
    canvas.drawRect(Rect.fromLTWH(leftFaceRect.left, leftFaceRect.top, leftFaceRect.width, leftFaceRect.height * fillLeftFaceAnimation.value), _paint);
    canvas.restore();


    canvas.save();

    Path rightFacePath = Path();
    Rect rightFaceRect = Rect.fromLTWH(rightFirstPosition.dx + 25.w - 15.w, rightFirstPosition.dy + 80.w - 15.w, 30.w, 30.w);
    rightFacePath.addOval(rightFaceRect);
    canvas.clipPath(rightFacePath);
    canvas.drawRect(Rect.fromLTWH(rightFaceRect.left, rightFaceRect.top, rightFaceRect.width, rightFaceRect.height * fillRightFaceAnimation.value), _paint);
    canvas.restore();


    // canvas.drawCircle(Offset(rightFirstPosition.dx + 25.w, rightFirstPosition.dy + 80.w), 15.w * fillRightFaceAnimation.value, _paint);


    canvas.save();
    // canvas.translate(-16.w,  (leftFirstPosition.dy - 20.w)/2 - 5.w);
    // canvas.rotate(-2*pi/22);


    var leftEarRect = Rect.fromLTWH(leftFirstPosition.dx - 3.w, 25.w, 30.w, (leftFirstPosition.dy - 30.w));
    canvas.translate(leftEarRect.center.dx,  leftEarRect.center.dy);
    Path leftEarPath = Path();
    leftEarPath.addOval(Rect.fromLTWH(- leftEarRect.width /2, -leftEarRect.height/2, leftEarRect.width, leftEarRect.height));

    var newPath  = leftEarPath.transform(Matrix4.rotationZ(-pi/15).storage);
    // canvas.clipRect(Rect.fromLTWH(leftEarRect.left, leftEarRect.top, leftEarRect.width, leftEarRect.height * fillLeftEarAnimation.value));
    canvas.clipPath(newPath);
    var leftEarDrawRect = newPath.getBounds();
    canvas.drawRect(Rect.fromLTWH(leftEarDrawRect.left, leftEarDrawRect.top, leftEarDrawRect.width, leftEarDrawRect.height * fillLeftEarAnimation.value), _paint);
    canvas.restore();

    canvas.save();
    var rightEarRect = Rect.fromLTWH(rightFirstPosition.dx - 23.w, 25.w, 30.w, (rightFirstPosition.dy - 30.w));
    canvas.translate(rightEarRect.center.dx,  rightEarRect.center.dy);

    Path rightEarPath = Path();
    rightEarPath.addOval(Rect.fromLTWH(- rightEarRect.width / 2, - rightEarRect.height / 2, rightEarRect.width, rightEarRect.height));
    rightEarPath  = rightEarPath.transform(Matrix4.rotationZ(pi/10).storage);

    var rightEarDrawRect = rightEarPath.getBounds();
    canvas.clipPath(rightEarPath);
    canvas.drawRect(Rect.fromLTWH(rightEarDrawRect.left, rightEarDrawRect.top, rightEarDrawRect.width, rightEarDrawRect.height * fillRightEarAnimation.value), _paint);

    // canvas.drawOval(Rect.fromLTWH(rightFirstPosition.dx, 30.w, 30.w, (rightFirstPosition.dy - 30.w) * fillRightEarAnimation.value), _paint);
    canvas.restore();

    _paint.style = PaintingStyle.fill;
    _paint.color = Colors.green;

    canvas.save();
    var radishHeadRect = radishHeadPath.getBounds();
    canvas.clipPath(radishHeadPath);
    canvas.drawRect(Rect.fromLTWH(radishHeadRect.left, radishHeadRect.top, radishHeadRect.width, radishHeadRect.height * fillRadishHeaderAnimation.value), _paint);
    canvas.restore();


    Path radishPath = Path();
    var radishFistPosition = getPositionFromPathPercent(radishTopPath, 0);
    radishPath.moveTo(radishFistPosition.dx, radishFistPosition.dy);
    copyPath(radishPath, radishTopPath);
    copyPath(radishPath, rightHandsFeetPath);
    copyPath(radishPath, radishBottomPath, isReverse: true);
    copyPath(radishPath, leftHandsFeetPath, isReverse: true);
    radishPath.close();
    _paint.style = PaintingStyle.fill;
    _paint.color = Colors.orange;

    canvas.save();
    var radishRect = radishPath.getBounds();
    canvas.clipPath(radishPath);
    canvas.drawRect(Rect.fromLTWH(radishRect.left, radishRect.top, radishRect.width, radishRect.height * fillRadishBodyAnimation.value), _paint);

    canvas.restore();


    _paint.color = Colors.black87;
    _paint.style = PaintingStyle.stroke;
    _paint.strokeWidth = 4.w;


    // Path sidePath = Path();
    
    var list = <Path>[];
    list.add(leftBodyPath);
    list.add(rightPath);
    list.add(earPath);
    list.add(leftHandsFeetPath);
    list.add(rightHandsFeetPath);
    list.add(radishHeadPath);
    list.add(mouthPath);
    list.add(leftEyesPath);
    list.add(rightEyesPath);
    list.add(tailPath);
    list.add(radishTopPath);
    list.add(radishBottomPath);
    list.add(radishBodyPath1);
    list.add(radishBodyPath2);
    list.add(radishBodyPath3);

    // mergePath(sidePath, leftBodyPath);
    // mergePath(sidePath,rightPath);
    // mergePath(sidePath,earPath);
    // mergePath(sidePath,leftHandsFeetPath);
    // mergePath(sidePath,rightHandsFeetPath);
    // mergePath(sidePath,radishHeadPath);
    // mergePath(sidePath,mouthPath);
    // mergePath(sidePath,earPath);
    // mergePath(sidePath,tailPath);
    // mergePath(sidePath,radishTopPath);
    // mergePath(sidePath,radishBottomPath);
    // mergePath(sidePath,radishBodyPath);
    
    
    // sidePath.addPath(leftBodyPath, Offset.zero);
    // sidePath.addPath(rightPath, Offset.zero);
    // sidePath.addPath(earPath, Offset.zero);
    // sidePath.addPath(leftHandsFeetPath, Offset.zero);
    // sidePath.addPath(rightHandsFeetPath, Offset.zero);
    // sidePath.addPath(radishHeadPath, Offset.zero);
    // sidePath.addPath(mouthPath, Offset.zero);
    // sidePath.addPath(earPath, Offset.zero);
    // sidePath.addPath(tailPath, Offset.zero);
    // sidePath.addPath(radishTopPath, Offset.zero);
    // sidePath.addPath(radishBottomPath, Offset.zero);
    // sidePath.addPath(radishBodyPath, Offset.zero);

    // var bodyPms = sidePath.computeMetrics();
    // print(bodyPms.length);

    int index = (bodyAnimation.value as double) ~/ 1 ;

    double progress = bodyAnimation.value % 1;
    print("index $index , progress : $progress");
    // var list = ;
    for(int i = 0 ; i < index; i++){
      var path = list[i];
      canvas.drawPath(path, _paint);
    }
    if(index >= list.length){
      return;
    }
    var path = list[index];
    var pms = path.computeMetrics();
    var pm = pms.first;
    canvas.drawPath(pm.extractPath(0, progress * pm.length), _paint);

    // canvas.drawPath(leftBodyPath, _paint);
    // canvas.drawPath(rightPath, _paint);
    // canvas.drawPath(earPath, _paint);
    // canvas.drawPath(leftHandsFeetPath, _paint);
    // canvas.drawPath(rightHandsFeetPath, _paint);
    // canvas.drawPath(radishHeadPath, _paint);
    // canvas.drawPath(mouthPath, _paint);
    // canvas.drawPath(eyesPath, _paint);
    canvas.drawPath(tailPath, _paint);
    // canvas.drawPath(radishTopPath, _paint);
    // canvas.drawPath(radishBottomPath, _paint);
    // canvas.drawPath(radishBodyPath, _paint);


  }

  Path createLeftBodyPath(){
    var position1 = Offset(110.w, 100.w);
    var position2 = Offset(30.w, position1.dy + 20.w);
    var position3 = Offset(40.w, position2.dy + 100.w);
    var position4 = Offset(110.w, position3.dy + 10.w);

    var position5 = Offset(50.w, position4.dy + 20.w);
    var position6 = Offset(60.w, position5.dy + 80.w);
    var position7 = Offset(125.w, position6.dy + 10.w);

    var path = getThreePath(position1, position2, position3, position4, position5, position6, position7);
    return path;
  }

  Path drawThree(Offset rightHandsFeetPosition1, Offset rightHandsFeetPosition2, Offset rightHandsFeetPosition3, Offset rightHandsFeetPosition4, Offset rightHandsFeetPosition5, Offset rightHandsFeetPosition6, Offset rightHandsFeetPosition7, Canvas canvas) {
     Path path = Path();
    path.moveTo(rightHandsFeetPosition1.dx, rightHandsFeetPosition1.dy);
    path.cubicTo(rightHandsFeetPosition2.dx, rightHandsFeetPosition2.dy, rightHandsFeetPosition3.dx, rightHandsFeetPosition3.dy, rightHandsFeetPosition4.dx,  rightHandsFeetPosition4.dy);

    path.cubicTo(rightHandsFeetPosition5.dx, rightHandsFeetPosition5.dy, rightHandsFeetPosition6.dx, rightHandsFeetPosition6.dy, rightHandsFeetPosition7.dx,  rightHandsFeetPosition7.dy);

    canvas.drawPath(path, _paint);
    return path;
  }
  Path getThreePath(Offset rightHandsFeetPosition1, Offset rightHandsFeetPosition2, Offset rightHandsFeetPosition3, Offset rightHandsFeetPosition4, Offset rightHandsFeetPosition5, Offset rightHandsFeetPosition6, Offset rightHandsFeetPosition7) {
     Path path = Path();
    path.moveTo(rightHandsFeetPosition1.dx, rightHandsFeetPosition1.dy);
    path.cubicTo(rightHandsFeetPosition2.dx, rightHandsFeetPosition2.dy, rightHandsFeetPosition3.dx, rightHandsFeetPosition3.dy, rightHandsFeetPosition4.dx,  rightHandsFeetPosition4.dy);

    path.cubicTo(rightHandsFeetPosition5.dx, rightHandsFeetPosition5.dy, rightHandsFeetPosition6.dx, rightHandsFeetPosition6.dy, rightHandsFeetPosition7.dx,  rightHandsFeetPosition7.dy);

    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }


  Offset getMinYPositionFromPath(Path path){
    var pms = path.computeMetrics();
    var pm = pms.first;
    var minPosition = pm.getTangentForOffset(0)?.position;
    for(int i = 0; i< pm.length; i++){
      var position = pm.getTangentForOffset(i.toDouble())?.position;
      if(minPosition == null || (position != null && position.dy < minPosition.dy)){
        minPosition = position;
      }
    }
    return minPosition ?? Offset.zero;
  }


  void copyPath(Path targetPath, Path copyPath, {bool isReverse = false}){
    var pms = copyPath.computeMetrics();
    var pm = pms.first;
    if(isReverse){
      for(double i = pm.length; i > 0; i--){
        var position = pm.getTangentForOffset(i.toDouble())?.position;
        if(position != null ){
          targetPath.lineTo(position.dx, position.dy);
        }
      }
    }else{
      for(int i = 0; i< pm.length; i++){
        var position = pm.getTangentForOffset(i.toDouble())?.position;
        if(position != null ){
          targetPath.lineTo(position.dx, position.dy);
        }
      }
    }

  }


  void mergePath(Path targetPath, Path copyPath){
    var pms = copyPath.computeMetrics();
    var pm = pms.first;
    var firstPosition = pm.getTangentForOffset(0)?.position ?? Offset.zero;
    targetPath.moveTo(firstPosition.dx, firstPosition.dy);
    for(int i = 0; i< pm.length; i++){
      var position = pm.getTangentForOffset(i.toDouble())?.position;
      if(position != null ){
        targetPath.lineTo(position.dx, position.dy);
      }
    }
  }

  Offset getPositionFromPathPercent(Path path, double percent){
    var pms = path.computeMetrics();
    var pm = pms.first;
    var position = pm.getTangentForOffset(pm.length * percent)?.position ?? Offset.zero;
    return position;
  }

  Path getPathFromPathPercent(Path path, double startPercent, double endPercent){
    var pms = path.computeMetrics();
    var pm = pms.first;
    var resultPath = pm.extractPath(pm.length * startPercent, pm.length * endPercent);
    return resultPath;
  }

  double getWidthFromPath(Path path){
    var rect = path.getBounds();
    return rect.width;
  }
  double getHeightFromPath(Path path){
    var rect = path.getBounds();
    return rect.height;
  }

}
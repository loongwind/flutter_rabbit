import 'package:flutter/material.dart';
import 'package:flutter_rabbit/rabbit_painter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RabbitPage extends StatefulWidget {
  const RabbitPage({Key? key}) : super(key: key);

  @override
  State<RabbitPage> createState() => _RabbitPageState();
}

class _RabbitPageState extends State<RabbitPage> with TickerProviderStateMixin {
  late AnimationController bodyController = AnimationController(vsync: this)
    ..duration = const Duration(seconds: 10)
    ..forward();
  late AnimationController fillController = AnimationController(vsync: this)
    ..duration = const Duration(seconds: 1);
  late AnimationController fillRadishHeaderController = AnimationController(vsync: this)
    ..duration = const Duration(seconds: 1);
  late AnimationController fillRadishBodyController = AnimationController(vsync: this)
    ..duration = const Duration(seconds: 1);
  late AnimationController fillLeftEarController = AnimationController(vsync: this)
    ..duration = const Duration(seconds: 1);
  late AnimationController fillRightEarController = AnimationController(vsync: this)
    ..duration = const Duration(seconds: 1);
  late AnimationController fillLeftFaceController = AnimationController(vsync: this)
    ..duration = const Duration(seconds: 1);
  late AnimationController fillRightFaceController = AnimationController(vsync: this)
    ..duration = const Duration(seconds: 1);

  late Animation bodyAnimation;
  late Animation fillAnimation;
  late Animation fillRadishHeaderAnimation;
  late Animation fillRadishBodyAnimation;
  late Animation fillLeftEarAnimation;
  late Animation fillRightEarAnimation;
  late Animation fillLeftFaceAnimation;
  late Animation fillRightFaceAnimation;

  @override
  void initState() {
    super.initState();
    bodyAnimation = Tween(begin: 0.0, end: 15.0).animate(CurvedAnimation(parent: bodyController, curve: Curves.linear));
    fillAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: fillController, curve: Curves.linear));
    fillRadishHeaderAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: fillRadishHeaderController, curve: Curves.linear));
    fillRadishBodyAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: fillRadishBodyController, curve: Curves.linear));
    fillLeftEarAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: fillLeftEarController, curve: Curves.linear));
    fillRightEarAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: fillRightEarController, curve: Curves.linear));
    fillLeftFaceAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: fillLeftFaceController, curve: Curves.linear));
    fillRightFaceAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: fillRightFaceController, curve: Curves.linear));

    bodyAnimation.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        fillController.forward();
      }
    });

    fillController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        fillRadishHeaderController.forward();
      }
    });

    fillRadishHeaderController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        fillRadishBodyController.forward();
      }
    });

    fillRadishBodyController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        fillLeftEarController.forward();
      }
    });

    fillLeftEarController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        fillRightEarController.forward();
      }
    });

    fillRightEarController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        fillLeftFaceController.forward();
      }
    });

    fillLeftFaceController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        fillRightFaceController.forward();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    initScreenUtil(context);
    return Container(
      color: Colors.white,
      child: Center(
        child: CustomPaint(
          painter: RabbitPainter(controller:
          Listenable.merge([bodyAnimation,
            fillController,
            fillRadishHeaderController,
            fillRadishBodyController,
            fillLeftEarController,
            fillRightEarController,
            fillLeftFaceController,
            fillRightFaceController
          ]),
              bodyAnimation: bodyAnimation,
              fillAnimation: fillAnimation,
            fillRadishHeaderAnimation: fillRadishHeaderAnimation,
            fillRadishBodyAnimation: fillRadishBodyAnimation,
            fillLeftEarAnimation: fillLeftEarAnimation,
            fillRightEarAnimation: fillRightEarAnimation,
            fillLeftFaceAnimation: fillLeftFaceAnimation,
            fillRightFaceAnimation: fillRightFaceAnimation
          ),
          size: Size(0.8.sw, 1.sw),
        ),
      ),
    );
  }

  void initScreenUtil(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: const Size(375, 812),
        context: context);
  }
}

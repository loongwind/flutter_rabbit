import 'package:flutter/material.dart';
import 'package:flutter_rabbit/rabbit_painter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RabbitPage extends StatefulWidget {
  const RabbitPage({Key? key}) : super(key: key);

  @override
  State<RabbitPage> createState() => _RabbitPageState();
}

class _RabbitPageState extends State<RabbitPage> with TickerProviderStateMixin {

  final animationDurationMap = {
    "border": const Duration(seconds: 10),
    "fillBody": const Duration(seconds: 1),
    "fillRadishLeaf": const Duration(milliseconds: 300),
    "fillRadishBody": const Duration(milliseconds: 600),
    "fillLeftEar": const Duration(milliseconds: 600),
    "fillRightEar": const Duration(milliseconds: 600),
    "fillLeftFace": const Duration(milliseconds: 300),
    "fillRightFace": const Duration(milliseconds: 300),
  };

  final animationControllerMap = <String, AnimationController>{};


  void initAnimation(){
    for (var key in animationDurationMap.keys) {
      if(key == "border"){
        animationControllerMap[key] = AnimationController(vsync: this, upperBound: 15.0)
          ..duration = animationDurationMap[key];
      }else{
        animationControllerMap[key] = AnimationController(vsync: this)
          ..duration = animationDurationMap[key];
      }
    }

    var animations = animationControllerMap.values.toList();
    for(int i=0; i<animations.length - 1; i++){
      var current = animations[i];
      var next = animations[ i + 1 ];
      exec(current, next);
    }
  }

  @override
  void initState() {
    super.initState();
    initAnimation();
    animationControllerMap.values.first.forward();
  }


  @override
  Widget build(BuildContext context) {
    initScreenUtil(context);
    return Container(
      color: Colors.white,
      child: Center(
        child: CustomPaint(
          painter: RabbitPainter(controller:
          Listenable.merge(animationControllerMap.values.toList()),
            animationMap: animationControllerMap
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

  void exec(AnimationController current, AnimationController next){
    current.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        next.forward();
      }
    });
  }
}

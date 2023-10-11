import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/demo_04_animation/my_third_page.dart';

class MySecondPage extends StatefulWidget {
  const MySecondPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MySecondPageState();
  }
}

class _MySecondPageState extends State<MySecondPage>
    with SingleTickerProviderStateMixin {
  /// 大小动画
  late Animation<double> animation;

  /// 透明度动画
  late Animation<double> opacityAnimation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.bounceInOut,
    );

    animation = Tween<double>(
      begin: 0,
      end: 100,
    ).animate(animation);

    opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(controller);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Second Page'),
      ),
      child: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return FadeTransition(
                      opacity: animation,
                      child: const MyThirdPage(),
                    );
                  },
                ),
              );
            },
            onDoubleTap: () {
              Navigator.of(context).pop();
            },
            child: AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Hero(
                  tag: 'avatar',
                  child: ClipOval(
                    child: SizedBox(
                      width: animation.value,
                      height: animation.value,
                      child: Opacity(
                        opacity: opacityAnimation.value,
                        child: child,
                      ),
                    ),
                  ),
                );
              },
              child: Image.asset(
                'images/lake.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

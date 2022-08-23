import 'package:flutter/material.dart';
import 'package:talk/bbva_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scale, translatex, translatey;
  bool isAnimated = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    scale = Tween(begin: 1.0, end: 0.8).animate(
      CurvedAnimation(parent: controller, curve: Curves.linear),
    );
    translatex = Tween(begin: 0.0, end: 0.7).animate(
      CurvedAnimation(parent: controller, curve: Curves.linear),
    );
    translatey = Tween(begin: 0.0, end: 0.025).animate(
      CurvedAnimation(parent: controller, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, __) {
        return Transform.scale(
          scale: scale.value,
          child: Transform.translate(
            offset: Offset(
              translatex.value * sizeScreen.width,
              translatey.value * sizeScreen.height,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: const Color(0xFF00264c),
              child: Stack(
                children: [
                  BBVAPage(
                    menu: () {
                      controller.forward();
                      isAnimated = true;
                    },
                  ),
                  Positioned(
                    bottom: 30,
                    right: 30,
                    child: GestureDetector(
                      onTap: () {
                        controller.forward();
                        isAnimated = true;
                      },
                      child: Container(
                        child: Icon(
                          Icons.dehaze_rounded,
                          size: 42,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  isAnimated
                      ? TextButton(
                          onPressed: () {
                            controller.reverse();
                            isAnimated = false;
                          },
                          child: Container(
                            height: sizeScreen.height,
                            width: sizeScreen.width,
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

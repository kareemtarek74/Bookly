import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/widgets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController animationController1, animationController2;
  late Animation<Offset> downAnimation, topAnimation;

  @override
  void initState() {
    super.initState();

    animationController1 =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    downAnimation = Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero)
        .animate(animationController1);

    animationController2 =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    topAnimation = Tween<Offset>(begin: const Offset(0, -10), end: Offset.zero)
        .animate(animationController2);

    animationController1.forward();

    animationController2.forward();
  }

  @override
  void dispose() {
    super.dispose();

    animationController1.dispose();
    animationController2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AnimatedBuilder(
            animation: topAnimation,
            builder: (context, _) {
              return SlideTransition(
                  position: topAnimation, child: Image.asset(AssetsData.logo));
            }),
        const SizedBox(
          height: 4,
        ),
        AnimatedBuilder(
            animation: downAnimation,
            builder: (context, _) {
              return SlideTransition(
                position: downAnimation,
                child: const Text(
                  'Read now for free',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              );
            })
      ],
    );
  }
}

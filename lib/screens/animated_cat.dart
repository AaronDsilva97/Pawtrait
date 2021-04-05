import 'package:flutter/material.dart';
import '../widgets/catImage.dart';

class AnimatedCat extends StatefulWidget {
  @override
  _AnimatedCatState createState() => _AnimatedCatState();
}

class _AnimatedCatState extends State<AnimatedCat>
    with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catController;

  @override
  void initState() {
    super.initState();

    catController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    catAnimation = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: catController,
        curve: Curves.easeIn,
      ),
    );
  }

  _onTap() {
    if (catController.status == AnimationStatus.completed) {
      catController.reverse();
    } else if (catController.status == AnimationStatus.dismissed) {
      catController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Center(
        child: Stack(
          children: <Widget>[
            buildBox(),
            buildCatAnimation(),
          ],
        ),
      ),
    );
  }

  Widget buildCatAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      child: CatImage(),
      builder: (context, child) {
        return Positioned(
          child: child,
          bottom: catAnimation.value,
          right: 0.0,
          left: 0.0,
        );
      },
    );
  }

  Widget buildBox() {
    return Container(
      height: 200,
      width: 200,
      color: Colors.brown,
    );
  }
}

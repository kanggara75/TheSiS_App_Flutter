import 'package:flutter/material.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({
    Key key,
    this.press,
    this.icon,
    this.color,
    this.left,
    this.right,
    this.duration,
  }) : super(key: key);
  final Function press;
  final Color color;
  final Icon icon;
  final double left, right;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: 40, //getProportionateScreenHeight(40),
      width: 100, //getProportionateScreenWidth(100),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: color,
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: duration),
            curve: Curves.easeIn,
            top: 3.0,
            left: left,
            right: right,
            child: InkWell(
              onTap: press,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: duration),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
                child: icon,
              ),
            ),
          )
        ],
      ),
    );
  }
}

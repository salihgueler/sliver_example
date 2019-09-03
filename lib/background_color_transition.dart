import 'package:flutter/cupertino.dart';

class BackgroundColorTransition extends AnimatedWidget {
  BackgroundColorTransition(
      {Key key, @required Animation<Color> color, this.child})
      : assert(color != null),
        super(key: key, listenable: color);

  final Widget child;

  Animation<Color> get color => listenable;

  @override
  Widget build(BuildContext context) {
    return Container(
      color:  color.value,
      child: child,
    );
  }
}
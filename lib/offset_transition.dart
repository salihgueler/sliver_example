import 'package:flutter/cupertino.dart';

/// Tween class to handle Offset animations.
class OffsetTransition extends Tween<Offset> {
  
  OffsetTransition({@required Offset begin, @required Offset end})
      : super(begin: begin, end: end);

  @override
  Offset lerp(double t) => Offset.lerp(begin, end, t);
}

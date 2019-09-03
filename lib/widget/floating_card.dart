import 'package:flutter/cupertino.dart';

class FloatingCard extends StatelessWidget {
  const FloatingCard({@required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: PhysicalModel(
        elevation: 5,
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAlias,
        color: CupertinoColors.white,
        child: child,
      ),
    );
  }
}
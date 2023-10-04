import 'package:flutter/material.dart';

class TodoListCard extends StatelessWidget {
  final double cardRadius;
  final Clip clipBehavior;
  final Widget child;

  final double? width;
  final double? height;

  const TodoListCard({
    super.key,
    this.cardRadius = 30,
    this.clipBehavior = Clip.antiAlias,
    this.width,
    this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      clipBehavior: clipBehavior,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardRadius),
      ),
      child: SizedBox(
        height: height ?? size.height / 2,
        width: width ?? size.width,
        child: child,
      ),
    );
  }
}

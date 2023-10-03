import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.height = 180});
  final double height;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      height: widget.height,
      alignment: Alignment.bottomCenter,
      color: color.primary,
      child: Text(
        'Welcome User',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color.background,
          fontSize: 18,
        ),
      ),
    );
  }
}

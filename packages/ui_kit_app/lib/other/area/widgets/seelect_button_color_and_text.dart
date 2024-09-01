import 'package:flutter/material.dart';

class AreSelectionButton {
  static Widget active({
    required String title,
    required VoidCallback onTap,
    Color? backgroundColor,
  }) =>
      _AreSelectionButton(
        title: title,
        backgroundColor: backgroundColor ?? Colors.white,
        onTap: onTap,
      );

  static Widget inactive({
    required String title,
    required VoidCallback onTap,
    Color? backgroundColor,
  }) =>
      _AreSelectionButton(
        title: title,
        backgroundColor: backgroundColor ?? Colors.grey,
        onTap: onTap,
      );

  static Widget exception({
    required String title,
    required VoidCallback onTap,
    Color? backgroundColor,
  }) =>
      _AreSelectionButton(
        title: title,
        backgroundColor: backgroundColor ?? Colors.red,
        onTap: onTap,
      );
}

class _AreSelectionButton extends StatelessWidget
    implements AreSelectionButton {
  final String title;
  final Color backgroundColor;
  final VoidCallback onTap;

  const _AreSelectionButton({
    required this.title,
    required this.backgroundColor,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}

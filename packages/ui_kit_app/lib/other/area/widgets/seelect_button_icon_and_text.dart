import 'package:flutter/material.dart';
import 'package:ui_kit/common/colors_app.dart';

class AreaSelectionButtonWithIcon {
  static active({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
    Color? backgroundColor,
    Color? backgroundIconColor,
    Color? borderColor,
  }) =>
      _AreaSelectionButtonWithIcon(
        title: title,
        icon: icon,
        onTap: onTap,
        backgroundColor: backgroundColor ?? ColorsApp.colorsApp.whiteSimple,
        backgroundIconColor:
            backgroundIconColor ?? ColorsApp.colorsApp.whiteSimple,
        borderColor: borderColor ?? ColorsApp.colorsApp.greySimple,
      );

  static inactive({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
    Color? backgroundColor,
    Color? backgroundIconColor,
    Color? borderColor,
  }) =>
      _AreaSelectionButtonWithIconInactive(
        title: title,
        icon: icon,
        onTap: onTap,
        backgroundColor: backgroundColor ?? ColorsApp.colorsApp.greySimple,
        backgroundIconColor:
            backgroundIconColor ?? ColorsApp.colorsApp.greySimple,
        borderColor: borderColor ?? ColorsApp.colorsApp.black12,
      );

  static exception({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
    Color? backgroundColor,
    Color? backgroundIconColor,
    Color? borderColor,
  }) =>
      _AreaSelectionButtonWithIconException(
        title: title,
        icon: icon,
        onTap: onTap,
        backgroundColor: backgroundColor ?? ColorsApp.colorsApp.red,
        backgroundIconColor:
            backgroundIconColor ?? ColorsApp.colorsApp.whiteSimple,
        borderColor: borderColor ?? ColorsApp.colorsApp.redAccent,
      );
}

class _AreaSelectionButtonWithIcon extends StatelessWidget
    implements AreaSelectionButtonWithIcon {
  final String title;
  final IconData icon;
  final Color backgroundColor;
  final Color backgroundIconColor;
  final Color borderColor;
  final VoidCallback onTap;

  const _AreaSelectionButtonWithIcon({
    required this.title,
    required this.icon,
    required this.backgroundColor,
    required this.backgroundIconColor,
    required this.borderColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: backgroundIconColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Icon(
                        icon,
                        size: 30.0,
                        color: ColorsApp.colorsApp.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AreaSelectionButtonWithIconInactive extends StatelessWidget
    implements AreaSelectionButtonWithIcon {
  final String title;
  final IconData icon;
  final Color backgroundColor;
  final Color backgroundIconColor;
  final Color borderColor;
  final VoidCallback onTap;

  const _AreaSelectionButtonWithIconInactive({
    required this.title,
    required this.icon,
    required this.backgroundColor,
    required this.backgroundIconColor,
    required this.borderColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: backgroundIconColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(icon, size: 30.0),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  color: ColorsApp.colorsApp.black45,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AreaSelectionButtonWithIconException extends StatelessWidget
    implements AreaSelectionButtonWithIcon {
  final String title;
  final IconData icon;
  final Color backgroundColor;
  final Color backgroundIconColor;
  final Color borderColor;
  final VoidCallback onTap;

  const _AreaSelectionButtonWithIconException({
    required this.title,
    required this.icon,
    required this.backgroundColor,
    required this.backgroundIconColor,
    required this.borderColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Icon(
                Icons.error_outline,
                color: ColorsApp.colorsApp.redShade200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

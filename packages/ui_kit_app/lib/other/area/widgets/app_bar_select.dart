import 'package:flutter/material.dart';
import 'package:ui_kit/common/colors_app.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: SafeArea(
        child: AppBar(
          centerTitle: false,
          title: Text(
            'Выбор',
            style: TextStyle(color: ColorsApp.colorsApp.black),
          ),
          backgroundColor: ColorsApp.colorsApp.whiteSimple,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 18,
              color: ColorsApp.colorsApp.blue,
            ),
            onPressed: () {
              // TODO Navigator.of(context).pop();
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                color: ColorsApp.colorsApp.blue,
              ),
              onPressed: () {
                // TODO
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

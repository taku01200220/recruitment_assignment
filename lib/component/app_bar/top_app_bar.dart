import 'package:flutter/material.dart';
import 'package:recruitment_assignment/importer.dart';

class TopAppBar extends StatelessWidget with PreferredSizeWidget{
  const TopAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Logo(),
          SizedBox(width: 8),
          LogoText(),
        ],
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }
}

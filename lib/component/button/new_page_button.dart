import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewPageButton extends StatelessWidget {
  final Function function;

  const NewPageButton({
    Key? key,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'asset/icon/add.svg',
            width: 24,
            height: 24,
          ),
          const Text(
            'New page',
            style: TextStyle(color: Colors.blue),
          )
        ],
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        side: const BorderSide(
          color: Colors.blue,
          width: 2,
        ),
      ),
      onPressed: () {
        function();
      },
    );
  }
}

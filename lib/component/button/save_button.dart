import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SaveButton extends StatelessWidget {

  final Function function;

  const SaveButton({
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
            'asset/icon/save.svg',
            width: 24,
            height: 24,
          ),
          Text('Save')
        ],
      ),
      onPressed: () {
        function();
      },
    );
  }
}

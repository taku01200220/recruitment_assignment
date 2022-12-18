import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoneButton extends StatelessWidget {

  final Function function;

  const DoneButton({
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
            'asset/icon/done.svg',
            width: 24,
            height: 24,
          ),
          Text('Done')
        ],
      ),
      onPressed: () {
        function();
      },
    );
  }
}

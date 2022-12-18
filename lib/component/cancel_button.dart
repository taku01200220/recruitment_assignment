import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CancelButton extends StatelessWidget {

  final Function function;

  const CancelButton({
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
            'asset/icon/cancel.svg',
            width: 24,
            height: 24,
          ),
          Text('Cancel')
        ],
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.grey, //ボタンの背景色
      ),
      onPressed: () {
        function();
      },
    );
  }
}

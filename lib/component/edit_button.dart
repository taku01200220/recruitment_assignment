import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditButton extends StatelessWidget {

  final Function function;

  const EditButton({
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
            'asset/icon/edit.svg',
            width: 24,
            height: 24,
          ),
          Text('Edit')
        ],
      ),
      onPressed: () {
        function();
      },
    );
  }
}

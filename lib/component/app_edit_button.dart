import 'package:flutter/material.dart';
import 'package:recruitment_assignment/importer.dart';

class AppEditButton extends StatelessWidget {
  final bool value;
  final Function edit;
  final Function cancel;
  final Function save;

  const AppEditButton({
    Key? key,
    required this.value,
    required this.edit,
    required this.cancel,
    required this.save,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: value == false
          ? EditButton(function: () {edit();})
          : Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CancelButton(function: () {cancel();}),
                const SizedBox(width: 16),
                SaveButton(function: () {save();}),
              ],
            ),
    );
  }
}

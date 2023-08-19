import 'package:flutter/material.dart';

class RoundedBackButton extends StatelessWidget {
  const RoundedBackButton({super.key});
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(Icons.arrow_back),
      color: Colors.white,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      padding: const EdgeInsets.all(12),
      iconSize: 34,
      visualDensity: VisualDensity.compact,
      alignment: Alignment.center,
      splashRadius: 24,
      tooltip: 'Back',
    );
  }
}

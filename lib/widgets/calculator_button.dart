import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final double size;
  final Color color;
  final Color? textColor;
  final Gradient? gradient;

  const CalculatorButton(
      {required this.label,
      required this.size,
      required this.color,
      required this.onTap,
        this.textColor,
        this.gradient,
      super.key});

  @override
  Widget build(BuildContext context) {
    const double br = 9;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(br),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          gradient: gradient,
            borderRadius: BorderRadius.circular(br), color: color),
        child: Center(
          child: Text(
            label,
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: textColor ?? Theme.of(context).colorScheme.onBackground),
          ),
        ),
      ),
    );
  }
}

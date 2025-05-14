import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {super.key,
        required this.onTap,
        required this.child,
        this.width = double.infinity,
        this.height = 45,
        this.backgroundColor,
        this.radius = 12.0
      });

  final VoidCallback onTap;
  final Widget child;
  final double width,height,radius;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          minimumSize: WidgetStatePropertyAll(Size(width,height)),
          backgroundColor: WidgetStatePropertyAll(backgroundColor ?? Theme.of(context).colorScheme.primary),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)
            )
          )
        ),
        child: child
    );
  }
}

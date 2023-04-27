import 'package:flutter/material.dart';

class TakePictureButton extends StatelessWidget {
  final Function? onTap;
  const TakePictureButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey.shade200,
        shape: const CircleBorder(),
        visualDensity: VisualDensity.standard,
        fixedSize: const Size(50, 50),
        minimumSize: Size.zero, // Set this
        padding: EdgeInsets.zero,
      ),
      onPressed: onTap == null
          ? null
          : () {
              onTap!();
            },
      child: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

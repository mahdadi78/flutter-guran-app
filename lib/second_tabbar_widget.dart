import 'package:flutter/material.dart';

class SecondTabBarViewWidget extends StatelessWidget {
  const SecondTabBarViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'لیست جزءها',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

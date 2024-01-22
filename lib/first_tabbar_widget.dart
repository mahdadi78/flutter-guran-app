import 'package:flutter/material.dart';

class FirstTabBarViewWidget extends StatelessWidget {
  const FirstTabBarViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'لیست سوره ها',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ghoran_app/consts/const.dart';
import 'package:ghoran_app/main.dart';

class SecondTabBarViewWidget extends StatelessWidget {
  const SecondTabBarViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 30,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            leading: _leading(index),
            title: _title(index),
            trailing: _trailing(index),
          ),
        );
      },
    );
  }

  Text _trailing(int index) {
    return Text(
      '--',
      style: TextStyle(
        fontSize: 12,
        color: color1.withOpacity(.5),
      ),
    );
  }

  Column _title(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'jozh',
          style: TextStyle(
              fontSize: 15, color: color1, fontWeight: FontWeight.w700),
        ),
        Text(
          controller.futureSurahs[index].revelationType.toString(),
          style: TextStyle(
              fontSize: 12,
              color: color1.withOpacity(.7),
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Stack _leading(int index) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          '${index + 1}',
          style: const TextStyle(
              fontSize: 16, color: color1, fontWeight: FontWeight.w700),
        ),
        const Icon(
          Icons.circle_outlined,
          size: 43,
          color: color1,
        )
      ],
    );
  }
}

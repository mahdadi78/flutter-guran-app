import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghoran_app/main.dart';

class FirstTabBarViewWidget extends StatelessWidget {
  const FirstTabBarViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading.value
        ? const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('loading...'),
                CircularProgressIndicator(
                  color: color1,
                  strokeWidth: 1,
                )
              ],
            ),
          )
        : ListView.builder(
            itemCount: controller.futureSurahs.length,
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
          ));
  }

  Text _trailing(int index) {
    return Text(
      '${controller.futureSurahs[index].numberOfAyahs} Ayah',
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
        Text(
          controller.futureSurahs[index].englishName.toString(),
          style: const TextStyle(
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
          controller.futureSurahs[index].number.toString(),
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghoran_app/consts/const.dart';
import 'package:ghoran_app/controllers/font_controller.dart';

final controllerFont = Get.put(FontController());

// ignore: must_be_immutable
class FontManager extends StatelessWidget {
  FontManager({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
            barrierColor: Colors.transparent,
            context: context,
            builder: (context) => errorDialog);
      },
      icon: const Icon(
        Icons.format_size_rounded,
        color: color1,
      ),
    );
  }

  Dialog errorDialog = Dialog(
    alignment: Alignment.topRight,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)), //this right here
    child: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
              onPressed: controllerFont.increaseFontSize,
              icon: const Icon(
                Icons.add,
                color: color1,
              )),
          IconButton(
              onPressed: controllerFont.decreaseFontSize,
              icon: const Icon(
                Icons.remove,
                color: color1,
              )),
        ],
      ),
    ),
  );
}

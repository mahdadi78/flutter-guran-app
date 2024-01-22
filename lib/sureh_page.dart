import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghoran_app/const.dart';
import 'package:ghoran_app/main.dart';

class SurehPage extends StatelessWidget {
  final int index;
  const SurehPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Image(
            fit: BoxFit.cover,
            image: AssetImage(
              'images/bg.jpg',
            ),
          ),
        ),
        Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    automaticallyImplyLeading: false,
                    leading: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_sharp,
                          color: Colors.black54,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                  body: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: <Widget>[
                      SliverAppBar(
                        backgroundColor: Colors.transparent,
                        onStretchTrigger: () async {
                          // Triggers when stretching
                        },
                        stretchTriggerOffset: 300.0,
                        expandedHeight: 150.0,
                        flexibleSpace: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('images/intro.jpg')),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(10),
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: color1.withOpacity(.7),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ],
                        ),
                        bottom: PreferredSize(
                            preferredSize: const Size(double.maxFinite, 10),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: Text(
                                controller
                                    .futureSurahs[index].englishNameTranslation
                                    .toString(),
                                style: const TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            )),
                        title: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.futureSurahs[index].englishName
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    controller
                                        .futureSurahs[index].revelationType
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return Container(
                              color:
                                  index.isOdd ? Colors.white : Colors.black12,
                              height: 100.0,
                              child: Center(
                                child: Text(
                                  '$index',
                                ),
                              ),
                            );
                          },
                          childCount: 20,
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}

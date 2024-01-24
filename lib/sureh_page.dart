import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghoran_app/const.dart';
import 'package:ghoran_app/main.dart';
import 'package:ghoran_app/models/ayas_model.dart';
import 'package:ghoran_app/controllers/getAyeh_controller.dart';

class SurehPage extends StatefulWidget {
  final int index;
  const SurehPage({super.key, required this.index});

  @override
  State<SurehPage> createState() => _SurehPageState();
}

class _SurehPageState extends State<SurehPage> {
  late List<Ayahs> futurePhotos;

  @override
  void initState() {
    super.initState();
    TestController().getHAMD().then((value) => futurePhotos = value);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
      Scaffold(
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
          body: FutureBuilder(
            future: TestController().getHAMD(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                    child: Text(
                  futurePhotos[20].text!,
                ));
              } else if (snapshot.hasError) {}
              return const Center(
                  child: Text(
                "loading...",
              ));
            },
          )),
    ]);
  }

  CustomScrollView _customScrollView() {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        _sliverAppBar(),
      ],
    );
  }

  SliverList _sliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int i) {
          //!---------------------------------------------------------------------------------------
          return const Text('');
        },
        childCount: controller.futureSurahs[widget.index].numberOfAyahs,
      ),
    );
  }

  SliverAppBar _sliverAppBar() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
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
                  fit: BoxFit.cover, image: AssetImage('images/intro.jpg')),
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
              controller.futureSurahs[widget.index].englishNameTranslation
                  .toString(),
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            ),
          )),
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  controller.futureSurahs[widget.index].englishName.toString(),
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  controller.futureSurahs[widget.index].revelationType
                      .toString(),
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

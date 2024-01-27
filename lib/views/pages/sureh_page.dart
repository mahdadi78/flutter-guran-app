import 'package:flutter/material.dart';
import 'package:ghoran_app/consts/const.dart';
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
    AyahController()
        .getSurah(widget.index)
        .then((value) => futurePhotos = value);
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
            future: AyahController().getSurah(widget.index),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _customScrollView();
              } else if (snapshot.hasError) {
                Center(
                    child: Text(
                  snapshot.error.toString(),
                ));
              }
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
      slivers: <Widget>[_sliverAppBar(), _sliverList()],
    );
  }

  SliverList _sliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int i) {
          //!---------------------------------------------------------------------------------------
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Text(
                                futurePhotos[i].number.toString(),
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: color1,
                                    fontWeight: FontWeight.w700),
                              ),
                              const Icon(
                                Icons.circle_outlined,
                                size: 43,
                                color: color1,
                              )
                            ],
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                futurePhotos[i].text!,
                                style: const TextStyle(
                                    color: color1,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                futurePhotos[i].text!,
                                style: const TextStyle(
                                    color: color1,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_horiz,
                        color: Colors.black45,
                      ))
                ],
              ),
            ),
          );
        },
        childCount: futurePhotos.length,
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
              controller.futureSurahs[widget.index - 1].englishNameTranslation
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
                  controller.futureSurahs[widget.index - 1].englishName
                      .toString(),
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  controller.futureSurahs[widget.index - 1].revelationType
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

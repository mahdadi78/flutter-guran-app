import 'package:flutter/material.dart';
import 'package:ghoran_app/consts/const.dart';
import 'package:ghoran_app/views/first_tabbar_widget.dart';
import 'package:ghoran_app/views/second_tabbar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: Column(
        children: [
          bannerWidget(context),
          tabBarView(),
        ],
      ),
    );
  }

  Widget tabBarView() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // give the tab bar a height [can change hheight to preferred height]
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: color1,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    text: 'سوره ها',
                  ),

                  // second tab [you can add an icon using the icon property]
                  Tab(
                    text: 'جزءها',
                  ),
                ],
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  FirstTabBarViewWidget(),
                  SecondTabBarViewWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bannerWidget(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: MediaQuery.of(context).size.width,
          height: 120,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage('images/intro.jpg'))),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: MediaQuery.of(context).size.width,
          height: 120,
          decoration: BoxDecoration(
              color: color1.withOpacity(.8),
              borderRadius: BorderRadius.circular(20)),
          child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white70,
                      size: 10,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'last read',
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Al_Fateha',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'ayeh 3',
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ]),
        ),
      ],
    );
  }

  AppBar appbar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: const Text(
        'Guran Majid',
        style: TextStyle(color: color1, fontWeight: FontWeight.w800),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: Icon(
            Icons.add_alert_outlined,
            color: color1,
          ),
        ),
      ],
      leading: const Icon(
        Icons.menu,
        color: color1,
      ),
    );
  }
}

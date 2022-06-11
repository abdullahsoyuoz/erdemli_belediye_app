import 'package:animations/animations.dart';
import 'package:erdemli_bel_app/Controller/main_page_view_provider.dart';
import 'package:erdemli_bel_app/View/Page/Category/categories_page.dart';
import 'package:erdemli_bel_app/View/Page/Contact/contact_us_page.dart';
import 'package:erdemli_bel_app/View/Page/home_page.dart';
import 'package:erdemli_bel_app/View/Page/videos_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({Key key}) : super(key: key);

  @override
  _MainPageViewState createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView>
    with SingleTickerProviderStateMixin {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Widget> mainPageList = const [
    HomePage(),
    VideosPage(),
    CategoriesPage(),
    ContactUsPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainPageIndexer>(builder: (context, provider, _) {
      return Scaffold(
        key: _scaffoldKey,
        bottomNavigationBar: buildBottomNavBar(),
        body: SizedBox.expand(
          child: PageTransitionSwitcher(
            duration: const Duration(milliseconds: 300),
            child: mainPageList[provider.getIndex()],
            transitionBuilder: (child, animation, secondaryAnimation) {
              return SharedAxisTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.scaled,
                child: child,
              );
            },
          ),
        ),
      );
    });
  }

  Widget buildBottomNavBar() {
    return Consumer<MainPageIndexer>(builder: (context, provider, _) {
      return DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(.3), offset: const Offset(0, 0), blurRadius: 3)
          ]
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: provider.getIndex(),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey.shade400,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            provider.setIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.house), label: "Anasayfa"),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.video), label: "Videolar"),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.grip), label: "Kategoriler"),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.headset), label: "Bize Ulaşın"),
          ],
        ),
      );
    });
  }
}

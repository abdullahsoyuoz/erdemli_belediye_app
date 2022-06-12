import 'package:animations/animations.dart';
import 'package:erdemli_bel_app/Controller/extensions.dart';
import 'package:erdemli_bel_app/Model/Dummy/news.dart';
import 'package:erdemli_bel_app/View/Style/colors.dart';
import 'package:erdemli_bel_app/View/Widget/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key key}) : super(key: key);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Widget> profileTabList(BuildContext context) => const [
        Center(
          child: Text(
            "YEREL",
            style: TextStyle(color: Colors.black),
          ),
        ),
        Center(
          child: Text(
            "GLOBAL",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'BİLDİRİMLER',
          style:
              GoogleFonts.montserrat(fontWeight: FontWeight.w800, fontSize: 21),
        ),
        centerTitle: false,
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10, bottom: 10),
                child: SizedBox(
                  height: 50,
                  child: TabBar(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      labelStyle: GoogleFonts.montserrat(
                          fontSize: 17, fontWeight: FontWeight.w500),
                      controller: _tabController,
                      onTap: (_) {
                        setState(() {});
                      },
                      tabs: profileTabList(context),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          color: Color.lerp(
                              AppColors.green,
                              AppColors.accentColor,
                              _tabController.index.toDouble()),
                          shadows: [
                            BoxShadow(
                                color: Colors.grey.shade500,
                                blurRadius: 3,
                                spreadRadius: 0)
                          ])),
                ),
              ),
              PageTransitionSwitcher(
                  transitionBuilder: (child, animation, secondaryAnimation) {
                    return SharedAxisTransition(
                      animation: animation,
                      secondaryAnimation: secondaryAnimation,
                      transitionType: SharedAxisTransitionType.scaled,
                      child: child,
                    );
                  },
                  // child: profileTabViewList[_tabController.index],
                  child: _tabController.index == 0
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.only(top: 0, bottom: 100),
                          itemCount: 10,
                          itemBuilder: (c, i) {
                            return NotificationItemWidget(data: newsList[i]);
                          },
                        )
                      : SizedBox(
                          height: context.height * 0.5,
                          child: ColoredBox(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const FaIcon(
                                  FontAwesomeIcons.faceGrin,
                                  color: Colors.black,
                                  size: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Text(
                                    'Henüz bildiriminiz yok',
                                    style: GoogleFonts.montserrat(fontSize: 17),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
            ],
          ),
        ),
      ),
    );
  }
}

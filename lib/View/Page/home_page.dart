import 'package:carousel_slider/carousel_slider.dart';
import 'package:erdemli_bel_app/Controller/asset_constants.dart';
import 'package:erdemli_bel_app/Controller/extensions.dart';
import 'package:erdemli_bel_app/Controller/main_page_view_provider.dart';
import 'package:erdemli_bel_app/Model/Dummy/categories.dart';
import 'package:erdemli_bel_app/Model/Dummy/news.dart';
import 'package:erdemli_bel_app/View/Page/notify_page.dart';
import 'package:erdemli_bel_app/View/Style/colors.dart';
import 'package:erdemli_bel_app/View/Widget/news_widget.dart';
import 'package:erdemli_bel_app/View/Widget/slider_news_item.dart';
import 'package:erdemli_bel_app/View/Widget/sliver_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../Model/Dummy/slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: categoryList.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: SizedBox.expand(
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()),
            slivers: [
              buildAppBar(context),
              buildSlider(context),
              buildCategoryTab(context),
              buildBody()
            ],
          ),
        ));
  }

  SliverList buildBody() {
    return SliverList(
        delegate: SliverChildListDelegate.fixed(List.generate(
            newsList.length, (index) => NewsWidget(data: newsList[index]))));
  }

  MultiSliver buildCategoryTab(BuildContext context) {
    return MultiSliver(
      pushPinnedChildren: false,
      children: [
        SliverPersistentHeader(
          key: LabeledGlobalKey("_debugLabel"),
          pinned: true,
          // floating: false,
          delegate: CustomSliverPersistentHeader(
            context,
            backgroundColor: Colors.white,
            child: Material(
              elevation: 2,
              child: TabBar(
                controller: tabController,
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                indicatorColor: AppColors.accentColor,
                indicatorWeight: 3,
                tabs: categoryList
                    .map((e) => Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7.0),
                          child: Text(
                            e.title,
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                        )))
                    .toList(),
              ),
            ),
            maxExtentValue: 50,
            minExtentValue: 50,
          ),
        ),
      ],
    );
  }

  SliverToBoxAdapter buildSlider(BuildContext context) {
    return SliverToBoxAdapter(
        child: SizedBox(
      width: context.width,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: CarouselSlider(
          items: sliderList
              .map((e) => SliderNewsItem(
                    data: e,
                  ))
              .toList(),
          options: CarouselOptions(
            viewportFraction: 0.9,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            height: 200,
            autoPlay: true,
          ),
        ),
      ),
    ));
  }

  SliverAppBar buildAppBar(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      toolbarHeight: 70,
      elevation: 2,
      pinned: true,
      iconTheme: IconTheme.of(context).copyWith(size: 30),
      title: FittedBox(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                zoomDrawerController.toggle.call();
              },
              icon: const FaIcon(
                FontAwesomeIcons.bars,
                size: 20,
              ),
              iconSize: 20,
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
            ),
            Image.asset(
              AppAssetContants.logo,
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'ERDEMLİ',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w800, fontSize: 21)),
                  TextSpan(
                      text: ' BELEDİYESİ',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w300, fontSize: 21)),
                ], style: GoogleFonts.montserrat(color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const NotificationsPage(),
                  ));
            },
            icon: const FaIcon(LineIcons.bell)),
      ],
    );
  }
}

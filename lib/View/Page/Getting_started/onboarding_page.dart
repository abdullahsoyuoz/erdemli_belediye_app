import 'package:erdemli_bel_app/View/View/main_page_view.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController _pageController;

  @override
  void initState() {
    _pageController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        // backgroundColor: Colors.white,
        body: SafeArea(
          child: IntroductionScreen(
            onDone: () {
              Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => const MainPageView(),), (route) => false);
            },
            showSkipButton: false,
            showBackButton: false,
            back: const Icon(Icons.arrow_back),
            next: const Text('İlerle', style: TextStyle(fontWeight: FontWeight.w600)),
            done: const Text('Tamam', style: TextStyle(fontWeight: FontWeight.w600)),
            curve: Curves.fastLinearToSlowEaseIn,
            controlsMargin: const EdgeInsets.all(16),
            dotsDecorator: const DotsDecorator(
              size: Size(10.0, 10.0),
              color: Color(0xFFBDBDBD),
              activeSize: Size(22.0, 10.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
            pages: onboardList
                .map((e) => PageViewModel(
                      image: FaIcon(e.icon),
                      title: e.title,
                      body: e.description,

                    ))
                .toList(),
          ),
        ));
  }
}

class OnboardItem extends StatelessWidget {
  final OnboardModel data;
  const OnboardItem({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        data.title,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}

class OnboardModel {
  int id;
  String title;
  String description;
  String imageUrl;
  IconData icon;
  OnboardModel(
      {this.id, this.description, this.imageUrl, this.title, this.icon});
}

List<OnboardModel> onboardList = [
  OnboardModel(
      id: 0,
      title: Faker().lorem.sentence().toString(),
      description: Faker().lorem.sentences(2).toString(),
      icon: FontAwesomeIcons.newspaper),
  OnboardModel(
      id: 1,
      title: Faker().lorem.sentence().toString(),
      description: Faker().lorem.sentences(2).toString(),
      icon: FontAwesomeIcons.bell),
];

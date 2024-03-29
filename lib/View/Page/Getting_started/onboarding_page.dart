import 'package:erdemli_bel_app/Controller/extensions.dart';
import 'package:erdemli_bel_app/View/Style/colors.dart';
import 'package:erdemli_bel_app/View/View/main_page_view.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
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
              Navigator.pushAndRemoveUntil(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const MainPageView(),
                  ),
                  (route) => false);
            },
            showSkipButton: false,
            showBackButton: false,
            back: const Icon(Icons.arrow_back),
            next: Text('İlerle',
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w400, fontSize: 17, color: AppColors.blue)),
            done: Text('Başlayalım',
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w400, fontSize: 17, color: AppColors.blue)),
            curve: Curves.fastLinearToSlowEaseIn,
            controlsMargin: const EdgeInsets.only(bottom: 20),
            dotsDecorator: DotsDecorator(
              size: const Size(10, 10),
              color: AppColors.tertiaryColor,
              activeColor: AppColors.blue,
              activeSize: const Size(50, 10),
              activeShape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            pages: onboardList
                .map((e) => PageViewModel(
                      reverse: true,
                      titleWidget: SizedBox(
                          width: context.width,
                          height: context.height * 0.35,
                          child: Center(
                              child: FaIcon(
                            e.icon,
                            color: Colors.black,
                            size: 70,
                          ))),
                      bodyWidget: const SizedBox(),
                      image: SizedBox(
                        width: context.width,
                        height: context.height * 0.5,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                e.title,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(color: Colors.black, fontSize: 21),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Text(
                                  e.description.replaceAll("[", "").replaceAll("]", ""),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
        style: GoogleFonts.montserrat(color: Colors.black),
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
      title: "Erdemli belediyesi uygulamasına hoş geldiniz!",
      description: "Haberler, Duyurular, Etkinlikler, Cenaze, Projeler gibi durumlardan haberdar olun!",
      icon: FontAwesomeIcons.newspaper),
  OnboardModel(
      id: 1,
      title: "İstediğiniz Kategoriye Ait Bildirim Alın",
      description: "İster Haber, İster Duyurular, İsterse de Etkinlikler gibi bir çok kategoriye ait bildirimleri istediğiniz zaman alabilirsiniz.",
      icon: FontAwesomeIcons.bell),
];

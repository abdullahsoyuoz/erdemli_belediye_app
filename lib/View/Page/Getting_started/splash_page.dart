import 'package:erdemli_bel_app/Controller/asset_constants.dart';
import 'package:erdemli_bel_app/View/View/main_page_view.dart';
import 'package:erdemli_bel_app/View/Style/colors.dart';
import 'package:erdemli_bel_app/View/Widget/slide_animate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), (){
      // Navigator.push(context, CupertinoPageRoute(builder: (context) => const OnboardingPage(),));
      Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => const MainPageView(),), (route) => false);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SizedBox.expand(
          child: ColoredBox(
        color: AppColors.primaryColor,
        child: Center(
          child: SlideAnimate(child: Image.asset(AppAssetContants.logo)),
        ),
      )),
    );
  }
}

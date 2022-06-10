import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();

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
    return Scaffold(
      key: _scaffoldKey,
      body: const SizedBox.expand(
      ),
    );
  }
}

class OnboardItem extends StatelessWidget {
  final OnboardModel data;
  const OnboardItem({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class OnboardModel {
  int id;
  String title;
  String description;
  String imageUrl;
  OnboardModel({this.id, this.description, this.imageUrl, this.title});
}

List<OnboardModel> onboardList = [];

import 'package:erdemli_bel_app/Controller/asset_constants.dart';
import 'package:erdemli_bel_app/View/Style/colors.dart';
import 'package:flutter/material.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key key}) : super(key: key);

  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage>
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
      body: SizedBox.expand(
          child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            top: 100,
            child: Card(
              margin: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(40))),
              color: AppColors.tertiaryColor,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 70),
                physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                child: Column(
                  children: [
                    RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: 'ERDEMLİ',
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 21)),
                      TextSpan(
                          text: 'BELEDİYESİ',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 21)),
                    ], style: TextStyle(color: Colors.black))),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 10,
                shape: const StadiumBorder(),
                child:
                    Image.asset(AppAssetContants.logo, width: 100, height: 100),
              ),
            ),
          )
        ],
      )),
    );
  }
}

import 'package:erdemli_bel_app/Controller/asset_constants.dart';
import 'package:erdemli_bel_app/Controller/contact_us.dart';
import 'package:erdemli_bel_app/Controller/extensions.dart';
import 'package:erdemli_bel_app/Model/Dummy/belediye.dart';
import 'package:erdemli_bel_app/View/Style/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
              child: buildBody(),
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

  Widget buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
      physics:
          const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      child: Column(
        children: [
          RichText(
            text: const TextSpan(children: [
              TextSpan(
                  text: 'ERDEMLİ',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 21)),
              TextSpan(
                  text: 'BELEDİYESİ',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 21)),
            ], style: TextStyle(color: Colors.black)),
          ),
          buildInfoList(),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: contactList.length,
            itemBuilder: (context, index) {
              final data = contactList[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: SizedBox(
                  height: 70,
                  child: Card(
                    color: AppColors.primaryColor,
                    elevation: 5,
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                  width: 40,
                                  child: Center(
                                      child: FaIcon(
                                    data.icon,
                                    size: 30,
                                    color: Colors.white,
                                  ))),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  data.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          FaIcon(
                            FontAwesomeIcons.chevronRight,
                            color: AppColors.accentColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              height: 50,
              width: context.width,
              // child: ListView.builder(
              //   shrinkWrap: true,
              //   physics: const AlwaysScrollableScrollPhysics(
              //       parent: BouncingScrollPhysics()),
              //   scrollDirection: Axis.horizontal,
              //   itemCount: contactSocialMediaList.length,
              //   itemBuilder: (c, index) {
              //     final data = contactSocialMediaList[index];
                  
              //   },
              // ),
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: contactSocialMediaList.map((e){
                    return GestureDetector(
                      onTap: () async {
                        if (await canLaunchUrl(Uri.parse(e.url))) {
                          launchUrl(Uri.parse(e.url));
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: e.color,
                          child: FaIcon(
                            e.icon,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildInfoList() {
    return Column(
      children: [
        ContactInfoWidget(
            content: belediye.address,
            icon: FontAwesomeIcons.locationDot,
            callback: () {}),
        ContactInfoWidget(
            content: belediye.phone,
            icon: FontAwesomeIcons.phone,
            callback: () async {
              final url = 'tel:${belediye.phone}';
              if (await canLaunchUrlString(url)) {
                canLaunchUrlString('tel:${belediye.phone}');
              }
            }),
        ContactInfoWidget(
            content: belediye.fax, icon: FontAwesomeIcons.fax, callback: () {}),
        ContactInfoWidget(
            content: belediye.email,
            icon: FontAwesomeIcons.envelope,
            callback: () {}),
      ],
    );
  }
}

class ContactInfoWidget extends StatelessWidget {
  final String content;
  final IconData icon;
  final VoidCallback callback;
  const ContactInfoWidget({Key key, this.content, this.icon, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: GestureDetector(
        onTap: () => callback.call(),
        child: Row(
          children: [
            FaIcon(
              icon,
              color: AppColors.accentColor,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(content),
            ))
          ],
        ),
      ),
    );
  }
}

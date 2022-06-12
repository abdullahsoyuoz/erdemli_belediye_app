import 'package:erdemli_bel_app/Controller/asset_constants.dart';
import 'package:erdemli_bel_app/Controller/contact_us.dart';
import 'package:erdemli_bel_app/Controller/drawer_controller.dart';
import 'package:erdemli_bel_app/Controller/extensions.dart';
import 'package:erdemli_bel_app/View/Style/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        children: [
          SizedBox(height: 100, child: Image.asset(AppAssetContants.logo)),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: drawerList.map((e) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: GestureDetector(
                    onTap: () => drawerRouteHelper(context, e.id),
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              e.icon == null
                                  ? const Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: SizedBox(),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: SizedBox(
                                          width: 25,
                                          child: Center(
                                            child: FaIcon(
                                              e.icon,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          )),
                                    ),
                              Expanded(
                                child: Text(
                                  e.title + '',
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Colors.white),
                                ),
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
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              height: 50,
              width: context.width,
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: contactSocialMediaList.map((e) {
                    return GestureDetector(
                      onTap: () async {
                        if (await canLaunchUrl(Uri.parse(e.url))) {
                          launchUrl(Uri.parse(e.url));
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
}

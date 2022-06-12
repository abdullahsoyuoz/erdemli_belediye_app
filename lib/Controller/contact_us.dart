import 'package:erdemli_bel_app/View/Page/Contact/complaint_page.dart';
import 'package:erdemli_bel_app/View/Page/Contact/contact_page.dart';
import 'package:erdemli_bel_app/View/Page/Contact/suggestion_page.dart';
import 'package:erdemli_bel_app/View/View/main_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactUsMenu {
  int id;
  String title;
  IconData icon;
  ContactUsMenu({
    this.id,
    this.title,
    this.icon,
  });
}

List<ContactUsMenu> contactList = [
  ContactUsMenu(id: 0, title: "İletişim", icon: FontAwesomeIcons.headset),
  ContactUsMenu(
      id: 1, title: "Şikayet", icon: FontAwesomeIcons.envelopeOpenText),
  ContactUsMenu(
      id: 2, title: "Görüş & Öneri", icon: FontAwesomeIcons.lightbulb),
];

class SocialMedia {
  IconData icon;
  String url;
  Color color;
  SocialMedia({this.icon, this.url, this.color});
}

List<SocialMedia> contactSocialMediaList = [
  SocialMedia(icon: FontAwesomeIcons.twitter, color: const Color(0xff1da1f2), url: "https://twitter.com/erdemlibld"),
  SocialMedia(icon: FontAwesomeIcons.facebook, color: const Color(0xff1877f2), url: "https://www.facebook.com/erdemlibld/"),
  SocialMedia(icon: FontAwesomeIcons.instagram, color: const Color(0xffc32aa3), url: "https://www.instagram.com/erdemlibld/"),
  SocialMedia(icon: FontAwesomeIcons.youtube, color: const Color(0xffff0000), url: "https://www.youtube.com/user/erdemlibelediyesi33"),
];

Future<void> contactPageRouteHelper(BuildContext context, int index) async {
  switch (index) {
    case 0:
      Navigator.push(context, CupertinoPageRoute(builder: (context) => const ContactPage(),));
      break;
    case 1:
      Navigator.push(context, CupertinoPageRoute(builder: (context) => const ComplaintPage(),));
      break;
    case 2:
      Navigator.push(context, CupertinoPageRoute(builder: (context) => const SuggestionPage(),));
      break;
    default: Navigator.push(context, CupertinoPageRoute(builder: (context) => const MainPageView(),));
  }
}
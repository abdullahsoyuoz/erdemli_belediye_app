import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactUsMenu {
  int id;
  String title;
  IconData icon;
  Widget page;
  ContactUsMenu({
    this.id,
    this.title,
    this.icon,
    this.page,
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
  SocialMedia(icon: FontAwesomeIcons.pinterest, color: const Color(0xffbd081c), url: "https://twitter.com/erdemlibld"),
  SocialMedia(icon: FontAwesomeIcons.youtube, color: const Color(0xffff0000), url: "https://www.youtube.com/user/erdemlibelediyesi33"),
];

import 'package:erdemli_bel_app/Controller/main_page_view_provider.dart';
import 'package:erdemli_bel_app/View/Page/Contact/history_page.dart';
import 'package:erdemli_bel_app/View/View/main_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class DrawerItem {
  int id;
  String title;
  IconData icon;
  DrawerItem({this.id, this.title, this.icon});
}

List<DrawerItem> drawerList = [
  DrawerItem(id: 0, title: "Anasayfa", icon: FontAwesomeIcons.house),
  DrawerItem(id: 1, title: "Kategoriler", icon: FontAwesomeIcons.grip),
  DrawerItem(id: 2, title: "Tarihçe", icon: FontAwesomeIcons.book),
  DrawerItem(id: 3, title: "Bize Ulaşın", icon: FontAwesomeIcons.headset),
  DrawerItem(id: 4, title: "444 5 609", icon: FontAwesomeIcons.phone),
];

Future<void> drawerRouteHelper(BuildContext context, int index) async {
  switch (index) {
    case 0:
      Provider.of<MainPageIndexer>(context, listen: false)
          .setIndex(0)
          .whenComplete(() {
        zoomDrawerController.close.call();
        // Navigator.pushAndRemoveUntil(
        //     context,
        //     CupertinoPageRoute(builder: (context) => const MainPageView()),
        //     (route) => false);
      });
      break;
    case 1:
      Provider.of<MainPageIndexer>(context, listen: false)
          .setIndex(2)
          .whenComplete(() {
        zoomDrawerController.close.call();
        // Navigator.pushAndRemoveUntil(context,
        //     CupertinoPageRoute(builder: (context) => const MainPageView()), (route) => false);
      });
      break;
    case 2:
      zoomDrawerController.close.call();
      Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const HistoryPage(),
          ));
      break;
    case 3:
      Provider.of<MainPageIndexer>(context, listen: false)
          .setIndex(3)
          .whenComplete(() {
        zoomDrawerController.close.call();
        // Navigator.pushAndRemoveUntil(
        //     context,
        //     CupertinoPageRoute(builder: (context) => const MainPageView()),
        //     (route) => false);
      });
      break;
    case 4:
      // TODO: call phone
      break;
    default:
  }
}

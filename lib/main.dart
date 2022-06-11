import 'package:erdemli_bel_app/Controller/main_page_view_provider.dart';
import 'package:erdemli_bel_app/View/Page/Getting_started/splash_page.dart';
import 'package:erdemli_bel_app/View/Style/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MainPageIndexer(),)
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme.copyWith(),
      home: const AppStarter(),
    ),
  ));
}

class AppStarter extends StatelessWidget {
  const AppStarter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SplashPage();
  }
}

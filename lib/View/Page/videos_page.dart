import 'package:erdemli_bel_app/Controller/main_page_view_provider.dart';
import 'package:erdemli_bel_app/Model/Dummy/news.dart';
import 'package:erdemli_bel_app/View/Widget/news_video_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class VideosPage extends StatefulWidget {
  const VideosPage({Key key}) : super(key: key);

  @override
  _VideosPageState createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage>
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
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                zoomDrawerController.toggle.call();
              },
              icon: const FaIcon(
                FontAwesomeIcons.bars,
                size: 20,
              ),
              iconSize: 20,
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
            ),
            Text(
              'VİDEOLAR',
              style:
                  GoogleFonts.montserrat(fontWeight: FontWeight.w800, fontSize: 21),
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: SizedBox.expand(
        child: ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            final data = newsList[index];
            return NewsVideoWidget(data: data);
          },
        ),
      ),
    );
  }
}

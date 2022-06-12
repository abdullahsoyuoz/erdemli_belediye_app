import 'package:erdemli_bel_app/Model/Dummy/news.dart';
import 'package:erdemli_bel_app/View/Widget/news_video_widget.dart';
import 'package:flutter/material.dart';
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
        title: Text(
          'VİDEOLAR',
          style:
              GoogleFonts.montserrat(fontWeight: FontWeight.w800, fontSize: 21),
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

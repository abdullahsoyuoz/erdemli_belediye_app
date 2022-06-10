import 'package:flutter/material.dart';

class VideosPage extends StatefulWidget {
  const VideosPage({ Key key }) : super(key: key);

  @override
  _VideosPageState createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> with SingleTickerProviderStateMixin {
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
        title: const Text('VideosPage'),
      ),
      body: const SizedBox.expand(
        child: Text('VideosPage'),
      ),
    );
  }
}
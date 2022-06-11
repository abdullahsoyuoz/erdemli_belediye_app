import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({ Key key }) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with SingleTickerProviderStateMixin {
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
        title: const Text('SearchPage'),
      ),
      body: const SizedBox.expand(
        child: Text('SearchPage'),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({ Key key }) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> with SingleTickerProviderStateMixin {
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
        title: const Text('HistoryPage'),
      ),
      body: const SizedBox.expand(
        child: Text('HistoryPage'),
      ),
    );
  }
}
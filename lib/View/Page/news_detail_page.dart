import 'dart:math';

import 'package:erdemli_bel_app/Controller/extensions.dart';
import 'package:erdemli_bel_app/Model/Dummy/news.dart';
import 'package:erdemli_bel_app/View/Style/colors.dart';
import 'package:erdemli_bel_app/View/Widget/sliver_header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class NewsDetail extends StatefulWidget {
  final News data;
  const NewsDetail({Key key, this.data}) : super(key: key);

  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail>
    with SingleTickerProviderStateMixin {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  YoutubePlayerController youtubeController;

  @override
  void initState() {
    youtubeController = YoutubePlayerController(
        initialVideoId: widget.data.videoUrl,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ));
    super.initState();
  }

  @override
  void dispose() {
    youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                toolbarHeight: 70,
                expandedHeight: 200,
                automaticallyImplyLeading: false,
                title: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const CircleAvatar(
                        child:
                            Center(child: Icon(FontAwesomeIcons.chevronLeft, color: Colors.white,)),
                        backgroundColor: Colors.black,
                        radius: 20,
                      ),
                    )
                  ],
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    widget.data.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              MultiSliver(pushPinnedChildren: false, children: [
                const SliverPadding(
                    padding: EdgeInsets.only(top: 20),
                    sliver: SliverToBoxAdapter()),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: widget.data.category.color),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 3,
                            ),
                            child: Text(
                              widget.data.category.title,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.calendarDay,
                                    color: Colors.black.withOpacity(.5),
                                    size: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      widget.data.dateTime.dateFormat,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black.withOpacity(.5)),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.eye,
                                    color: Colors.black.withOpacity(.5),
                                    size: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      Random().nextInt(555).toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black.withOpacity(.5)),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SliverPadding(
                    padding: EdgeInsets.only(top: 10),
                    sliver: SliverToBoxAdapter()),
                SliverPersistentHeader(
                  key: LabeledGlobalKey("newsTitle"),
                  pinned: true,
                  floating: true,
                  delegate: CustomSliverPersistentHeader(
                    context,
                    maxExtentValue: 100,
                    minExtentValue: 100,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        widget.data.title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                widget.data.containVideo
                    ? SliverToBoxAdapter(
                        child: YoutubePlayer(controller: youtubeController),
                      )
                    : SizedBox(),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      widget.data.description.replaceAll(", ", "\n"),
                      style: GoogleFonts.montserrat(fontSize: 16),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ));
  }
}

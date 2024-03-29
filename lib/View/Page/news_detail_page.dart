import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:erdemli_bel_app/Controller/extensions.dart';
import 'package:erdemli_bel_app/Model/Dummy/news.dart';
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
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()),
            slivers: [
              SliverAppBar(
                toolbarHeight: 70,
                expandedHeight: 200,
                automaticallyImplyLeading: false,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                pinned: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const CircleAvatar(
                        child: Center(
                            child: Icon(
                          FontAwesomeIcons.chevronLeft,
                          color: Colors.white,
                          size: 20,
                        )),
                        backgroundColor: Colors.black,
                        radius: 20,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const CircleAvatar(
                        child: Center(
                            child: Icon(
                          FontAwesomeIcons.shareNodes,
                          color: Colors.white,
                          size: 20,
                        )),
                        backgroundColor: Colors.black,
                        radius: 20,
                      ),
                    ),
                  ],
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: widget.data.containVideo
                      ? YoutubePlayer(controller: youtubeController)
                      : Image.network(
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
                              style: GoogleFonts.montserrat(
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
                                    FontAwesomeIcons.clock,
                                    color: Colors.black.withOpacity(.5),
                                    size: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      widget.data.dateTime.dateFormat,
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black.withOpacity(0.5)),
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
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black.withOpacity(0.5)),
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
                // const SliverPadding(
                //     padding: EdgeInsets.only(top: 10),
                //     sliver: SliverToBoxAdapter()),
                // SliverPersistentHeader(
                //   key: LabeledGlobalKey("newsTitle"),
                //   pinned: true,
                //   floating: true,
                //   delegate: CustomSliverPersistentHeader(
                //     context,
                //     maxExtentValue: 100,
                //     minExtentValue: 100,
                //     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                //     child: DecoratedBox(
                //       decoration: BoxDecoration(
                //           color: Theme.of(context).scaffoldBackgroundColor,
                //           boxShadow: [
                //             BoxShadow(
                //                 color: Colors.black.withOpacity(.2),
                //                 offset: const Offset(0, 2),
                //                 blurRadius: 1)
                //           ]),
                //       child: Padding(
                //         padding: const EdgeInsets.symmetric(horizontal: 10.0),
                //         child: Text(
                //           widget.data.title,
                //           maxLines: 4,
                //           overflow: TextOverflow.ellipsis,
                //           style: GoogleFonts.montserrat(
                //               fontSize: 18, fontWeight: FontWeight.w600),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      widget.data.title,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      widget.data.description.replaceAll(", ", "\n"),
                      style: GoogleFonts.montserrat(fontSize: 16),
                    ),
                  ),
                ),
                SliverPadding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 50),
                    sliver: SliverToBoxAdapter(
                        child: SizedBox(
                      width: context.width,
                      height: context.width * 3 / 4,
                      child: CarouselSlider(
                        items: widget.data.photosUrl
                            .map((e) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                      e,
                                      fit: BoxFit.cover,
                                    ),
                              ),
                            ))
                            .toList(),
                        options: CarouselOptions(
                          viewportFraction: 0.9,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          height: context.width * 3 / 4,
                          autoPlay: false,
                        ),
                      ),
                    ))),
              ]),
            ],
          ),
        ));
  }
}

import 'package:erdemli_bel_app/Controller/extensions.dart';
import 'package:erdemli_bel_app/Model/Dummy/news.dart';
import 'package:flutter/material.dart';
import 'package:erdemli_bel_app/View/Page/news_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class NewsVideoWidget extends StatefulWidget {
  final News data;
  const NewsVideoWidget({Key key, this.data}) : super(key: key);

  @override
  _NewsVideoWidgetState createState() => _NewsVideoWidgetState();
}

class _NewsVideoWidgetState extends State<NewsVideoWidget> {
  final Key _newsKey = UniqueKey();
  YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    youtubePlayerController = YoutubePlayerController(
        initialVideoId: widget.data.videoUrl,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ));
    super.initState();
  }

  @override
  void dispose() {
    youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: _newsKey,
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => NewsDetail(data: widget.data)));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Material(
          elevation: 2,
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child:
                          YoutubePlayer(controller: youtubePlayerController)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    widget.data.title,
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 17,
                        height: 1.5,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
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
                            padding: const EdgeInsets.only(left: 5.0),
                            child: widget.data.containVideo
                                ? FaIcon(
                                    FontAwesomeIcons.video,
                                    color: widget.data.category.color
                                        .withOpacity(.75),
                                  )
                                : const SizedBox(),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 3.0),
                            child: FaIcon(
                              FontAwesomeIcons.clock,
                              size: 14,
                              color: Colors.black.withOpacity(.5),
                            ),
                          ),
                          Text(
                            widget.data.dateTime.dateFormat,
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.5)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NewsVideoShimmerWidget extends StatelessWidget {
  final News data;
  const NewsVideoShimmerWidget({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        elevation: 2,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: Colors.grey.shade300,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        width: context.width,
                        height: context.width,
                        color: Colors.black,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: context.width,
                        height: 20,
                        color: Colors.black,
                      ),
                      Container(
                        width: context.width * 0.7,
                        height: 20,
                        margin: const EdgeInsets.only(top: 10),
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 70,
                            height: 20,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 3.0),
                            child: FaIcon(
                              FontAwesomeIcons.clock,
                              size: 14,
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 20,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:erdemli_bel_app/Controller/extensions.dart';
import 'package:erdemli_bel_app/Model/Dummy/news.dart';
import 'package:erdemli_bel_app/View/Page/news_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewsWidget extends StatelessWidget {
  final News data;
  const NewsWidget({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => NewsDetail(data: data)));
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.title,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  height: 1.5,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        )),
                    const SizedBox(width: 10),
                    Expanded(
                        flex: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(
                                data.imageUrl,
                                fit: BoxFit.cover,
                              )),
                        ))
                  ],
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
                                color: data.category.color),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 3,
                              ),
                              child: Text(
                                data.category.title,
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: data.containVideo
                                ? FaIcon(
                                    FontAwesomeIcons.video,
                                    color: data.category.color.withOpacity(.75),
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
                        data.dateTime.dateFormat,
                        style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.5)),
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

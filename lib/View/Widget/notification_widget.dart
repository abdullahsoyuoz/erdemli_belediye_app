import 'package:erdemli_bel_app/Controller/extensions.dart';
import 'package:erdemli_bel_app/Model/Dummy/news.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationItemWidget extends StatelessWidget {
  final News data;
  const NotificationItemWidget({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context,
        //     CupertinoPageRoute(builder: (context) => NewsDetail(data: data)));
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
            child: SizedBox(
              height: 150,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          data.imageUrl,
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      )),
                  const SizedBox(width: 10),
                  Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data.title,
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 14,
                                height: 1.5,
                                fontWeight: FontWeight.w400),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 3.0),
                                child: FaIcon(
                                  FontAwesomeIcons.clock,
                                  size: 14,
                                  color: Colors.black.withOpacity(.5),
                                ),
                              ),
                              Text(
                                data.dateTime.dateFormat,
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w400,
                                    color:
                                        Colors.black.withOpacity(0.5)),
                              ),
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

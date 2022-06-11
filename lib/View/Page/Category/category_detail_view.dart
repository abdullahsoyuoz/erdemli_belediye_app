import 'package:animate_do/animate_do.dart';
import 'package:erdemli_bel_app/Model/Dummy/categories.dart';
import 'package:erdemli_bel_app/Model/Dummy/news.dart';
import 'package:erdemli_bel_app/View/Style/colors.dart';
import 'package:erdemli_bel_app/View/Widget/news_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryDetailView extends StatefulWidget {
  final Categories data;
  const CategoryDetailView({Key key, this.data}) : super(key: key);

  @override
  State<CategoryDetailView> createState() => _CategoryDetailViewState();
}

class _CategoryDetailViewState extends State<CategoryDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            automaticallyImplyLeading: false,
            centerTitle: false,
            floating: true,
            pinned: true,
            backgroundColor: widget.data.color,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              collapseMode: CollapseMode.parallax,
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        FontAwesomeIcons.chevronLeft,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          widget.data.title,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                          overflow: TextOverflow.fade,
                          maxLines: 2,
                          softWrap: true,
                        ),
                      ),
                    ),
                    IconButton(
                onPressed: () {
                  setState(() {
                    widget.data.follow = !widget.data.follow;
                  });
                },
                iconSize: 20,
                icon: Swing(
                    animate: false,
                    controller: (c) {
                      if (widget.data.follow) {
                        // TODO: tıklanıldığında tetikletecen
                        c.forward().whenComplete(() => c.reset());
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(1),
                      radius: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: FaIcon(
                          FontAwesomeIcons.solidBell,
                          size: 20,
                          color: widget.data.follow
                              ? AppColors.accentColor
                              : AppColors.black,
                        ),
                      ),
                    )),
              ),
                  ],
                ),
              ),
              background: Image.network(
                widget.data.imageUrl,
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(.5),
                colorBlendMode: BlendMode.darken,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate.fixed(List.generate(
                  newsList.length,
                  (index) => NewsWidget(
                        data: newsList[index],
                      ))))
        ],
      ),
    );
  }
}

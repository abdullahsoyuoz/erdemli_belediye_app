import 'package:animate_do/animate_do.dart';
import 'package:animations/animations.dart';
import 'package:erdemli_bel_app/Controller/extensions.dart';
import 'package:erdemli_bel_app/Model/Dummy/categories.dart';
import 'package:erdemli_bel_app/View/Page/Category/category_detail_view.dart';
import 'package:erdemli_bel_app/View/Style/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage>
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
          'KATEGORİLER',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w800, fontSize: 21),
        ),
        centerTitle: false,
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
              itemBuilder: (context, index) {
                final data = categoryList[index];
                return CategoryItem(data: data);
              },
              itemCount: categoryList.length),
        ),
      ),
    );
  }
}

class CategoryItem extends StatefulWidget {
  final Categories data;
  const CategoryItem({Key key, this.data}) : super(key: key);

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedBuilder: (context, action) {
        return Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              widget.data.imageUrl,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.width,
                child: DecoratedBox(
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(.5)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      widget.data.title,
                      textAlign: TextAlign.center,
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
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    widget.data.follow = !widget.data.follow;
                  });
                },
                iconSize: 40,
                icon: Swing(
                    animate: false,
                    controller: (c) {
                      if (widget.data.follow) {
                        // TODO: tıklanıldığında tetikletecen
                        c.forward().whenComplete(() => c.reset());
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(.7),
                      radius: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: FaIcon(
                          FontAwesomeIcons.solidBell,
                          color: widget.data.follow
                              ? AppColors.accentColor
                              : AppColors.black,
                        ),
                      ),
                    )),
              ),
            )
          ],
        );
      },
      openBuilder: (context, f) {
        return CategoryDetailView(
          data: widget.data,
        );
      },
      transitionType: ContainerTransitionType.fade,
    );
  }
}

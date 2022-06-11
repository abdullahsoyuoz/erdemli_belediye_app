import 'package:animations/animations.dart';
import 'package:erdemli_bel_app/Model/Dummy/categories.dart';
import 'package:erdemli_bel_app/View/Page/Category/category_detail_view.dart';
import 'package:flutter/material.dart';
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
        title: const Text(
          'KATEGORİLER',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 21),
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

class CategoryItem extends StatelessWidget {
  final Categories data;
  const CategoryItem({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedBuilder: (context, action) {
        return Stack(
          fit: StackFit.expand,
          children: [
            Hero(
                tag: data.hashCode,
                child: Image.network(
                  data.imageUrl,
                  fit: BoxFit.cover,
                  color: Colors.black.withOpacity(.5),
                  colorBlendMode: BlendMode.darken,
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Hero(
                tag: data.hashCode + data.title.hashCode,
                child: Text(
                  data.title,
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
            )
          ],
        );
      },
      openBuilder: (context, f) {
        return CategoryDetailView(
          data: data,
        );
      },
      transitionType: ContainerTransitionType.fade,
    );
  }
}

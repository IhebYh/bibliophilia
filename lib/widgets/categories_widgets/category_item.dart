// Category Item from Categories Section
import 'package:bibliophilia/models/category.dart';
import 'package:bibliophilia/screens/specific_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItem extends StatefulWidget {
  final Categ category;

  CategoryItem(this.category);

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  double elevation = 18.0;

  void navigateToSpecificSearchScreen() {
    setState(() {
      elevation = 4.0;
    });

    Future.delayed(const Duration(milliseconds: 100)).then((_) {
      setState(() {
        elevation = 18.0;
      });
      Navigator.of(context)
          .pushNamed(SpecificSearchScreen.routeName, arguments: {
        'category': widget.category.categoryLink,
        'categoryTitle': widget.category.categoryTitle,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 16, bottom: MediaQuery
          .of(context)
          .size
          .height * 0.09 * 1.3),
      child: GestureDetector(
        onTap: navigateToSpecificSearchScreen,
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          elevation: elevation,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.asset(
                    widget.category.iconLink,
                    scale: 1.0,
                  ),
                ),
                const SizedBox(height: 10),
                FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Text(
                    widget.category.categoryTitle,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          // letterSpacing: 2,
                        )),
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

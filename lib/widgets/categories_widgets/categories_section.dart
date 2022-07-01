// Categories Section widget from home_screen
import 'package:bibliophilia/providers/categories.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'category_item.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<Categories>(context);
    return Container(
      padding: const EdgeInsets.only(top:20.0, bottom: 0),
      child: Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 16.0, left: 22.0, bottom: 8.0),
          child: Text('Categories',
            style: GoogleFonts.montserrat(
                textStyle:
                const TextStyle(fontSize: 26, fontWeight: FontWeight.w700)
            )
        )
    ),
        ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.categoriesList.length,
          itemBuilder: (context, i) =>
            CategoryItem(categories.categoriesList[i]),
        )
    ]),
    );
  }
}

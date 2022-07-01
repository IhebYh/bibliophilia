import 'package:bibliophilia/models/book.dart';
import 'package:bibliophilia/widgets/detailWidgets/actions_widget.dart';
import 'package:bibliophilia/widgets/detailWidgets/authors_widget.dart';
import 'package:bibliophilia/widgets/detailWidgets/categories_widget.dart';
import 'package:bibliophilia/widgets/detailWidgets/description_widget.dart';
import 'package:bibliophilia/widgets/detailWidgets/metadata_widget.dart';
import 'package:bibliophilia/widgets/detailWidgets/title_widget.dart';
import 'package:flutter/material.dart';

class BookDetailsWidget extends StatelessWidget {
  final Book book;

  BookDetailsWidget(this.book);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CategoriesWidget(book),
        const SizedBox(height: 10.0),
        AuthorsWidget(book),
        const SizedBox(height: 10.0),
        TitleWidget(book),
        const Divider(),
        DescriptionWidget(book),
        const SizedBox(height: 10.0),
        const Divider(),
        const SizedBox(height: 10.0),
        MetadataWidget(book),
        const SizedBox(height: 10.0),
        const Divider(),
        ActionsWidget(book),
        const SizedBox(height: 10.0),
      ],
    );
  }
}

/// MetaData Widget
import 'package:bibliophilia/models/book.dart';
import 'package:bibliophilia/services/utils.dart';
import 'package:flutter/material.dart';

class MetadataWidget extends StatelessWidget {
  final Book book;

  MetadataWidget(this.book);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Publisher',
                style: TextStyle(color: Colors.teal),
              ),
              Text(
                Utils.trimString(book.publisher, 20),
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
                softWrap: true,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Pages',
                style: TextStyle(color: Colors.teal),
              ),
              Text(
                /*book.pageCount != null ? book.pageCount.toString() : */'---' ,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Rating',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.teal),
              ),
              Text(
                book.averageRating,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Published',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.teal),
              ),
              Text(
                book.publishedDate,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

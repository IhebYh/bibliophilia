/// Authors Widget
import 'package:bibliophilia/models/book.dart';
import 'package:bibliophilia/services/utils.dart';
import 'package:flutter/material.dart';

class AuthorsWidget extends StatelessWidget {
  final Book book;

  AuthorsWidget(this.book);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        Utils.listToString(book.authors, '   '),
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.teal, fontSize: 12.0),
        softWrap: true,
      ),
    );
  }
}

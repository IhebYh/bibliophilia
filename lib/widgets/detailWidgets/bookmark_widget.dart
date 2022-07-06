/// bookmark Widget
import 'package:bibliophilia/models/book.dart';
import 'package:bibliophilia/providers/bookshelf.dart';
import 'package:bibliophilia/services/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Bookmark extends StatefulWidget {
  final String bookId;
  final Book book;

  Bookmark({required this.bookId, required this.book});

  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<Bookshelf>(context).checkExistingBook(widget.bookId),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        return IconButton(
          icon: Icon(
              snapshot.data == true ? Icons.bookmark : Icons.bookmark_border),
          color: Colors.black,
          iconSize: 32,
          onPressed: snapshot.data == true
              ? () async {
            /// Delete a book from the saved books list in the DB
                  await Provider.of<Bookshelf>(context, listen: false)
                      .removeSavedBook(widget.bookId);
                  setState(() {});
                }
              : () {
            /// add a book from the saved books list in the DB
                  Provider.of<Bookshelf>(context, listen: false).addToBookShelf(
                    widget.book.id,
                    widget.book.title,
                    widget.book.thumbnailUrl,
                    Utils.listToString(widget.book.authors, '   '),
                  );
                },
        );
      },
    );
  }
}

/// Book Detail Screen Widget
import 'package:bibliophilia/models/book.dart';
import 'package:bibliophilia/services/utils.dart';
import 'package:bibliophilia/widgets/detailWidgets/book_details_widget.dart';
import 'package:bibliophilia/widgets/detailWidgets/bookmark_widget.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class BookDetailBottomSheet extends StatelessWidget {
  final Book book;

  BookDetailBottomSheet(this.book);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: const Color(0xFF737373).withOpacity(0),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.80,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: (180 / 2) + 20, left: 16.0, right: 16.0),
                child: BookDetailsWidget(book),
              ),
            ),
            Positioned(
              top: -180 / 2,
              child: Card(
                elevation: 10.0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: SizedBox(
                  width: 100,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      book.thumbnailUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 25,
              top: 20,
              child: IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {
                  Share.share(
                      'Check out this Book:\n ${book.title} \n ${book.infoLink}');
                },
              ),
            ),
            Positioned(
              right: 20,
              top: 20,
              child: Bookmark(bookId: book.id, book: book),
            ),
            Positioned(
              left: 30,
              top: 70,
              child: SizedBox(
                width: 36,
                height: 36,
                child: GestureDetector(
                  child: Image.asset('images/amazonicon.png'),
                  onTap: () {
                    Utils.launchURL(
                        'https://www.amazon.com/s?k=${book.title} ${Utils.listToString(book.authors, ' ')}&language=en_US&currency=INR');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
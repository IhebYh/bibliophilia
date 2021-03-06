/// Paginator Widget
import 'package:bibliophilia/providers/books.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Paginator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// consume data from the api and display the number of books found
    return Consumer<Books>(
      builder: (BuildContext context, books, _) {
        return Card(
          elevation: 4.0,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '${books.totalBookCount} books found',
                  style: const TextStyle(
                      color: Color(0xff0DB067), fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  color: const Color(0xff0DB067),
                  icon: const Icon(Icons.chevron_left),
                  onPressed: books.startIndex == 0
                      ? null
                      : () {
                    books.paginate(false);
                    books.setSpecificScreenLoadingState(true);
                  },
                ),
                IconButton(
                  color: const Color(0xff0DB067),
                  icon: const Icon(Icons.chevron_right),
                  onPressed: (books.startIndex <= books.totalBookCount - 18)
                      ? () {
                    books.paginate(true);
                    books.setSpecificScreenLoadingState(true);
                  }
                      : null,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
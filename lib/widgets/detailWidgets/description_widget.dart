/// Description Widget
import 'package:bibliophilia/models/book.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/parser.dart';

class DescriptionWidget extends StatelessWidget {
  final Book book;

  DescriptionWidget(this.book);

  String _parseHtmlString(String htmlString) {
    var document = parse(htmlString);

    String parsedString = parse(document.body?.text).documentElement!.text;

    return parsedString;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey[50],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'DESCRIPTION',
              style: TextStyle(
                  color: Colors.teal,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                    child: Text(
                  _parseHtmlString(book.description),
                  style: GoogleFonts.notoSans(
                      textStyle: const TextStyle(
                    fontSize: 14.0,
                    letterSpacing: 0.2,
                  )),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

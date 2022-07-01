import 'dart:convert';

import 'package:bibliophilia/models/book.dart';
import 'package:bibliophilia/services/utils.dart';
import 'package:http/http.dart';

class BookSearchUtils {
  static Future<Book> fetchBookById(String id) async {
    final url = 'https://www.googleapis.com/books/v1/volumes/$id';

    Response response = await get(Uri.parse(url));
    var bookMap = await jsonDecode(response.body);
    return Utils.bookFromJson(bookMap);
  }
}
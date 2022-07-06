/// Utilities Class
/// Contains a number of functions needed in this project
import 'package:bibliophilia/models/book.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static String listToString(List<String> list, String seperator) {
    String generatedString = '';
    if (list == null) {
      return '---';
    } else {
      list.forEach((element) {
        generatedString += element + seperator;
      });
      return generatedString;
    }
  }

  static Future<void> launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  static String trimString(String strToTrim, [int trimLimit = 40]) {
    if (strToTrim.length > trimLimit) {
      return '${strToTrim.substring(0, trimLimit)}...';
    }
    return strToTrim;
  }

  static Book bookFromJson(Map book) {
    var volumeInfo = book['volumeInfo'];
    var saleInfo = book['saleInfo'];
    var accessInfo = book['accessInfo'];
    return Book(
      id: book['id'] ?? "-----",
      title: volumeInfo['title']?? "-----",
      subtitle: volumeInfo['subtitle']?? "-----",
      publishedDate: volumeInfo['publishedDate'] == null
          ? '---'
          : volumeInfo['publishedDate'],
      authors: volumeInfo['authors'] != null
          ? (volumeInfo['authors'] as List<dynamic>)
          .map((author) => author.toString())
          .toList()
          : [''],
      publisher:
      volumeInfo['publisher'] == null ? '---' : volumeInfo['publisher'],
      description: volumeInfo['description'] ?? 'No description available.',
      //pageCount: int.parse(volumeInfo['pageCount']),//?? "-----",
      categories: volumeInfo['categories'] == null
          ? []
          : (volumeInfo['categories'] as List<dynamic>)
          .map((category) => category.toString())
          .toList(),
      averageRating: volumeInfo['averageRating'] == null
          ? '---'
          : volumeInfo['averageRating'].toString(),
      thumbnailUrl: volumeInfo['imageLinks'] != null
          ? '${volumeInfo['imageLinks']['thumbnail']}'
          : 'https://www.wildhareboca.com/wp-content/uploads/sites/310/2018/03/image-not-available.jpg',
      previewLink: volumeInfo['previewLink']?? "-----",
      infoLink: volumeInfo['infoLink']?? "-----",
      buyLink: saleInfo['buyLink']?? "-----",
      webReaderLink: accessInfo['webReaderLink']?? "-----",
      isEbook: saleInfo['isEbook']?? "-----",
      saleability: saleInfo['saleability']?? "-----",
      amount: saleInfo['saleability'] != 'FOR_SALE'
          ? '---'
          : saleInfo['retailPrice']['amount'].toString(),
      currencyCode: saleInfo['saleability'] != 'FOR_SALE'
          ? '---'
          : saleInfo['retailPrice']['currencyCode'],
      accessViewStatus: accessInfo['accessViewStatus']?? "-----",
      //rank: int.parse(volumeInfo['rank']),
      singleAuthor: volumeInfo['singleAuthor'] ?? "-----",
      isbn: volumeInfo['isbn'] ?? "-----",
    );
  }
}
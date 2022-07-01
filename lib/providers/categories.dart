// list of books categories
import 'package:bibliophilia/models/category.dart';
import 'package:flutter/cupertino.dart';

class Categories with ChangeNotifier {
  List<Categ> categoriesList = [
    Categ(
        categoryTitle: 'Code',
        categoryLink: 'Code',
        iconLink: 'images/code.png', oldDate: '', updated: '', newDate: ''),
    Categ(
        categoryTitle: 'Art &\nLiterature',
        categoryLink: 'Art and Literature',
        iconLink: 'images/literature.png', updated: '', newDate: '', oldDate: ''),
    Categ(
        categoryTitle: 'Biography /\n Autobiography',
        categoryLink: 'Biography Autobiography',
        iconLink: 'images/biography.png', oldDate: '', updated: '', newDate: ''),
    Categ(
        categoryTitle: 'Cooking',
        categoryLink: 'cooking',
        iconLink: 'images/cooking.png', oldDate: '', updated: '', newDate: ''),
    Categ(
        categoryTitle: 'Drama',
        categoryLink: 'drama',
        iconLink: 'images/drama.png', oldDate: '', updated: '', newDate: ''),
    Categ(
        categoryTitle: 'Education',
        categoryLink: 'Education',
        iconLink: 'images/education.png', oldDate: '', updated: '', newDate: ''),
    Categ(
        categoryTitle: 'Fantasy',
        categoryLink: 'fantasy',
        iconLink: 'images/fantasy.png', oldDate: '', updated: '', newDate: ''),
    Categ(
        categoryTitle: 'Fiction',
        categoryLink: 'fiction',
        iconLink: 'images/fiction.png', oldDate: '', updated: '', newDate: ''),
    Categ(
        categoryTitle: 'Historical',
        categoryLink: 'historical',
        iconLink: 'images/history.png', oldDate: '', updated: '', newDate: ''),
    Categ(
        categoryTitle: 'Horror',
        categoryLink: 'horror',
        iconLink: 'images/horror.png', oldDate: '', updated: '', newDate: ''),
    Categ(
        categoryTitle: 'Humor',
        categoryLink: 'humor',
        iconLink: 'images/humor.png', oldDate: '', updated: '', newDate: ''),
    Categ(
        categoryTitle: 'Religious',
        categoryLink: 'religious',
        iconLink: 'images/religious.png', oldDate: '', updated: '', newDate: ''),
    Categ(
        categoryTitle: 'Sports',
        categoryLink: 'sports',
        iconLink: 'images/sports.png', oldDate: '', updated: '', newDate: ''),
    Categ(
        categoryTitle: 'Suspense',
        categoryLink: 'suspense',
        iconLink: 'images/suspense.png', oldDate: '', updated: '', newDate: ''),
    Categ(
        categoryTitle: 'Thriller',
        categoryLink: 'thriller',
        iconLink: 'images/thriller.png', oldDate: '', updated: '', newDate: ''),
    Categ(
        categoryTitle: 'Travel /\n Photography',
        categoryLink: 'Travel and Photography',
        iconLink: 'images/travel.png', oldDate: '', updated: '', newDate: ''),
  ];
}
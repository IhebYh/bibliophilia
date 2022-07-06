/// Search Screen Widget
import 'package:bibliophilia/providers/books.dart';
import 'package:bibliophilia/widgets/books_grid.dart';
import 'package:bibliophilia/widgets/navbar.dart';
import 'package:bibliophilia/widgets/network_status.dart';
import 'package:bibliophilia/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search-screen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool loadGrid = false;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Future.delayed(Duration.zero).then((_) {
      Provider.of<Books>(context, listen: false).clearList();
      setState(() {
        loadGrid = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: NavBar(SearchScreen.routeName),
      body: Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Material(
                elevation: 2,
                child: SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Container(
                    color: Colors.black38,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 32.0, left: 16.0, right: 16.0, bottom: 2.0),
                      child: SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Discover',
                              style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                'Search from more than 30 million books with over 10 million free ebooks...',
                                style: GoogleFonts.notoSans(
                                    textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      letterSpacing: 0.2,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              NetworkStatus(offlineChild: Container(), child: SearchBar()),
            ],
          ),
          if (loadGrid)
            BooksGrid(
              routeName: SearchScreen.routeName,
            ),
        ],
      ),
    );
  }
}
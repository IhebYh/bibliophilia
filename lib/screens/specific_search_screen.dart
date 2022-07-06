/// Specific Search Screen Widget
import 'package:bibliophilia/providers/books.dart';
import 'package:bibliophilia/services/connectivity_status.dart';
import 'package:bibliophilia/widgets/books_grid.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SpecificSearchScreen extends StatefulWidget {
  static const routeName = '/specific-search-screen';

  @override
  _SpecificSearchScreenState createState() => _SpecificSearchScreenState();
}

class _SpecificSearchScreenState extends State<SpecificSearchScreen> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    var connectivity = Provider.of<ConnectivityStatus>(context);
    if (connectivity != ConnectivityStatus.Offline) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> searchArgs =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    Provider.of<Books>(context, listen: false).setStartIndex();
    Provider.of<Books>(context, listen: false)
        .toggleTotalItemsCalculation(true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Material(
            elevation: 2,
            child: SizedBox(
              height: 150,
              child: Container(
                color: Colors.black38,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0, top: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: GestureDetector(
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              searchArgs['categoryTitle'].isNotEmpty
                                  ? 'CATEGORY'
                                  : 'Search results for:',
                              style:
                              const TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            const SizedBox(height: 2.0),
                            Text(
                              searchArgs['bookTitle'] ?? searchArgs['categoryTitle'],
                              softWrap: true,
                              textAlign: TextAlign.end,
                              style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          /// This builder is responsible for the build of the books grid if the data is ready
          FutureBuilder(
            future: Provider.of<Books>(context, listen: false)
                .getSearchedBookByArgs(searchArgs),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                Provider.of<Books>(context, listen: false)
                    .toggleTotalItemsCalculation(false);

                return BooksGrid(routeName: SpecificSearchScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }
}
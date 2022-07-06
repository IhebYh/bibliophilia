import 'package:bibliophilia/providers/books.dart';
import 'package:bibliophilia/providers/bookshelf.dart';
import 'package:bibliophilia/providers/categories.dart';
import 'package:bibliophilia/providers/categories_data_provider.dart';
import 'package:bibliophilia/screens/bookshelf_screen.dart';
import 'package:bibliophilia/screens/home_screen.dart';
import 'package:bibliophilia/screens/search_screen.dart';
import 'package:bibliophilia/screens/specific_search_screen.dart';
import 'package:bibliophilia/services/connectivity.dart';
import 'package:bibliophilia/services/connectivity_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(BooksApp());
}

class BooksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => Books(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => CategoriesData(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => Bookshelf(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => Categories(),
        ),
        StreamProvider<ConnectivityStatus>(
          create: (BuildContext context) =>
          ConnectivityService().connectionStatusController.stream,
          initialData : ConnectivityStatus.Offline,
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            bottomSheetTheme: BottomSheetThemeData(
                backgroundColor: Colors.black.withOpacity(0))),
        debugShowCheckedModeBanner: false,
        title: 'Books App',
        initialRoute: HomeScreen.routeName,
        routes: {
          SearchScreen.routeName: (context) => SearchScreen(),
          BookShelfScreen.routeName: (context) => BookShelfScreen(),
          SpecificSearchScreen.routeName: (context) => SpecificSearchScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
        },
      ),
    );
  }
}
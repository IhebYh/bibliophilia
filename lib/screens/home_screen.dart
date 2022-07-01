// Main Screen
import 'package:bibliophilia/providers/nyt.dart';
import 'package:bibliophilia/widgets/categories_widgets/categories_section.dart';
import 'package:bibliophilia/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  // Called when a dependency of this State object changes.
  void didChangeDependencies() {
    super.didChangeDependencies();
    getBooksData();
  }

  Future<void> getBooksData() async {
    await Provider.of<NYT>(context, listen: false).getCategoryList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: const Color(0xff770db0),
        onRefresh:() async {
          await getBooksData();
        },
        child:SingleChildScrollView(
          child: Column(
            children: const <Widget>[
              Header(),
              CategoriesSection(),
            ],
          )
        ),
      ),
    );
  }
}



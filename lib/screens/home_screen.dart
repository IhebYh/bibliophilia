/// Home Screen Widget
import 'dart:async';
import 'package:bibliophilia/providers/categories_data_provider.dart';
import 'package:bibliophilia/widgets/categories_widgets/categories_section.dart';
import 'package:bibliophilia/widgets/header.dart';
import 'package:bibliophilia/widgets/navbar.dart';
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
  // Called when this State object changes.
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    getBooksData();
  }

  Future<void> getBooksData() async {
    await Provider.of<CategoriesData>(context, listen: false).getCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: NavBar(HomeScreen.routeName),
      body: RefreshIndicator(
        color: Color(0xff0DB067),
        backgroundColor: Colors.white,
        displacement: 80,
        onRefresh: () async {
          await getBooksData();
        },
        child: Column(
          children: <Widget>[
            //Header(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    // Showcase(),
                    Container(child: CategoriesSection()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
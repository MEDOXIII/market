import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:market/Screen/shopCartScreen.dart';
import 'package:market/Widgets/searchWidget.dart';
import '../Widgets/appBarWidget.dart';
import '../Widgets/categoryWidget.dart';
import '../Widgets/zoomDrawerWidget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final _drawerController = ZoomDrawerController();

    return ZoomDrawerWidget(
      myController: _drawerController,
      screen: MaterialApp(
        home: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBarWidget(
              title: const Text(
                'Category',
                style: TextStyle(
                  color: Colors.cyan,
                ),
              ),
              child: SearchWidget(
                controller: searchTextController,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CategoryWidget(),
                  CategoryWidget(),
                  CategoryWidget(),
                  CategoryWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:market/Widgets/productWidget.dart';
import 'package:flutter_zoom_drawer/config.dart';
import '../Widgets/appBarWidget.dart';
import '../Widgets/offlineCheckerWidget.dart';
import '../Widgets/searchWidget.dart';
import '../Widgets/zoomDrawerWidget.dart';
import 'detailScreen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

TextEditingController searchTextController = TextEditingController();

class _ProductScreenState extends State<ProductScreen> {
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _drawerController = ZoomDrawerController();

    return OfflineCheckerWidget(
      body: ZoomDrawerWidget(
        myController: _drawerController,
        screen: MaterialApp(
          home: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBarWidget(
                title: const Text(
                  'Product',
                  style: TextStyle(
                    color: Colors.cyan,
                  ),
                ),
                child: SearchWidget(
                  controller: searchTextController,
                ),
              ),
              body: Container(
                padding: EdgeInsets.all(10),
                child: GridView(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.75,
                  ),
                  children: [
                    ProductWidget(
                      heroTag: 'image',
                      onClick: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            'image',
                          ),
                        ));
                      },
                    ),
                    ProductWidget(
                      heroTag: 'image1',
                      onClick: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            'image1',
                          ),
                        ));
                      },
                    ),
                    ProductWidget(
                      heroTag: 'image2',
                      onClick: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            'image2',
                          ),
                        ));
                      },
                    ),
                    ProductWidget(
                      heroTag: 'image3',
                      onClick: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            'image3',
                          ),
                        ));
                      },
                    ),
                    ProductWidget(
                      heroTag: 'image4',
                      onClick: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            'image4',
                          ),
                        ));
                      },
                    ),
                    ProductWidget(
                      heroTag: 'image5',
                      onClick: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            'image5',
                          ),
                        ));
                      },
                    ),
                    ProductWidget(
                      heroTag: 'image6',
                      onClick: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            'image6',
                          ),
                        ));
                      },
                    ),
                    ProductWidget(
                      heroTag: 'image7',
                      onClick: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            'image7',
                          ),
                        ));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:market/Widgets/navigationDrawer.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff0093d3),
            title: const Text(
              'SubCategory',
            ),
            centerTitle: true,
          ),
          drawer: NavigationDrawer(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed('/screen4'),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          child: Image.asset('assets/images/market.png'),
                        ),
                        Column(
                          children: [
                            Text(
                              'Name',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.cyan),
                            ),
                            Text(
                              'Price',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.cyan),
                            ),
                            Text(
                              'Discount',
                              style: TextStyle(fontSize: 8, color: Colors.cyan),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed('/screen4'),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          child: Image.asset('assets/images/market.png'),
                        ),
                        Column(
                          children: [
                            Text(
                              'Name',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.cyan),
                            ),
                            Text(
                              'Price',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.cyan),
                            ),
                            Text(
                              'Discount',
                              style: TextStyle(fontSize: 8, color: Colors.cyan),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed('/screen4'),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          child: Image.asset('assets/images/market.png'),
                        ),
                        Column(
                          children: [
                            Text(
                              'Name',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.cyan),
                            ),
                            Text(
                              'Price',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.cyan),
                            ),
                            Text(
                              'Discount',
                              style: TextStyle(fontSize: 8, color: Colors.cyan),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed('/screen4'),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          child: Image.asset('assets/images/market.png'),
                        ),
                        Column(
                          children: [
                            Text(
                              'Name',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.cyan),
                            ),
                            Text(
                              'Price',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.cyan),
                            ),
                            Text(
                              'Discount',
                              style: TextStyle(fontSize: 8, color: Colors.cyan),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

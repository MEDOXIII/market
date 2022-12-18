import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:market/Screen/internetConnectionScreen.dart';

class OfflineCheckerWidget extends StatelessWidget {
  final Widget body;
  const OfflineCheckerWidget({required this.body, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;

        if (connected) {
          return body;
        } else {
          return InternetConnectionScreen();
        }
      },
      child: MaterialApp(
        home: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}

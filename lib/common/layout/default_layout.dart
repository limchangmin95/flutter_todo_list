import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Color? backgroundColor;
  final Widget body;
  final Widget? floatingActionButton;
  final AppBar? appBar;

  const DefaultLayout({
    super.key,
    this.appBar,
    this.backgroundColor,
    this.floatingActionButton,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      body: body,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButton == null
          ? null
          : FloatingActionButtonLocation.centerFloat,
    );
  }
}

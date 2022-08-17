import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AqsahaSliverAppBar extends StatelessWidget {
  AqsahaSliverAppBar({
    Key? key, 
    required this.screensTitle, 
    required this.leading,
    this.children,
  }) : super(key: key);

  final String screensTitle;
  final Widget leading;
  // List of Widgets - will be specifed for each Screen
  List<Widget>? children = [];
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
          title: Text(
            screensTitle),
          titleTextStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          centerTitle: false,
          pinned: true,
          leading: leading,
          actions: children);
  }
}
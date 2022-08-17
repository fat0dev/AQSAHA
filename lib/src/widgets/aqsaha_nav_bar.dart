import 'package:flutter/material.dart';

class AqsahaNavBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

   const AqsahaNavBar({
    Key? key, 
    required this.icons, 
    this.selectedIndex = 0, 
    required this.onTap,
    }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: const EdgeInsets.all(0),
      indicator: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.transparent,
            width: 0
          )
        )
      ),
      tabs: icons.asMap()
      .map((i,e) => MapEntry(i, Tab(
        icon: Icon(
          e,
          color: i == selectedIndex 
          ? Colors.teal 
          : Colors.black45,
          size: 30.0,
        ),
        ),
        )).values.toList(),
      onTap: onTap,
      );
  }
}
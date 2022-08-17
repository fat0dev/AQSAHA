
import 'package:aqsaha/src/screens/screens.dart';
import 'package:aqsaha/src/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:aqsaha/src/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> screens = [
    HomeScreen(),
    const FeedScreen(),
    WriteScreen(),
    ChatsScreen(),
    NotificationScreen(),
  ];



  final List<IconData> _icons = [
    Icons.home,
    Icons.dynamic_feed_outlined,
    MdiIcons.pencilBoxOutline,
    MdiIcons.chatOutline,
    MdiIcons.bellOutline,
  ];
  int _selectedIndex = 0;



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: screens,
        ),
        bottomNavigationBar: AqsahaNavBar(
          icons: _icons,
          selectedIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          }
        ),
      ));
  }
}

class AqsahaAppBar extends StatelessWidget {
  final String title;

  const AqsahaAppBar({
    Key? key,
    required this.title
  }) : super(key: key);

  @override 
  Widget build(BuildContext context) {
  return AppBar(
        iconTheme: Theme.of(context).iconTheme,
        leadingWidth: 54,
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconBackground(
            icon: Icons.search,
            onTap: (){
              if(kDebugMode) { print("Search");}
            } 
          ),
        ),
        title: Text(title) ,
        titleTextStyle: const TextStyle(
          color: AqsahaColors.textLight
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8, top: 3),
            child: Avatar.medium(url: ''),
          )
        ],
      );
  }
}
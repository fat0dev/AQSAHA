
import 'package:aqsaha/src/screens/drawer/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:aqsaha/src/models/models.dart';
import '/src/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
 final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerScreen(),
      body: CustomScrollView(
        slivers: [
          AqsahaSliverAppBar(
            screensTitle: "Home",
          leading: AvatarButton(
            onTap: (){
                _scaffoldKey.currentState?.openDrawer();
            },
          )
          ),
        const SliverToBoxAdapter(
          child: Divider(height: 10.0, thickness: 0.5,),
        ),
        const SliverToBoxAdapter(
          child: CreatePostContainer()
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 6,
            (context, index){
          return Padding(
            padding: const EdgeInsets.only(bottom: 3),
            // child: PostContainer(post: post,),
          );
        },
        
        ))
        ]),
    );
  }

}

// appBar: AppBar(
//         actions: [
//           IconButton(onPressed: () async {
//             final prefs = await SharedPreferences.getInstance();
//             prefs.setBool('showHome', false);

//             Navigator.of(context).pushReplacement(
//               x(builder: (context) => OnBoardingScreen())
//             );
//           }, icon: Icon(Icons.logout))
//         ],
//       ),
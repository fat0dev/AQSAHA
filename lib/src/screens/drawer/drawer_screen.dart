import 'package:aqsaha/src/screens/drawer/about_aqsaha.dart';
import 'package:aqsaha/src/screens/screens.dart';
import 'package:aqsaha/src/theme/theme.dart';
import 'package:aqsaha/src/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(context),
          buildMenuItems(context)
        ],
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Container(
    padding: EdgeInsets.only(
      top:24 +  MediaQuery.of(context).padding.top,
    ),
    child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: (){
                // close the navigation drawer before
                Navigator.of(context).pop();
                // view information about Aqsaha app
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) =>  ProfileScreen(uid: ,)));
              },
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                     Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Avatar.large(url: 'assets/images/girl.jpg'),
                    ),
                    SizedBox(width: 5,),
                        Text(
                          "Aqsaha Platform",
                          style: TextStyle(
                              color: AqsahaColors.textHighLight,
                              fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
              
                  ],
                ),
              ),
            ),
  );

  Widget buildMenuItems(BuildContext context) => Container(
    padding: const EdgeInsets.all(10),
    child: Wrap(
      runSpacing: 16,  // vertical spacing
      children: [
        ListTile(
          leading: const Icon(MdiIcons.noteEditOutline),
          title: const Text('Drafts'),
          onTap: (){}
        ),

        ListTile(
          leading: const Icon(Icons.favorite_border),
          title: const Text('Favorites'),
          onTap: (){}
        ),
        ListTile(
          leading: const Icon(Icons.drafts_outlined),
          title: const Text('List'),
          onTap: (){}
        ),

        ListTile(
          leading: const Icon(MdiIcons.informationOutline),
          title: const Text('About'),
          onTap: (){
            // close the navigation drawer before
            Navigator.of(context).pop();
            // view information about Aqsaha app
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const  AboutAqsaha()));
          }
        ),
        // // uncomment this if you complete the onBoarding screen
        // const SizedBox(height: 20,),
        // ListTile(
        //   leading: const Icon(Icons.logout),
        //   title: const Text('Logout'),
        //   onTap: () async {
        //     final prefs = await SharedPreferences.getInstance();
        //     prefs.setBool('showHome', false);

        //     // ignore: use_build_context_synchronously
        //     Navigator.of(context).pushReplacement(MaterialPageRoute(
        //       builder: (context) => const OnBoardingScreen())
        //     );
        //   },
        // ),

      ],
    ),
  );
}
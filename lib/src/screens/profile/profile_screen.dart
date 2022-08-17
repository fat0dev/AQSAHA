import 'package:aqsaha/src/resourses/auth_methods.dart';
import 'package:aqsaha/src/resourses/firestore_methods.dart';
import 'package:aqsaha/src/screens/screens.dart';
import 'package:aqsaha/src/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final String uid;
  const ProfileScreen({
    Key? key,
    required this.uid}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var userData = {};
  int postLen = 0;
  int followers = 0;
  int following = 0;
  bool isFollowing = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .get();

      // get post lENGTH
      var postSnap = await FirebaseFirestore.instance
          .collection('posts')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();

      postLen = postSnap.docs.length;
      userData = userSnap.data()!;
      followers = userSnap.data()!['followers'].length;
      following = userSnap.data()!['following'].length;
      isFollowing = userSnap
          .data()!['followers']
          .contains(FirebaseAuth.instance.currentUser!.uid);
      setState(() {});
    } catch (e) {
      // showSnackBar(
      //   context,
      //   e.toString(),
      // );
    }
    setState(() {
      isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return isLoading ? const Center(child: CircularProgressIndicator(),) 
      : Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics()),
        children: [
          buildCoverImage(),
          buildProfile(),
          tabsContainer(size),
        ],
      ),
    );
  }

  Widget buildCoverImage() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.tealAccent.shade400,
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/aqsa_uni.jpg')
        ),
      ),
      // uncomment this if the profile screen doesn't have arrow button by default on some platforms
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const  EdgeInsets.only(top: 5, left: 5),
          child: IconButton(
            onPressed: (){
              // Here we simply close the profile screen
              Navigator.of(context).pop();
      },
            icon: Icon(
                Icons.arrow_back_ios_new_outlined,
            color: Theme.of(context).primaryColor,
            ),
          ),
          ),
      ),
    );
  }

  Widget buildProfile() {
    return Container(
      transform: Matrix4.translationValues(0.0, -40, 0.0),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 45,
                child: CircleAvatar(
                  radius: 43,
                  backgroundColor: Colors.grey.shade300,
                  backgroundImage: NetworkImage(
                              userData['photoUrl'],
                            ),
                ),
              ),
              Row(
                children: [
                  
                  ElevatedButton.icon(
                    onPressed: (){}, 
                    icon: const Icon(Icons.person_add_alt),
                    label: const Text("follow"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith((color) => Colors.tealAccent),
                    ),
                    ),
                ],
              )
            ],
          ),
          const SizedBox(height: 10,),
          const Text(
            "Aqsaha Platform",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3,),
          Text(
           userData['username'],
            style: const TextStyle(fontSize: 13),
          ),
           const SizedBox(height: 15,),
          Text(
             userData['bio'],
             style: const TextStyle(
               fontSize: 15
             ),
             ),
             const SizedBox(height: 10,),
           Row(
             children: const [
               Text(
                 "Software Engineer"
               ),
                Icon(Icons.calendar_today,
               size: 12,
               ),
                Text(
                 " Joined July 2022",
                 style: TextStyle(fontSize: 12),
               )
             ],
           ),
           const SizedBox(height: 5,),
           Row(
             children: [
              buildStatColumn(followers, "followers"),
               Text(" • ", style: TextStyle(
                 color: Colors.grey.shade600,
                 fontSize: 12.0,
               ),),
               buildStatColumn(following, "following"),
               Row(
                    mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FirebaseAuth.instance.currentUser!.uid ==
                                            widget.uid
                                        ? FollowButton(
                                            text: 'Sign Out',
                                            backgroundColor:
                                                Theme.of(context).backgroundColor,
                                            textColor: Theme.of(context).primaryColor,
                                            borderColor: Colors.grey,
                                            function: () async {
                                              await AuthMethods().signOut();
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const LoginScreen(),
                                                ),
                                              );
                                            },
                                          )
                                        : isFollowing
                                            ? FollowButton(
                                                text: 'Unfollow',
                                                backgroundColor: Colors.white,
                                                textColor: Colors.black,
                                                borderColor: Colors.grey,
                                                function: () async {
                                                  await FireStoreMethods()
                                                      .followUser(
                                                    FirebaseAuth.instance
                                                        .currentUser!.uid,
                                                    userData['uid'],
                                                  );

                                                  setState(() {
                                                    isFollowing = false;
                                                    followers--;
                                                  });
                                                },
                                              )
                                            : FollowButton(
                                                text: 'Follow',
                                                backgroundColor: Colors.blue,
                                                textColor: Colors.white,
                                                borderColor: Colors.blue,
                                                function: () async {
                                                  await FireStoreMethods()
                                                      .followUser(
                                                    FirebaseAuth.instance
                                                        .currentUser!.uid,
                                                    userData['uid'],
                                                  );

                                                  setState(() {
                                                    isFollowing = true;
                                                    followers++;
                                                  });
                                                },
                                              )
                                  ],
                                ),
             ],
           ),
           const Divider(),
        ],
      ),
    );
  }



  Widget tabsContainer(Size size){
    return Stack(
      children: [
        SizedBox(
          height: size.height * 1.55,
          width: double.infinity,
          child: buildTabs(size),
        )
      ],
    );
  }
  Widget buildTabs(Size size) {
    int selectedIndex = 0;
    List<Tab> tabs = const [
      Tab(child: Text("About"),),
      Tab(child: Text("Posts"),),
      Tab(child: Text("Answers"),),
      Tab(child: Text("Questions"),),
      Tab(child: Text("Flollowers"),),
      Tab(child: Text("Following"),),
      Tab(child: Text("Questions"),),
    ];
    List<Widget> screens = [
      buildAboutProfile(),
      postsProfile(),
      const Text("Answers"),
      const Text("Questions"),
      const Text("Flollowers"),
      const Text("Following"),
      const Text("Questions"),
    ];
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: size * 0.95,
              child: TabBar(
                unselectedLabelColor: Colors.black,
                indicatorColor: Colors.teal,
                labelColor: Colors.teal,
                isScrollable: true,
                tabs: tabs,
                onTap: (index){
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
            ),
          body: IndexedStack(
          index: selectedIndex,
          children: screens,
        ),
        ),
         );
  }

  Widget buildAboutProfile() {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "About"
            ),
          )
        ],
      ),
    );
  }
   

  Column buildStatColumn(int num, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          num.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }


  Widget postsProfile(){
    return FutureBuilder(
             future: FirebaseFirestore.instance
             .collection('posts')
             .where('uid', isEqualTo: widget.uid)
             .get(),
             builder: (context, snapshot) {
               if (snapshot.connectionState == ConnectionState.waiting) {
                 return const Center(
                   child: CircularProgressIndicator(),
                   );
                    }

                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: (snapshot.data! as dynamic).docs.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 1.5,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) {
                        DocumentSnapshot snap =
                            (snapshot.data! as dynamic).docs[index];

                        return Image(
                          image: NetworkImage(snap['postUrl']),
                          fit: BoxFit.cover,
                        );
                      },
                    );
                  },
    );
  }

  
}


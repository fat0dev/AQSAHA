
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../screens.dart';




class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      padding: const EdgeInsets.only(bottom: 80),
      child: PageView(
        controller: controller,
        onPageChanged: (index){
          setState(() => isLastPage = index == 2);
        },
        children: [
          BuildScreenWidget(
            color: Colors.grey.shade200,
            image: "assets/images/aqsa_uni.jpg",
            title: "Aqsaha Platform",
            subTitle: "The power of technology is in your pocket \n collage stuff are easier to reach",

          ),
          Container(
            color: Colors.indigo,
            child: Text("Page 2"),
          ),
          Container(
            color: Colors.green,
            child: Text("Page 3"),
          ),
        ],
      ),
    ),
    bottomSheet: isLastPage 
    ? TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        primary: Colors.white,
        backgroundColor: Colors.teal.shade700,
        minimumSize: const Size.fromHeight(80)
      ),
        child: const Text(
          "Get Started",
          style: TextStyle(fontSize: 24),
        ),
        onPressed: () async {

          final prefs = await SharedPreferences.getInstance();
          prefs.setBool('showHome', true);
          if (!mounted) {}
           Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: ((context) => HomeScreen())
            ));
        },
      ) 
    : Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () => controller.jumpToPage(2),
            child: const Text("SKIP"),
          ),
          Center(
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: WormEffect(
                spacing: 16,
                dotColor: Colors.black26,
                activeDotColor: Colors.teal.shade700,
              ),
              onDotClicked: (index) => controller.animateToPage(
                index, 
                duration: const Duration(microseconds: 500), 
                curve: Curves.easeInOut), 
              ),
            ),
          TextButton(
            onPressed: () => controller.nextPage(
              duration: const Duration(microseconds: 500), 
              curve: Curves.easeInOut),
            child: const Text("NEXT"),
          ),
        ],
      ),
    ),
  );
}


class BuildScreenWidget extends StatelessWidget {
  final Color color;
  final String image;
  final String title;
  final String subTitle;
  const BuildScreenWidget({
    Key? key, 
    required this.color, 
    required this.image, 
    required this.title, 
    required this.subTitle,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    color: color,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.flutter_dash,
          size: 100,
          color: Colors.teal,
        ),
        // Image.asset(
        //   image,
        //   fit: BoxFit.cover,
        //   width: double.infinity,
        //   ),
        const SizedBox(height: 64),
        Text(
          title,
          style: TextStyle(
            color: Colors.teal.shade700,
            fontSize: 32,
            fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            subTitle,
            style: TextStyle(
              color: Colors.teal.shade300,
              fontSize: 16,
              fontWeight: FontWeight.w100,
              letterSpacing: 2.0
            ),
          ),
        ),
      ],
    ),
  );
  }

}
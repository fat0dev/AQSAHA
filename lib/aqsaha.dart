import 'package:aqsaha/src/providers/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/resposive/mobile_screen_layout.dart';
import 'src/resposive/resposive_layout.dart';
import 'src/resposive/web_screen_layout.dart';
import 'src/screens/screens.dart';
import 'src/theme/theme.dart';

class Aqsaha extends StatelessWidget {
  final bool showHome;
  final AqsahaTheme aqsahaTheme;
  const Aqsaha({
    Key? key,
    required this.aqsahaTheme,
    required this.showHome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: aqsahaTheme.light,
        darkTheme: aqsahaTheme.dark,
        themeMode: ThemeMode.light,
        title: 'Aqsaha Platform',
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              // Checking if the snapshot has any data or not
              if (snapshot.hasData) {
                // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
                return const ResponsiveLayout(
                  mobileScreenLayout: MobileScreenLayout(),
                  webScreenLayout: WebScreenLayout(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }

            // means connection to future hasnt been made yet
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return const LoginScreen();
          },
        ),
      ),
    );
  }
}
import 'package:d_session/d_session.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_firebase_3/pages/detail_page.dart';
import 'package:learn_firebase_3/pages/discover.dart';
import 'package:learn_firebase_3/pages/signin_page.dart';
import 'package:learn_firebase_3/pages/signup_page.dart';
import 'package:learn_firebase_3/splash.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0XFFEFEFF0),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: FutureBuilder(
        future: DSession.getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.data == null) return SplashScreen();
          return Scaffold();
        },
      ),
      routes: {
        '/discover': (context) => const DiscoverPage(),
        '/signup': (context) => const SignupPage(),
        'signin': (context) => const SigninPage(),
        '/detail': (context) {
          final bikeId = ModalRoute.of(context)!.settings.arguments;
          if (bikeId is String) return DetailPage(bikeId: bikeId);
          return const Scaffold();
        }
      },
    );
  }
}

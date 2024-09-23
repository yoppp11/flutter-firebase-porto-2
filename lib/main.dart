import 'package:d_session/d_session.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_firebase_3/models/bike.dart';
import 'package:learn_firebase_3/pages/booking_page.dart';
import 'package:learn_firebase_3/pages/chatting_page.dart';
import 'package:learn_firebase_3/pages/checkout_page.dart';
import 'package:learn_firebase_3/pages/detail_page.dart';
import 'package:learn_firebase_3/pages/discover.dart';
import 'package:learn_firebase_3/pages/pin_page.dart';
import 'package:learn_firebase_3/pages/signin_page.dart';
import 'package:learn_firebase_3/pages/signup_page.dart';
import 'package:learn_firebase_3/pages/success_booking_page.dart';
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
        '/signin': (context) => const SigninPage(),
        '/detail': (context) {
          final bikeId = ModalRoute.of(context)!.settings.arguments;
          if (bikeId is String) return DetailPage(bikeId: bikeId);
          return const Scaffold();
        },
        '/booking': (context) {
          final bike = ModalRoute.of(context)!.settings.arguments;
          if (bike is Bike) return BookingPage(bike: bike);
          return const Scaffold();
        },
        '/checkout': (context) {
          Map data = ModalRoute.of(context)!.settings.arguments as Map;
          Bike bike = data['bike'];
          String startDate = data['start_date'];
          String endDate = data['end_date'];
          return CheckoutPage(
            bike: bike,
            startDate: startDate,
            endDate: endDate,
          );
        },
        '/pin': (context) {
          Bike bike = ModalRoute.of(context)!.settings.arguments as Bike;
          return PinPage(bike: bike);
        },
        '/success-booking': (context) {
          Bike bike = ModalRoute.of(context)!.settings.arguments as Bike;
          return SuccessBookingPage(
            bike: bike,
          );
        },
        '/chatting': (context) {
          Map data = ModalRoute.of(context)!.settings.arguments as Map;
          String uid = data['uid'];
          String userName = data['userName'];
          return ChattingPage(
            uid: uid,
            userName: userName,
          );
        }
      },
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/admin_login.dart';
import 'package:flutter_application_1/pages/bottomnav.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/pages/onboard.dart';
import 'package:flutter_application_1/pages/signup.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/widget/app_constant.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // Stripe.publishableKey = publishableKey;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  // FirebaseAuth.instance.authStateChanges().listen((User?user){
  //   if(user == null){
  //     runApp(const Onboard());
  //   }
  //   else{
  //     runApp(const BottomNav());
  //   }
  // });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: const AdminLogin(),
    );
  }
}


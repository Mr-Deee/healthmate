import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:healthmate/Screens/Homepage.dart';
import 'package:healthmate/Screens/postdrug.dart';
import 'package:provider/provider.dart';

import 'Models/Users.dart';
import 'Screens/login.dart';
import 'Screens/signup.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
  //
      MultiProvider(providers: [
    // ChangeNotifierProvider<DatabaseService1>(
    //   create: (context) => DatabaseService1(),
    // ),
    ChangeNotifierProvider<Users>(
      create: (context) => Users(),
     ),
    // ChangeNotifierProvider<GasStation>(
    //   create: (context) => GasStation(),
    // ),
  //
  //   //
  //   //
  //   //

     ], child:
      MyApp()
  )
  );
}

DatabaseReference Usersdb = FirebaseDatabase.instance.ref().child("Users");

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HealthMate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(


        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
        initialRoute: FirebaseAuth.instance.currentUser == null
            ? '/login'
            : '/Homepage',
        routes: {

          // "/splash": (context) => SplashScreen(),
          "/login": (context) => LoginScreen(),
          "/postdrug": (context) => postdrug(),
          // "/search": (context) => SearchScreen(),
          "/SignUp": (context) => SignUpScreen(),
        "/Homepage": (context) =>homepage(),
          // "/deactivatedusers": (context) =>deactivatedusers(),
        });


  }



}



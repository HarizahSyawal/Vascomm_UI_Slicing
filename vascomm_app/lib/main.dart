import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vascomm_app/pages/home/main_page.dart';
import 'package:vascomm_app/pages/sign_in_page.dart';
import 'package:vascomm_app/pages/sign_up_page.dart';
import 'package:vascomm_app/pages/splash_page.dart';
import 'package:vascomm_app/providers/auth_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/main': (context) => MainPage(),
        },
      ),
    );
  }
}

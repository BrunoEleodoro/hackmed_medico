import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackmed_medico/pages/home.dart';
import 'package:hackmed_medico/pages/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
        title: 'HackMed Medico',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
            body1: GoogleFonts.montserrat(textStyle: textTheme.body1),
          ),
        ),
        debugShowCheckedModeBanner: false,
        // home: LoginPage(),
        home: HomePage());
  }
}

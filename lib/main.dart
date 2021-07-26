
import 'package:biz_card/Quiz.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'list_view_builder.dart';
import 'login_page_ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.ptSerifTextTheme(Theme.of(context).textTheme),
          //visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: ListViewOfMovies(),
      );
}

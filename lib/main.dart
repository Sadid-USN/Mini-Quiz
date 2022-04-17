import 'package:biz_card/Quiz.dart';
import 'package:biz_card/models/json_map_parsing.dart';
import 'package:biz_card/models/json_parsing.dart';
import 'package:biz_card/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'list_view_of_movies.dart';
import 'models/flash_card.dart';

//final ThemeData? _appTheme = _buildAppTheme();

ThemeData? _buildAppTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    primaryColor: primeryBrown200,
    scaffoldBackgroundColor: secondaryBackgroundWhite,
    cardColor: secondaryBrownLight,
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: primeryBrownLight))),
    textTheme: GoogleFonts.ptSerifTextTheme(),
  );
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: _buildAppTheme(),
        // ThemeData(

        //   brightness: Brightness.dark,
        //   textTheme: GoogleFonts.ptSerifTextTheme(Theme.of(context).textTheme),
        //   //visualDensity: VisualDensity.adaptivePlatformDensity,
        // ),
        debugShowCheckedModeBanner: false,
        home: ListViewOfMovies(),
      );
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guess_o_rama/screens/home_screen.dart';

var kGreen = const Color.fromARGB(255, 64, 200, 92);
var kPurple = const Color.fromARGB(255, 142, 46, 243);

var kColorScheme = ColorScheme.light(
  primary: kPurple,
  secondary: kGreen,
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Guess-O-RAMA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: kColorScheme.primary,
          ),
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: Colors.grey[500],
        ),
        textTheme: GoogleFonts.montserratTextTheme().copyWith(
          // used for main play btn text in home screen
          displayLarge: GoogleFonts.montserrat(
            fontWeight: FontWeight.w900,
            color: Colors.white,
            letterSpacing: 5,
            fontSize: 20,
          ),
          // used for the btns text in the loading, playing, results, choose-max-guess screen
          displayMedium: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 15,
          ),
          // user for top text in the loading, playing, results screen
          bodyLarge: GoogleFonts.luckiestGuy(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 30,
          ),
          // user for normal text in the loading, playing screen, choose-max-guess screen
          bodyMedium: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 15,
          ),
          // used for the default text in the field form in the playing screen
          labelSmall: GoogleFonts.luckiestGuy(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            letterSpacing: 3,
            fontSize: 10,
          ),
          // used for the number when you enter into the field form in the playing, choose-max-guess screen
          labelMedium: GoogleFonts.luckiestGuy(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            letterSpacing: 2,
            fontSize: 20,
          ),
        ),
      ),
      themeMode: ThemeMode.light,
      home: const HomeScreen(),
    );
  }
}

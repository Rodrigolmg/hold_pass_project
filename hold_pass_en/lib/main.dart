import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hold_pass_en/presentation/pages/splash.dart';
import 'package:hold_pass_en/presentation/provider/pass_provider.dart';
import 'package:provider/provider.dart';
import 'inject_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  di.init();

  runApp(
    ChangeNotifierProvider(
      create: (context) => PassProvider(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ThemeData().colorScheme.copyWith(
          primary: Colors.orangeAccent
        )
      ),
      home: const Splash(),
    );
  }
}

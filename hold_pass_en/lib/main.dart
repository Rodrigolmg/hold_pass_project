import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hold_pass_en/presentation/bloc/home/home_bloc.dart';
import 'package:hold_pass_en/presentation/bloc/password/password_bloc.dart';
import 'package:hold_pass_en/presentation/pages/splash.dart';
import 'inject_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  di.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<PasswordBloc>(
          create: (c) => PasswordBloc()
        ),
        BlocProvider<HomeBloc>(
          create: (c) => HomeBloc()
        ),
      ],
      child: const MyApp()
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

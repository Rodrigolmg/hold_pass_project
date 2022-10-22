import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hold_pass_en/presentation/bloc/home/home_bloc.dart';
import 'package:hold_pass_en/presentation/bloc/password/information/pass_information_bloc.dart';
import 'package:hold_pass_en/presentation/bloc/password/register/pass_register_bloc.dart';
import 'package:hold_pass_en/presentation/pages/splash.dart';
import 'inject_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  di.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<PassInformationBloc>(
          create: (c) => PassInformationBloc()
        ),
        BlocProvider<PassRegisterBloc>(
          create: (c) => PassRegisterBloc()
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

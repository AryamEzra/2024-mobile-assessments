import 'package:assessment/core/routes/routes.dart';
import 'package:assessment/features/groceries/presentation/bloc/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = GoogleFonts.poppinsTextTheme();

    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) {
            final bloc = getIt<HomeBloc>();
            bloc.add(FetchGroceries());
            return bloc;
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: textTheme, // Apply the common text theme to the light theme
        ),
        title: 'Product App',
        initialRoute: Routes.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
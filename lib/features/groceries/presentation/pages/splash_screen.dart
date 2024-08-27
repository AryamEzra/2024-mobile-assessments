import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/pancakes.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay gradient
          // Container(
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       colors: [
          //         const Color.fromARGB(255, 25, 78, 239).withOpacity(0.9),
          //         const Color.fromARGB(255, 54, 104, 255).withOpacity(0.4),
          //       ],
          //       begin: Alignment.bottomCenter,
          //       end: Alignment.topCenter,
          //     ),
          //   ),
          // ),
          // Logo and text
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 25), // Add a Spacer to push the content down
                Container(
                  child: Text(
                    'Welcome to',
                    style: GoogleFonts.roboto(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      height: 1.04,
                      letterSpacing: 2.25,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'SPEEDY CHOW',
                  textAlign: TextAlign.center, // Center align the text
                  style: GoogleFonts.roboto(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    height: 1.04, // Calculated line height
                    letterSpacing: 0.72, // Calculated letter spacing
                  ),
                ),
                Spacer(flex: 3), // Add another Spacer to balance the layout
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final Function(String) onChanged;

  const CustomSearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        cursorColor: const Color.fromARGB(136, 92, 85, 85),
        decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle: const TextStyle(
            color: Color.fromARGB(136, 92, 85, 85), // Set the color of the hint text
            fontSize: 16.0, // Set the font size of the hint text
          ),
          prefixIcon: const IconTheme(
            data: IconThemeData(
                color: Color.fromARGB(
                    137, 174, 163, 163)), // Set color for prefix icon
            child: Icon(Icons.search),
          ),
          suffixIcon: const IconTheme(
            data:
                IconThemeData(color: Color.fromARGB(255, 47, 45, 45)), // Set color for suffix icon
            child: Icon(Icons.tune_rounded),
          ),
          filled: true, // Enable background color
          fillColor: const Color.fromRGBO(
              233, 234, 235, 1), // Set background color to gray
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(20.0), // Set more rounded borders
            borderSide: BorderSide.none, // Remove the border
          ), // Remove the border
        ), // Center align the search word
        onChanged: onChanged,
      ),
    );
  }
}

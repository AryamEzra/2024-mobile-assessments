import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final Function(String) onChanged;

  const CustomSearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle: TextStyle(
            color: const Color.fromARGB(
                137, 174, 163, 163), // Set the color of the hint text
            fontSize: 16.0, // Set the font size of the hint text
          ),
          prefixIcon: IconTheme(
            data: IconThemeData(
                color: const Color.fromARGB(
                    137, 174, 163, 163)), // Set color for prefix icon
            child: const Icon(Icons.search),
          ),
          suffixIcon: IconTheme(
            data:
                IconThemeData(color: Colors.black), // Set color for suffix icon
            child: const Icon(Icons.tune_rounded),
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

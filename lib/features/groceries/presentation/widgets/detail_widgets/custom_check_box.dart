import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool?>? onChanged;

  const CustomCheckbox({
    super.key,
    this.initialValue = false,
    this.onChanged,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool? _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  void _handleChanged(bool? value) {
    setState(() {
      _value = value;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _value,
      onChanged: _handleChanged,
      activeColor: Color.fromRGBO(255, 99, 71, 1),
      shape: RoundedRectangleBorder(
        
        borderRadius: BorderRadius.circular(5.0), 
      ),
    );
  }
}
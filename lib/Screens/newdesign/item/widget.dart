import 'package:flutter/material.dart';
import 'package:yourdress/core/constant/color.dart';

class CustomDropdownButton extends StatefulWidget {
  final String value;
  final List<String> items;
  final Function(String ?) onChanged ;

  CustomDropdownButton({
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
    
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: widget.value,
            onChanged: widget.onChanged,
            items: widget.items.map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
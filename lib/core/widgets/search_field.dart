import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key, this.onChanged});

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(onChanged: onChanged);
  }
}

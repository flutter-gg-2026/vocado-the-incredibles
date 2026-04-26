import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final TextEditingController controller;
  final bool? readOnly;
  const CustomTextField({
    super.key,
    this.label,
    required this.controller,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        if (label != null) Text(label!),
        TextFormField(
          onTapOutside: (event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          controller: controller,
          validator: (value) => value != null ? null : value,
          readOnly: readOnly ?? false,
        ),
      ],
    );
  }
}

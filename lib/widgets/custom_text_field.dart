import 'package:flutter/material.dart';
import 'package:shop_app/styles/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.textController,
    required this.validator,
    required this.hidden,
  });
  final String hintText;
  final TextEditingController textController;
  final String? Function(String?)? validator;
  final bool hidden;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.hidden,
      validator: widget.validator,
      controller: widget.textController,
      decoration: InputDecoration(
        hint: Text(widget.hintText),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

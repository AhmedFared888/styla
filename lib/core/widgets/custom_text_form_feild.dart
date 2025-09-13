import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.textEditingController,
    required this.hintText,
    this.labelText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.prefixIcon,
  });

  final TextEditingController? textEditingController;
  final String hintText;
  final String? labelText;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      controller: widget.textEditingController,
      obscureText: widget.isPassword ? _obscureText : false,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                onPressed: () {
                  setState(() => _obscureText = !_obscureText);
                },
              )
            : null,
        //errorText: StringsManager.passwordError,
      ),
    );
  }
}

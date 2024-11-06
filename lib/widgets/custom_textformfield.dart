import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obsecuretxt;
  final Widget? suffixicn;
  final String fieldname;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.icon,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.controller,
    this.validator,
    this.obsecuretxt = false,
    this.suffixicn,
    required this.fieldname,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              fieldname,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
        const SizedBox(height: 5),
        TextFormField(
          textInputAction: textInputAction,
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: suffixicn,
            prefixIcon: Icon(icon, color: const Color(0xff5563AA)),
            hintText: hintText,
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff5563AA)),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          obscureText: obsecuretxt,
          validator: validator,
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}

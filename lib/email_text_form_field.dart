import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class TextFormFieldSettings extends StatelessWidget {
  TextFormFieldSettings({super.key, required this.textEditingController});
  TextEditingController textEditingController;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        cursorColor: Colors.black,
        controller: textEditingController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          suffixIcon: const Icon(Icons.person),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.blueAccent,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
          hintText: 'Email Address',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your Email.';
          } else if (!EmailValidator.validate(textEditingController.text)) {
            return 'Please enter your Email correctly';
          } else {
            return null;
          }
        },
      ),
    );
  }
}

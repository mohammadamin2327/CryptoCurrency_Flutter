import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  final TextEditingController textEditingController;
  final bool visibilityPassword;
  final formKey;
  const PasswordTextFormField(
      {super.key,
      required this.textEditingController,
      required this.visibilityPassword,
      this.formKey});

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  @override
  Widget build(BuildContext context) {
    final _formKey = widget.formKey;
    bool visibilityPassword = widget.visibilityPassword;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: _formKey,
        child: TextFormField(
          cursorColor: Colors.black,
          obscureText: visibilityPassword,
          obscuringCharacter: '•',
          controller: widget.textEditingController,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
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
            suffixIcon: IconButton(
              onPressed: () {
                setState(
                  () {
                    visibilityPassword == true
                        ? visibilityPassword = false
                        : visibilityPassword = true;
                  },
                );
              },
              icon: visibilityPassword == true
                  ? const Icon(
                      Icons.visibility_off,
                    )
                  : const Icon(
                      Icons.visibility,
                    ),
            ),
            hintText: 'Password',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            } else if (value.length < 6) {
              return 'Your password must be 6 digits or more.';
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }
}

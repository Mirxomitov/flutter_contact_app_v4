import 'package:flutter/material.dart';

// how to set default value to text field

Widget textField({
  required String hintText,
  required TextEditingController fieldController,
  String defValue = '',
  TextInputType inputType = TextInputType.name,
}) {
  fieldController.text = defValue;

  return TextField(
    controller: fieldController,
    keyboardType: inputType,
    decoration: InputDecoration(
      border: const OutlineInputBorder(),
      hintText: hintText,
      suffixIcon: IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => fieldController.clear(),
      ),
      suffixIconColor: Colors.grey,
    ),
  );
}

Widget textFieldWithEye({
  required String hintText,
  required TextEditingController fieldController,
  required bool isEyeVisible,
  required String defValue,
  required TextInputType inputType,
  required VoidCallback onPressed,
}) {
  fieldController.text = defValue;

  return TextField(
    controller: fieldController,
    obscureText: !isEyeVisible,
    keyboardType: inputType,
    decoration: InputDecoration(
      border: const OutlineInputBorder(),
      hintText: hintText,
      suffixIcon: IconButton(
        icon: isEyeVisible ? const Icon(Icons.remove_red_eye) : const Icon(Icons.visibility_off),
        onPressed: onPressed,
      ),
      suffixIconColor: Colors.grey,
    ),
  );
}

Widget button({
  required BuildContext context,
  required String text,
  required void Function() onPressed,
  bool isEnabled = true,
}) =>
    GestureDetector(
      onTap: () {
        if (isEnabled) onPressed();
      },
      child: Container(
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isEnabled ? Theme.of(context).colorScheme.primary : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(text, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white)),
      ),
    );

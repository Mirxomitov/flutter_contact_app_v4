import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController fieldController;
  const PhoneField({super.key, required this.fieldController});

  @override
  Widget build(BuildContext context) {
    var maskFormatter = MaskTextInputFormatter(mask: '+998 (##) ###-##-##', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.eager);

    return TextField(
      controller: fieldController,
      inputFormatters: [maskFormatter],
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: 'Phone',
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => fieldController.clear(),
        ),
        suffixIconColor: Colors.grey,
      ),
    );
  }
}

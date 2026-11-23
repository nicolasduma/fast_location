import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fast_location/src/shared/metrics.dart';

class FormComponent extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final FormFieldValidator<String> validateCep;
  final Future<void> Function(String) submit;

  FormComponent({super.key, required this.validateCep, required this.submit});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "CEP (somente dígitos)",
              border: OutlineInputBorder(),
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            maxLength: 8,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            validator: validateCep,
          ),
          const SizedBox(height: Metrics.itemSpacing, width: 1.0),
          ElevatedButton(
            onPressed: () async {
              final formState = _formKey.currentState;
              if (formState != null && formState.validate()) {
                await submit(formState.fields.first.value);
              }
            },
            child: Text("Consultar"),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CreateFailureDialog extends StatelessWidget {
  const CreateFailureDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Account Creation Failed'),
      content: const Text('Password do no match or account alrady exists'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    );
  }
}

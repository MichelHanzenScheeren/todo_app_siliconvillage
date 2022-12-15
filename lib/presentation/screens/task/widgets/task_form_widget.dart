import 'package:flutter/material.dart';

class TaskFormWidget extends StatelessWidget {
  final String initialValue;
  final String labelText;
  final TextStyle style;
  final int maxLines;
  final void Function(String?)? onSaved;

  const TaskFormWidget(
      {Key? key,
      this.initialValue = '',
      this.labelText = '',
      this.style = const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      this.maxLines = 1,
      this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.all(10),
          child: TextFormField(
            onSaved: onSaved,
            maxLines: maxLines,
            style: style,
            initialValue: initialValue,
            decoration: InputDecoration(
              labelText: labelText,
              contentPadding: const EdgeInsets.all(5),
              border: const UnderlineInputBorder(borderSide: BorderSide()),
            ),
          ),
        ),
      ],
    );
  }
}

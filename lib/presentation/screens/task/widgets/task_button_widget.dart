import 'package:flutter/material.dart';

class TaskButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  const TaskButtonWidget({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: onPressed,
                child: const Text('Salvar'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

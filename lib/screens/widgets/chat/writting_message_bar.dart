import 'package:flutter/material.dart';

class WrittingMessageBar extends StatelessWidget {
  const WrittingMessageBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              maxLines: null,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          const Icon(Icons.send_rounded)
        ],
      ),
    );
  }
}

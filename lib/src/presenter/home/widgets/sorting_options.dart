import 'package:flutter/material.dart';

class SortingOptions extends StatelessWidget {
  final List<String> sortingOptions;
  final String currentValue;
  final Function(String) callback;

  const SortingOptions({
    super.key,
    required this.sortingOptions,
    required this.currentValue,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        DropdownButton<String>(
          value: currentValue,
          icon: const Icon(Icons.sort),
          onChanged: (value) {
            callback(value!);
          },
          items: sortingOptions.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 2.0,
                ),
                child: Text(value),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

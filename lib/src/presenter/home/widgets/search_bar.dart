import 'package:flutter/material.dart';
import 'package:gamebox/main.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  const SearchBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(32),
        ),
        child: TextField(
          controller: controller,
          onSubmitted: (term) => controller.text = term,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: AppLocalizations.of(context)!.searchBarHint,
            hintStyle: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 12,
              fontStyle: FontStyle.italic,
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.black45,
            ),
            suffixIcon: Visibility(
              visible: controller.text.isNotEmpty,
              child: IconButton(
                onPressed: () => controller.clear(),
                enableFeedback: false,
                iconSize: 16,
                icon: Icon(
                  Icons.cancel,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

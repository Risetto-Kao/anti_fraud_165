import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Function onChanged;
  const SearchField(
      {super.key,
      this.hintText = "",
      required this.controller,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
            labelText: "Search",
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade400),
            prefixIcon: const Icon(Icons.search),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        controller: controller,
        onChanged: (value) => onChanged(value),
      ),
    );
  }
}

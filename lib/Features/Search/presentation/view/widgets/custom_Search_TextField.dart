// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: camel_case_types
class customSearchTextField extends StatelessWidget {
  const customSearchTextField(
      {super.key, this.controller, this.onChanged, this.onPressesd});
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function()? onPressesd;
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: 'Search for books',
            hintStyle: const TextStyle(fontSize: 16),
            suffixIcon: IconButton(
                onPressed: onPressesd, icon: const Icon(Icons.close)),
            prefixIcon: IconButton(
                onPressed: onPressesd,
                icon: const Opacity(
                  opacity: .8,
                  child: Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: 24,
                  ),
                )),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(12)))));
  }
}

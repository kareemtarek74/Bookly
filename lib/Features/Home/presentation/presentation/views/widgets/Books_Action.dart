import 'package:bookly/Features/Home/Data/models/book_model/item.dart';
import 'package:bookly/core/utils/Function/launch_url.dart';
import 'package:bookly/core/utils/widgets/custom_Button.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.book});
  final Item book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: customButton(
              onPressed: () {},
              text: ' Free',
              textColor: Colors.black,
              backgroundColor: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16)),
            ),
          ),
          Expanded(
            child: customButton(
              onPressed: () {
                customLaunchUrl(context, book.volumeInfo!.previewLink);
              },
              text: 'Free preview',
              textColor: Colors.white,
              fontSize: 16,
              backgroundColor: const Color(0xffEF8262),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
            ),
          )
        ],
      ),
    );
  }
}

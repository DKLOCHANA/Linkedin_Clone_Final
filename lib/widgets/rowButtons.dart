import 'package:flutter/material.dart';
import 'package:linkedin/widgets/columnSingleButton.dart';

class RowButtons extends StatelessWidget {
  const RowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            child: ColumnSingleButton(
                name: 'Like',
                iconImage: ("assets/icons/like_icon_white.png"),
                color: Color(0xFF666666)),
          ),
          InkWell(
            child: ColumnSingleButton(
                name: 'Comment',
                iconImage: ("assets/icons/comment_icon.png"),
                color: Color(0xFF666666)),
          ),
          InkWell(
            child: ColumnSingleButton(
                name: 'Repost',
                iconImage: ("assets/icons/repost.png"),
                color: Color(0xFF666666)),
          ),
          InkWell(
            child: ColumnSingleButton(
                name: 'send',
                iconImage: ("assets/icons/sent_icon.png"),
                color: Color(0xFF666666)),
          ),
        ],
      ),
    );
  }
}

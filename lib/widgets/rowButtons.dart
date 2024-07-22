import 'package:flutter/material.dart';
import 'package:linkedin/widgets/columnSingleButton.dart';

Widget rowButtons() {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          child: columnSingleButton(
              name: 'Like',
              iconImage: ("assets/icons/like_icon_white.png"),
              color: Color(0xFF666666)),
        ),
        InkWell(
          child: columnSingleButton(
              name: 'Comment',
              iconImage: ("assets/icons/comment_icon.png"),
              color: Color(0xFF666666)),
        ),
        InkWell(
          child: columnSingleButton(
              name: 'Repost',
              iconImage: ("assets/icons/repost.png"),
              color: Color(0xFF666666)),
        ),
        InkWell(
          child: columnSingleButton(
              name: 'send',
              iconImage: ("assets/icons/sent_icon.png"),
              color: Color(0xFF666666)),
        ),
      ],
    ),
  );
}

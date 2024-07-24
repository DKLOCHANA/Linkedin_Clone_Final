// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkedin/viewmodels/profile_view_model.dart';
import 'package:linkedin/widgets/custom_search_box.dart';

import 'package:provider/provider.dart';

class customTopBar extends StatelessWidget {
  const customTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final profileViewModel = Provider.of<ProfileViewModel>(context);
    final userProfile = profileViewModel.userProfile;
    return AppBar(
      toolbarHeight: 60,
      title: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(userProfile.profileUrl),
              ),
            ),
          ),
          Expanded(
            child: customSearchBox(hintText: 'Search'),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(FontAwesomeIcons.solidCommentDots),
          onPressed: () {},
        ),
      ],
    );
  }
}

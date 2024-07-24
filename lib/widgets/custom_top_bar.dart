import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkedin/viewmodels/profile_view_model.dart';
import 'package:linkedin/widgets/custom_search_box.dart';

import 'package:provider/provider.dart';

class CustomTopBar extends StatelessWidget {
  const CustomTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final profileViewModel = Provider.of<ProfileViewModel>(context);
    final userProfile = profileViewModel.userProfile;
    return AppBar(
      toolbarHeight: 60,
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
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
          const Expanded(
            child: CustomSearchBox(hintText: 'Search'),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(FontAwesomeIcons.solidCommentDots),
          onPressed: () {},
        ),
      ],
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:linkedin/viewmodels/profile_private_view_model.dart';
import 'package:linkedin/widgets/carousel_card.dart';
import 'package:linkedin/widgets/custom_search_box.dart';
import 'package:linkedin/widgets/private_data_fields.dart';
import 'package:linkedin/widgets/section_header.dart';
import 'package:provider/provider.dart';
import 'package:linkedin/viewmodels/profile_view_model.dart';

class ProfileView extends StatefulWidget {
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final profileViewModel = Provider.of<ProfileViewModel>(context);
    final userProfile = profileViewModel.userProfile;
    final profilePrivateViewModel =
        Provider.of<ProfilePrivateViewModel>(context);
    final profilePrivate = profilePrivateViewModel.privateList;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: customSearchBox(hintText: userProfile.name),
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.gear),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  userProfile.backgroundImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 110,
                ),
                Row(
                  children: [
                    Container(
                      child: CircleAvatar(
                        radius: 55,
                        backgroundImage: AssetImage(userProfile.profileUrl),
                        backgroundColor: Colors.white,
                      ),
                      margin: EdgeInsets.only(top: 60, left: 15),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 15,
                  right: 20,
                  child: Container(
                    child: Row(
                      children: [
                        Icon(Icons.edit),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 90,
                  child: CircleAvatar(
                    radius: 15,
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    backgroundColor: Colors.white,
                  ),
                ),
                Positioned(
                  top: 15,
                  right: 15,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.edit,
                      color: Color(0xFF0A66C2),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 5.0),
                        child: Text(
                          userProfile.name,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      userProfile.verified,
                    ],
                  ),
                  Text(
                    userProfile.headline,
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  Text(
                    '${userProfile.location}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${userProfile.followers} Followers - ${userProfile.connections} Connections ',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF0A66C2),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(),
                            onPressed: () {},
                            child: Text(
                              'Open to',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                                side: BorderSide(
                                  color:
                                      const Color.fromARGB(255, 134, 134, 134),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Add section',
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 134, 134, 134),
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: BorderSide(
                                color: Color.fromARGB(255, 134, 134, 134),
                              ),
                            ),
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          child: Center(
                            child: Text(
                              '...',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 134, 134, 134),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  carouselCard(),
                  SizedBox(height: 10),

                  // ProfilePrivate data here
                  Text(
                    'Analytics',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.remove_red_eye, size: 20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(
                          'Private to you',
                          style: TextStyle(fontSize: 14),
                        ),
                      )
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      final item = profilePrivate[index];
                      return PrivateDataField(
                        icon: item.icon,
                        count: item.count,
                        headline: item.headline,
                        description: item.description,
                      );
                    },
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Show all analytics',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Icon(
                            Icons.arrow_forward,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionHeader(
                        headline: 'About',
                        plus: false,
                      ),
                      SizedBox(height: 5),
                      Text(
                        userProfile.about,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SectionHeader(headline: 'Skills'),
                  SizedBox(height: 5),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: userProfile.skills.map((skill) {
                      return Chip(
                        backgroundColor: Colors.white,
                        label: Text(skill),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 10),
                  SectionHeader(headline: 'Education'),
                  SizedBox(height: 5),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return educationField(
                        logo: userProfile.schoolLogo,
                        degree: userProfile.degree,
                        university: userProfile.university,
                        time: userProfile.universityTime,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

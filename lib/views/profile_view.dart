import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkedin/viewmodels/carousel_view_model.dart';

import 'package:linkedin/viewmodels/profile_private_view_model.dart';
import 'package:linkedin/widgets/carousel_card.dart';
import 'package:linkedin/widgets/custom_search_box.dart';
import 'package:linkedin/widgets/private_data_fields.dart';
import 'package:linkedin/widgets/section_header.dart';
import 'package:provider/provider.dart';
import 'package:linkedin/viewmodels/profile_view_model.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final profileViewModel = Provider.of<ProfileViewModel>(context);
    final profilePrivateViewModel =
        Provider.of<ProfilePrivateViewModel>(context);
    final profilePrivate = profilePrivateViewModel.privateList;
    final carouselViewModel = Provider.of<CarouselViewModel>(context);
    final hasCarouselData = carouselViewModel.items.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: CustomSearchBox(hintText: profileViewModel.userProfile.name),
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.gear),
            onPressed: () {},
          ),
        ],
      ),
      body: profileViewModel.hasData
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        profileViewModel.userProfile.backgroundImageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 110,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 60, left: 15),
                            child: CircleAvatar(
                              radius: 55,
                              backgroundImage: AssetImage(
                                  profileViewModel.userProfile.profileUrl),
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 15,
                        right: 20,
                        child: Container(
                          child: const Row(
                            children: [
                              Icon(Icons.edit),
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                        bottom: 15,
                        left: 90,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Positioned(
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
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: Text(
                                profileViewModel.userProfile.name,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                            profileViewModel.userProfile.verified,
                          ],
                        ),
                        Text(
                          profileViewModel.userProfile.headline,
                          style: const TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        Text(
                          profileViewModel.userProfile.location,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${profileViewModel.userProfile.followers} Followers - ${profileViewModel.userProfile.connections} Connections ',
                          style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFF0A66C2),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(),
                                  onPressed: () {},
                                  child: const Text(
                                    'Open to',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      side: const BorderSide(
                                        color: Color.fromARGB(
                                            255, 134, 134, 134),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'Add section',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 134, 134, 134),
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
                                    side: const BorderSide(
                                      color: Color.fromARGB(255, 134, 134, 134),
                                    ),
                                  ),
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                ),
                                child: const Center(
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
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        if (hasCarouselData) const CarouselCard(),
                        const SizedBox(height: 10),
                        // ProfilePrivate data here
                        const Text(
                          'Analytics',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Row(
                          children: [
                            Icon(Icons.remove_red_eye, size: 20),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text(
                                'Private to you',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
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
                          child: const Row(
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
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SectionHeader(
                              headline: 'About',
                              plus: false,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              profileViewModel.userProfile.about,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const SectionHeader(headline: 'Skills'),
                        const SizedBox(height: 5),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 4.0,
                          children:
                              profileViewModel.userProfile.skills.map((skill) {
                            return Chip(
                              backgroundColor: Colors.white,
                              label: Text(skill),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 10),
                        const SectionHeader(headline: 'Education'),
                        const SizedBox(height: 5),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return educationField(
                              logo: profileViewModel.userProfile.schoolLogo,
                              degree: profileViewModel.userProfile.degree,
                              university:
                                  profileViewModel.userProfile.university,
                              time: profileViewModel.userProfile.universityTime,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : const Center(
              child: Text(
                'No data available',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
    );
  }
}

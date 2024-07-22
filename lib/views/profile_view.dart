// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:linkedin/viewmodels/carousel_view_model.dart';
import 'package:linkedin/viewmodels/profile_private_view_model.dart';
import 'package:provider/provider.dart';
import 'package:linkedin/viewmodels/profile_viewmodel.dart';

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
    final carouselViewModel = Provider.of<CarouselViewModel>(context);
    final carosolItems = carouselViewModel.items;

    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              hintText: userProfile.name,
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    userProfile.backgroundImageUrl,
                    fit: BoxFit.cover,
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
                          color: Colors.blue,
                        ),
                      )),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userProfile.name,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 3,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue),
                            onPressed: () {
                              // Button 1 action
                            },
                            child: Text(
                              'Open to',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 3,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                                side: BorderSide(
                                  color:
                                      const Color.fromARGB(255, 134, 134, 134),
                                  width: 1,
                                ),
                              ),
                            ),
                            onPressed: () {
                              // Button 2 action
                            },
                            child: Text(
                              'Add section',
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 134, 134, 134)),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Color.fromARGB(255, 134, 134, 134))),
                          child: Center(
                            child: Text(
                              '...',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 134, 134, 134)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    CarouselSlider.builder(
                      itemCount: carosolItems.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Color.fromARGB(255, 134, 134, 134))),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      carosolItems[itemIndex].heading,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    carosolItems[itemIndex].icon,
                                  ],
                                ),
                                Text(
                                  carosolItems[itemIndex].subtitle,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  carosolItems[itemIndex].action,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        aspectRatio: 3.0,
                        initialPage: 0,
                      ),
                    ),

                    SizedBox(height: 10),
                    Divider(
                      thickness: 10,
                      color: Colors.black,
                      height: 10,
                    ),
                    SizedBox(height: 10),
                    // ProfilePrivate data here
                    Text(
                      'Analytics',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(Icons.remove_red_eye, size: 20),
                        SizedBox(width: 10),
                        Text('Private to you')
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        final item = profilePrivate[index];
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  item.icon ?? SizedBox.shrink(),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${item.count} ${item.headline}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '${item.description}',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.amber,
                              ),
                            ],
                          ),
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
                          SizedBox(width: 5),
                          Icon(
                            Icons.arrow_forward,
                            size: 18,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(
                      thickness: 10,
                      color: Colors.black,
                      height: 10,
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'About',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.edit),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            userProfile.about,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Skills',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Container(
                            child: Row(
                              children: [
                                Icon(Icons.add),
                                SizedBox(width: 10),
                                Icon(Icons.edit),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: userProfile.skills.map((skill) {
                        return Chip(
                          label: Text(skill),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Education',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Container(
                            child: Row(
                              children: [
                                Icon(Icons.add),
                                SizedBox(width: 10),
                                Icon(Icons.edit),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              userProfile.schoolLogo),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          userProfile.university,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          userProfile.degree,
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        Text(
                                          userProfile.universityTime,
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

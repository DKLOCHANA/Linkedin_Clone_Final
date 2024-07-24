import 'package:flutter/material.dart';

class UserProfile {
  final String name;
  final Icon verified;
  final String headline;
  final String profileUrl;
  final String backgroundImageUrl;
  final String location;
  final String connections;
  final String followers;
  final String about;
  final String jobs;
  final String school;
  final String schoolLogo;
  final String university;
  final String universityLogo;
  final String schoolTime;
  final String universityTime;
  final String certificate;
  final String degree;

  final List<String> skills;

  UserProfile({
    required this.schoolTime,
    required this.verified,
    required this.universityTime,
    required this.certificate,
    required this.degree,
    required this.name,
    required this.headline,
    required this.profileUrl,
    required this.backgroundImageUrl,
    required this.location,
    required this.connections,
    required this.followers,
    required this.about,
    required this.skills,
    required this.jobs,
    required this.school,
    required this.university,
    required this.universityLogo,
    required this.schoolLogo,
  });
}

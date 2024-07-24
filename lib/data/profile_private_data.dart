import 'package:flutter/material.dart';
import 'package:linkedin/models/profile_private_model.dart';

class ProfilePrivate {
  static final List<ProfilePrivateModel> privateList = [
    ProfilePrivateModel(
      icon: const Icon(Icons.group),
      count: '14',
      headline: 'profile views',
      description: 'Discover who\'s viewed your profile.',
    ),
    ProfilePrivateModel(
      icon: const Icon(Icons.bar_chart),
      count: '18',
      headline: 'post impressions',
      description: 'Check out who\'s engaging with your posts.',
    ),
    ProfilePrivateModel(
      icon: const Icon(Icons.search),
      count: '10',
      headline: 'search appearances',
      description: 'See how often you apper in search results.',
    ),
    ProfilePrivateModel(
      icon: const Icon(Icons.people),
      count: '',
      headline: 'My network',
      description: 'See and manage your connections and interests.',
    ),
    ProfilePrivateModel(
      icon: const Icon(Icons.people),
      count: '',
      headline: 'Saved items',
      description: 'Keep track of your jobs, courses, and articles.',
    ),
  ];
}

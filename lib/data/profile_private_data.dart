import 'package:flutter/material.dart';
import 'package:linkedin/models/profile_private_model.dart';

class ProfilePrivate {
  static final List<ProfilePrivateModel> privateList = [
    ProfilePrivateModel(
      icon: Icon(Icons.remove_red_eye),
      count: '14',
      headline: 'profile views',
      description: 'Discover who\'s viewed your profile.',
    ),
    ProfilePrivateModel(
      icon: Icon(Icons.people),
      count: '18',
      headline: 'post impressions',
      description: 'Check out who\'s engaging with your posts.',
    ),
    ProfilePrivateModel(
      icon: Icon(Icons.search),
      count: '10',
      headline: 'search appearances',
      description: 'See how often you apper in search results.',
    ),
    ProfilePrivateModel(
      icon: Icon(Icons.people),
      count: '',
      headline: 'My network',
      description: 'See and manage your connections and interests.',
    ),
    ProfilePrivateModel(
      icon: Icon(Icons.people),
      count: '',
      headline: 'Saved items',
      description: 'Keep track of your jobs, courses, and articles.',
    ),
  ];
}

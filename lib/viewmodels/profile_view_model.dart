// lib/viewmodels/profile_view_model.dart
import 'package:flutter/material.dart';
import 'package:linkedin/data/profile_data.dart';
import 'package:linkedin/models/profile_model.dart';

class ProfileViewModel extends ChangeNotifier {
  UserProfile _userProfile = ProfileData.userProfile;

  UserProfile get userProfile => _userProfile;
}

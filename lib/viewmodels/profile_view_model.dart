import 'package:flutter/material.dart';
import 'package:linkedin/data/profile_data.dart';
import 'package:linkedin/models/profile_model.dart';

class ProfileViewModel extends ChangeNotifier {
  final UserProfile _userProfile = ProfileData.userProfile;

  UserProfile get userProfile => _userProfile;

  bool get hasData => _userProfile.name.isNotEmpty;
}

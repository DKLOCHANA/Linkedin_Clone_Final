import 'package:flutter/material.dart';
import 'package:linkedin/data/profile_private.dart';
import 'package:linkedin/models/profile_private_model.dart';

class ProfilePrivateViewModel extends ChangeNotifier {
  final List<ProfilePrivateModel> _privateList = ProfilePrivate.privateList;

  List<ProfilePrivateModel> get privateList => _privateList;
}

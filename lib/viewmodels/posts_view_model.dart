// lib/viewmodels/posts_view_model.dart
import 'package:flutter/material.dart';
import 'package:linkedin/data/data.dart';
import 'package:linkedin/models/userPost_model.dart';

class PostsViewModel extends ChangeNotifier {
  List<UserPostModel> _posts = [];

  List<UserPostModel> get posts => _posts;

  void fetchPosts() {
    _posts = Data.postList;
    notifyListeners();
  }
}

// lib/viewmodels/posts_view_model.dart
import 'package:flutter/material.dart';
import 'package:linkedin/data/post_data.dart';
import 'package:linkedin/models/post_model.dart';

class PostsViewModel extends ChangeNotifier {
  List<UserPostModel> _posts = [];
  bool _isLoading = false;

  List<UserPostModel> get posts => _posts;
  bool get isLoading => _isLoading;

  Future<void> fetchPosts() async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    _posts = Data.postList;
    _isLoading = false;
    notifyListeners();
  }
}

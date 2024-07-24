import 'package:flutter/material.dart';
import 'package:linkedin/viewmodels/posts_view_model.dart';
import 'package:linkedin/widgets/custom_top_bar.dart';
import 'package:linkedin/widgets/post_widget.dart';
import 'package:provider/provider.dart';

class HomescreenView extends StatefulWidget {
  const HomescreenView({super.key});

  @override
  State<HomescreenView> createState() => _HomescreenViewState();
}

class _HomescreenViewState extends State<HomescreenView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostsViewModel()..fetchPosts(),
      child: Builder(builder: (context) {
        final postsViewModel = Provider.of<PostsViewModel>(context);

        return Scaffold(
          body: Container(
            color: const Color.fromARGB(255, 163, 165, 163),
            child: Column(
              children: [
                const customTopBar(),
                if (postsViewModel.isLoading)
                  const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                if (postsViewModel.posts.isEmpty && !postsViewModel.isLoading)
                  const Center(
                    child: Text('No Posts'),
                  ),
                if (postsViewModel.posts.isNotEmpty &&
                    !postsViewModel.isLoading)
                  ListPostWidget(posts: postsViewModel.posts),
              ],
            ),
          ),
        );
      }),
    );
  }
}

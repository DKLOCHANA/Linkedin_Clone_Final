import 'package:flutter/material.dart';
import 'package:linkedin/models/post_model.dart';
import 'package:linkedin/widgets/rowButtons.dart';

class ListPostWidget extends StatelessWidget {
  final List<UserPostModel> posts;

  const ListPostWidget({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              margin: const EdgeInsets.only(bottom: 0, top: 8),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(posts[index].profileUrl!),
                          backgroundColor: Colors.white,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            posts[index].name!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.5,
                            ),
                            child: Text(
                              posts[index].headline!,
                              style: const TextStyle(
                                fontSize: 12,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    posts[index].description!,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      posts[index].tags!,
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: Image.asset(posts[index].image!),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            SizedBox(
                              height: 25,
                              child: Image.asset('assets/icons/like_icon.png'),
                            ),
                            SizedBox(
                              height: 25,
                              child: Image.asset(
                                  'assets/icons/celebrate_icon.png'),
                            ),
                            SizedBox(
                              height: 25,
                              child: Image.asset('assets/icons/love_icon.png'),
                            ),
                            Text(
                              posts[index].likes!,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Text(posts[index].comments!),
                            const Text(' Comments'),
                          ],
                        ),
                      )
                    ],
                  ),
                  const Divider(
                    thickness: 0.8,
                    color: Colors.black26,
                  ),
                  const RowButtons(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

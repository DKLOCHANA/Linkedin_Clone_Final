import 'package:flutter/material.dart';
import 'package:linkedin/data/data.dart';
import 'package:linkedin/widgets/rowButtons.dart';

class listPostWidget extends StatelessWidget {
  final _post = Data.postList;
  listPostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          itemCount: _post.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              margin: EdgeInsets.only(bottom: 0, top: 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Colors.black54, width: 0.5),
                    bottom: BorderSide(color: Colors.black54, width: 0.5),
                  )),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(_post[index].profileUrl!),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _post[index].name!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            width: 40,
                            child: Text(
                              _post[index].headline!,
                              style: TextStyle(
                                fontSize: 12,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black54,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    _post[index].description!,
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _post[index].tags!,
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 500,
                    child: Image.asset(_post[index].image!),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              child: Image.asset('assets/icons/like_icon.png'),
                            ),
                            Container(
                              width: 25,
                              height: 25,
                              child: Image.asset(
                                  'assets/icons/celebrate_icon.png'),
                            ),
                            Container(
                              width: 25,
                              height: 25,
                              child: Image.asset('assets/icons/love_icon.png'),
                            ),
                            SizedBox(width: 5),
                            Text(
                              _post[index].likes!,
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Text(_post[index].comments!),
                            Text(' Comments'),
                          ],
                        ),
                      )
                    ],
                  ),
                  Divider(
                    thickness: 0.8,
                    color: Colors.black26,
                  ),
                  rowButtons(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

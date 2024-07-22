import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:linkedin/widgets/customTopBar.dart';
import 'package:linkedin/widgets/postwidget.dart';

class HomescreenView extends StatefulWidget {
  const HomescreenView({super.key});

  @override
  State<HomescreenView> createState() => _HomescreenViewState();
}

class _HomescreenViewState extends State<HomescreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 163, 165, 163),
        child: Column(
          children: [
            customTopBar(),
            listPostWidget(),
          ],
        ),
      ),
    );
  }
}

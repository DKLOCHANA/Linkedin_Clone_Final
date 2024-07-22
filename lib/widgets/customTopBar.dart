import 'package:flutter/material.dart';
import 'package:linkedin/views/signup_view.dart';

class customTopBar extends StatelessWidget {
  const customTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage('assets/images/profileImage3.jpeg'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Container(
            height: 40,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Color(0xFFEEF3F7),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "search",
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xFF666666),
                ),
              ),
            ),
          ),
          Icon(Icons.comment),
        ],
      ),
    );
  }
}

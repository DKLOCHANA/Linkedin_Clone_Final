import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String headline;
  final bool? plus;

  const SectionHeader({
    Key? key,
    required this.headline,
    this.plus = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            headline,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Container(
            child: Row(
              children: [
                if (plus == true) ...[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.add),
                  ),
                ],
                Icon(Icons.edit),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

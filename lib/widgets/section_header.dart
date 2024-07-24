import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String headline;
  final bool? plus;

  const SectionHeader({
    super.key,
    required this.headline,
    this.plus = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            headline,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Container(
            child: Row(
              children: [
                if (plus == true) ...[
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.add),
                  ),
                ],
                const Icon(Icons.edit),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

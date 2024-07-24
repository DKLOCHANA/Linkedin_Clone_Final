import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:linkedin/viewmodels/carousel_view_model.dart';
import 'package:provider/provider.dart';

class carouselCard extends StatelessWidget {
  const carouselCard({super.key});

  @override
  Widget build(BuildContext context) {
    final carouselViewModel = Provider.of<CarouselViewModel>(context);
    final carosolItems = carouselViewModel.items;
    return CarouselSlider.builder(
      itemCount: carosolItems.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Color.fromARGB(255, 134, 134, 134))),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      carosolItems[itemIndex].heading,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    carosolItems[itemIndex].icon,
                  ],
                ),
                Text(
                  carosolItems[itemIndex].subtitle,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                Text(
                  carosolItems[itemIndex].action,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0A66C2)),
                ),
              ],
            ),
          ),
        );
      },
      options: CarouselOptions(
        aspectRatio: 3.0,
        initialPage: 0,
      ),
    );
  }
}

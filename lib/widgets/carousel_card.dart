import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:linkedin/viewmodels/carousel_view_model.dart';
import 'package:provider/provider.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard({super.key});

  @override
  Widget build(BuildContext context) {
    final carouselViewModel = Provider.of<CarouselViewModel>(context);
    final carouselItems = carouselViewModel.items;

    if (carouselItems.isEmpty) {
      return const SizedBox.shrink();
    }

    return CarouselSlider.builder(
      itemCount: carouselItems.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color.fromARGB(255, 134, 134, 134)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      carouselItems[itemIndex].heading,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    carouselItems[itemIndex].icon,
                  ],
                ),
                Text(
                  carouselItems[itemIndex].subtitle,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.normal),
                ),
                Text(
                  carouselItems[itemIndex].action,
                  style: const TextStyle(
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

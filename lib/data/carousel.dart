// lib/data/carousel_data.dart
import 'package:flutter/material.dart';
import 'package:linkedin/models/carousel_item_model.dart';

class CarouselData {
  static final List<CarouselItem> carouselItems = [
    CarouselItem(
      heading: 'Open to work',
      subtitle: 'Software Engineer',
      action: 'See details',
      icon: Icon(Icons.edit),
    ),
    CarouselItem(
      heading: 'Share that yo\'re hiring',
      subtitle: 'Attract qualified candidates.',
      action: 'Get started',
      icon: Icon(Icons.close),
    ),
    CarouselItem(
      heading: 'Showcase your services',
      subtitle:
          'As a section on your profile so your business can be easily discovered.',
      action: 'Add services',
      icon: Icon(Icons.close),
    ),
  ];
}

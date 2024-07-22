// lib/models/carousel_item_model.dart
import 'package:flutter/material.dart';

class CarouselItem {
  final String heading;
  final String subtitle;
  final String action;
  final Icon icon;

  CarouselItem({
    required this.heading,
    required this.subtitle,
    required this.action,
    required this.icon,
  });
}

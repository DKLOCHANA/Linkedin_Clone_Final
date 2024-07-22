// lib/viewmodels/carousel_view_model.dart

import 'package:flutter/material.dart';
import 'package:linkedin/data/carousel.dart';
import 'package:linkedin/models/carousel_item_model.dart';

class CarouselViewModel extends ChangeNotifier {
  final List<CarouselItem> _items = CarouselData.carouselItems;

  List<CarouselItem> get items => _items;
}

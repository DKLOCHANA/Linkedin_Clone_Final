import 'package:flutter/material.dart';
import 'package:linkedin/data/carousel_data.dart';
import 'package:linkedin/models/carousel_item_model.dart';

class CarouselViewModel extends ChangeNotifier {
  final List<CarouselItem> _items = CarouselData.carouselItems;

  List<CarouselItem> get items => _items;
}

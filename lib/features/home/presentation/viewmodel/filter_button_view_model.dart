import 'package:flutter/material.dart';

class FilterButtonViewModel extends ChangeNotifier {
  // range slider
  final double minPrice = 400;
  final double maxPrice = 40000;
  RangeValues priceRange = const RangeValues(600, 800);

  void updatePrice(RangeValues value) {
    priceRange = value;
    notifyListeners();
  }

  // chip
  String? selectedSize;
  final sizes = ['950 sq ft', '1350 sq ft', '1400 sq ft', '1600 sq ft'];

  void selectSize(String? size) {
    selectedSize = size;
    notifyListeners();
  }

  // bedrooms & bathrooms
  final List<int> selectedBedrooms = [];
  final List<int> selectedBathrooms = [];

  void toggleBedroom(int num) {
    selectedBedrooms.contains(num)
        ? selectedBedrooms.remove(num)
        : selectedBedrooms.add(num);
    notifyListeners();
  }

  void toggleBathroom(int num) {
    selectedBathrooms.contains(num)
        ? selectedBathrooms.remove(num)
        : selectedBathrooms.add(num);
    notifyListeners();
  }

  // amenities
  bool parking = false;
  bool gym = false;
  bool cctv = false;
  bool balcony = false;

  void setParking(bool v) {
    parking = v;
    notifyListeners();
  }

  void setGym(bool v) {
    gym = v;
    notifyListeners();
  }

  void setCctv(bool v) {
    cctv = v;
    notifyListeners();
  }

  void setBalcony(bool v) {
    balcony = v;
    notifyListeners();
  }

  void clearAll() {
    priceRange = const RangeValues(600, 800);
    selectedSize = null;
    selectedBedrooms.clear();
    selectedBathrooms.clear();
    parking = gym = cctv = balcony = false;
    notifyListeners();
  }
}

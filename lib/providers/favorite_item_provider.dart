import 'package:flutter/material.dart';

class FavoriteItemProvider with ChangeNotifier {
  final List<int> _selectedItem = [];
  List<int> get selectedItem => _selectedItem;

  void addItem(value) {
    selectedItem.add(value);
    notifyListeners();
  }

  void removeItem(value) {
    selectedItem.remove(value);
    notifyListeners();
  }
}

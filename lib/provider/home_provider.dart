import 'package:ecommerce/Helperdp/databasehelper.dart';
import 'package:ecommerce/models/item_model.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {

  List<Item> items = [];

  void addItem(Item item) async {
    DatabaseHelper.newItem(item);
    items.add(item);
    notifyListeners();
  }

  void getItemsFromDB() async {
    items = await DatabaseHelper.getAllItems();
    notifyListeners();
  }

  void updateItem(Item item){
    DatabaseHelper.updateItem(item);
  }

  void deleteItem(Item item){
    DatabaseHelper.deleteItem(item.id);
    items.removeWhere((element) => element.id == item.id);
    // List favor = items.where((element) => element.isFavourite).toList();
    notifyListeners();
  }

}
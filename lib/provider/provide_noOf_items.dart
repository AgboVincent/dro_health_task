import 'package:dro_health_task/repositories/database_items.dart';
import 'package:dro_health_task/repositories/store_cart_items.dart';
import 'package:flutter/foundation.dart';

class ProvideNoOfCartItems with ChangeNotifier{
  List<DatabaseItems>? databaseItems;
  Future<int> readCartItems () async{
    this.databaseItems = await CartDatabase.instance.readAllItems();
    notifyListeners();
    return databaseItems!.length;
  }
}
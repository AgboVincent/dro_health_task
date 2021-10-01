import 'package:dro_health_task/repositories/database_items.dart';
import 'package:dro_health_task/repositories/store_cart_items.dart';
import 'package:flutter/foundation.dart';

class ProvideTotal extends ChangeNotifier{

  List<DatabaseItems>? databaseItems;
  List quantity = [];
  int? totalPrice;
  Future calculatePrice() async{
    quantity.clear();
    this.databaseItems = await CartDatabase.instance.readAllItems();
    for(int i = 0; i < databaseItems!.length; i++){
      quantity.add(databaseItems![i].quantity * databaseItems![i].productPrice);
      totalPrice = quantity.reduce((a, b) => a + b);
    }
    if(databaseItems!.length == 0){
        totalPrice = 0;
      }
    else {
        totalPrice = quantity.reduce((a, b) => a + b);
    }
    notifyListeners();
  }
}
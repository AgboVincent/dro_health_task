import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dro_health_task/repositories/database_items.dart';
import 'package:dro_health_task/repositories/store_cart_items.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'cart_functionalities_event.dart';
part 'cart_functionalities_state.dart';

class CartFunctionalitiesBloc extends Bloc<CartFunctionalitiesEvent, CartFunctionalitiesState> {
  CartFunctionalitiesBloc() : super(CartFunctionalitiesInitial());

  late List<DatabaseItems> databaseItems = <DatabaseItems>[];
  @override
  Stream<CartFunctionalitiesState> mapEventToState(
    CartFunctionalitiesEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if(event is AddItemsToCart){
      final items = DatabaseItems(
          imageUrl: event.imageUrl!,
          productName: event.productName!,
          productPrice: event.productPrice!,
          quantity: event.quantity!,
          productType: event.productType!,
         productMg:  event.productMg!);
         await CartDatabase.instance.create(items);
         SharedPreferences response = await SharedPreferences.getInstance();
         yield AddedToCart(response.getString('response'));
    }
  }
}

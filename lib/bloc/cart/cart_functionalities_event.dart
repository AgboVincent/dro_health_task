part of 'cart_functionalities_bloc.dart';

abstract class CartFunctionalitiesEvent extends Equatable {
  const CartFunctionalitiesEvent([List props = const []]) : super();
}


class AddItemsToCart extends CartFunctionalitiesEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [imageUrl,productName,productPrice,
    productType, quantity, productPrice,productMg];
  final String? imageUrl;
  final String? productName;
  final String? productType;
  final int? quantity;
  final int? productPrice;
  final int? productMg;
  AddItemsToCart({
    this.imageUrl,
    this.productName,
    this.productType,
    this.quantity,
    this.productPrice,
    this.productMg
}): super([imageUrl,productName,productPrice, productType,
    quantity, productPrice,productMg]);
}

class DeleteItemsFromCart extends CartFunctionalitiesEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


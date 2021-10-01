part of 'cart_functionalities_bloc.dart';

abstract class CartFunctionalitiesState extends Equatable {
  const CartFunctionalitiesState();
}

class CartFunctionalitiesInitial extends CartFunctionalitiesState {
  @override
  List<Object> get props => [];
}


class AddedToCart extends CartFunctionalitiesState{
  @override
  // TODO: implement props
  List<Object?> get props => [response];
  final response;
  AddedToCart(this.response);
}
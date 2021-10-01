import 'dart:io';
import 'package:dro_health_task/provider/provide_drop_down_value.dart';
import 'package:dro_health_task/provider/provide_total.dart';
import 'package:dro_health_task/repositories/database_items.dart';
import 'package:dro_health_task/repositories/store_cart_items.dart';
import 'package:dro_health_task/shared/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  var format =
      NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
  List<DatabaseItems>? databaseItems;

  Future readCartItems() async {
    this.databaseItems = await CartDatabase.instance.readAllItems();
    return databaseItems!.length;
  }

  @override
  Widget build(BuildContext context) {
    final provideDropDownValue =
        Provider.of<ProvideDropDownValue>(context, listen: false);
    final provideTotal = Provider.of<ProvideTotal>(context, listen: false);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80), // Set this height
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF7A08FA),
                Color(0xFFAD3BFC),
              ],
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size(00, 0),
                              alignment: Alignment.centerLeft),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_ios,
                              color: Colors.white, size: 20),
                        ),
                        SizedBox(width: 10),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/cart-outline.png'),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Cart',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 0.3,
                              fontWeight: FontWeight.w500),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/heart-outline.png'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: FutureBuilder(
                future: readCartItems(),
                builder: (context, snapshot) {
                  if (snapshot.data == 0) {
                    return Container(
                      height: 100,
                      child: Center(
                        child: Text(
                          "You have nothing in the cart",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: this.databaseItems?.length,
                    itemBuilder: (context, index) {
                      final items = databaseItems?[index];
                      return CartCard(
                        imageUrl: items?.imageUrl,
                        productName: items?.productName,
                        productType: items?.productType,
                        productPrice: items?.productPrice,
                        productMg: items?.productMg,
                        quantity: items?.quantity,
                        updateQuantity: (newValue) async {
                          final updateQuantity = CartDatabase.instance;
                          final databaseItems = DatabaseItems(
                              id: items!.id,
                              imageUrl: items.imageUrl,
                              productName: items.productName,
                              productPrice: items.productPrice,
                              quantity: newValue!,
                              productType: items.productType,
                              productMg: items.productMg);
                          setState(() {
                            provideDropDownValue.dropDownValue = newValue;
                            print(provideDropDownValue.dropDownValue);
                            updateQuantity.update(databaseItems);
                          });
                        },
                        deleteFromCart: () async {
                          final deleteItem = CartDatabase.instance;
                          setState(() {
                            deleteItem.delete(items!.id!);
                          });
                        },
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                children: [
                  Text(
                    'Total: ',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  FutureBuilder(
                    future: provideTotal.calculatePrice(),
                    builder: (context, AsyncSnapshot snapshot) {
                      return RichText(
                        text: TextSpan(
                          text: format.currencySymbol,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: '',
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: provideTotal.totalPrice.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Proxima Nova',
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFF7A08FA),
                              Color(0xFFAD3BFC),
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Checkout",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}

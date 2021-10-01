import 'dart:io';
import 'package:dro_health_task/bloc/cart/cart_functionalities_bloc.dart';
import 'package:dro_health_task/bloc/inc_dec_quantity/quantity_bloc.dart';
import 'package:dro_health_task/bloc/inc_dec_quantity/quantity_event.dart';
import 'package:dro_health_task/screens/cart.dart';
import 'package:dro_health_task/shared/cart_card.dart';
import 'package:dro_health_task/shared/products.dart';
import 'package:dro_health_task/shared/response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class ProductDetails extends StatelessWidget {
  final String? selectedProductImage;
  final String? selectedProductName;
  final String? selectedProductType;
  final int? selectedProductMg;
  final int? selectedProductPrice;

  ProductDetails(
      {this.selectedProductImage,
      this.selectedProductName,
      this.selectedProductType,
      this.selectedProductMg,
      this.selectedProductPrice});

  final format =
      NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
  final _bloc = CounterBloc();
  final _cartBloc = CartFunctionalitiesBloc();
  final response = ResponseMessageState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 30.0),
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
                          Text(
                            'Pharmacy',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                letterSpacing: 0.3,
                                fontWeight: FontWeight.w500),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: Size(0, 0),
                                    alignment: Alignment.centerLeft),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Cart()));
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/cart-outline.png'))),
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
        child: StreamBuilder(
            stream: _bloc.counter,
            initialData: 1,
            builder: (context, AsyncSnapshot<int> snapshot) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Center(
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(selectedProductImage!),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      selectedProductName!,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$selectedProductType - ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "${selectedProductMg}mg",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage("assets/emzor.JPG")),
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SOLD BY',
                              style: TextStyle(
                                  color: HexColor('#5C86CE'),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'Emzor Pharmaceuticals',
                              style: TextStyle(
                                  color: HexColor('#5C86CE'),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height: 30,
                              width: 30,
                              color: Colors.deepPurple[50],
                              child: Image.asset(
                                'assets/heart-outline.png',
                                color: Color(0xFFAD3BFC),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Row(
                      children: [
                        Card(
                          child: Container(
                            height: 40,
                            width: 100,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _bloc.counterEventSink
                                          .add(DecrementCounterEvent());
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      size: 20,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data.toString(),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _bloc.counterEventSink
                                          .add(IncrementCounterEvent());
                                    },
                                    child: Icon(
                                      Icons.add,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Pack(s)',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: RichText(
                              text: TextSpan(
                                text: "${format.currencySymbol}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: '',
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: selectedProductPrice.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontFamily: 'Proxima Nova',
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '.00',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'Proxima Nova',
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'PRODUCT DETAILS',
                      style: TextStyle(
                          color: HexColor('#5C86CE'),
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/dec_one.JPG'),
                                      fit: BoxFit.fill)),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'PACK SIZE',
                                  style: TextStyle(
                                      color: HexColor('#5C86CE'),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w200),
                                ),
                                Text(
                                  '8 x 12 tablets (96)',
                                  style: TextStyle(
                                      color: HexColor('#5C86CE'),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/dec_two.JPG"),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'PRODUCT IO',
                                  style: TextStyle(
                                      color: HexColor('#5C86CE'),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w200),
                                ),
                                Text(
                                  'PRO23565',
                                  style: TextStyle(
                                      color: HexColor('#5C86CE'),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/dec_three.JPG"),
                                      fit: BoxFit.fill)),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'CONSTITUENTS',
                                  style: TextStyle(
                                      color: HexColor('#5C86CE'),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w200),
                                ),
                                Text(
                                  'Paracetamol',
                                  style: TextStyle(
                                      color: HexColor('#5C86CE'),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.21,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/dec_four.JPG"),
                                      fit: BoxFit.fill)),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'DISPENSED IN',
                                  style: TextStyle(
                                      color: HexColor('#5C86CE'),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w200),
                                ),
                                Text(
                                  'Packs',
                                  style: TextStyle(
                                      color: HexColor('#5C86CE'),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Text(
                      '1 Pack of Emzor Paracetamol (500mg) contains 8 units of 12 tablets',
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      'Similar Products',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 40),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [
                          ProductsSelection(
                            assetImage: 'assets/paracetamol2.JPG',
                            productName: 'Paracetamol',
                            productType: 'Tablet',
                            productMg: '500',
                            productPrice: '350',
                          ),
                          SizedBox(width: 20),
                          ProductsSelection(
                            assetImage: 'assets/ibuprane.JPG',
                            productName: 'Ibuprofen',
                            productType: 'Tablet',
                            productMg: '200',
                            productPrice: '450',
                          ),
                          SizedBox(width: 20),
                          ProductsSelection(
                            assetImage: 'assets/panadol.JPG',
                            productName: 'Panadol',
                            productType: 'Tablet',
                            productMg: '500',
                            productPrice: '250',
                          ),
                          SizedBox(width: 20),
                          ProductsSelection(
                            assetImage: 'assets/ibuprofen.JPG',
                            productName: 'Ibuprofen',
                            productType: 'Capsule',
                            productMg: '100',
                            productPrice: '600',
                          ),
                          SizedBox(width: 20),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  BlocProvider(
                    create: (_) => _cartBloc,
                    child: BlocListener<CartFunctionalitiesBloc, CartFunctionalitiesState>(
                      listener: (context, state) {
                       if(state is AddedToCart){
                         response.openBottomSheet(context, state.response);
                       }
                      },
                      child: Center(
                        child: RawMaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {
                            _cartBloc.add(
                              AddItemsToCart(
                                  imageUrl: selectedProductImage,
                                  productName: selectedProductName,
                                  productType: selectedProductType,
                                  quantity: snapshot.data,
                                  productPrice: selectedProductPrice,
                                  productMg: selectedProductMg),
                            );
                          },
                          //fillColor: HexColor("#7A08FA"),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xFF7A08FA),
                                  Color(0xFFAD3BFC),
                                ],
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Icon(
                                    Icons.add_shopping_cart_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Add to Cart",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50)
                ],
              );
            },
        ),
      ),
    );
  }
}

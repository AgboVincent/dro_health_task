import 'dart:async';
import 'package:dro_health_task/provider/provide_noOf_items.dart';
import 'package:dro_health_task/repositories/database_items.dart';
import 'package:dro_health_task/repositories/store_cart_items.dart';
import 'package:dro_health_task/screens/cart.dart';
import 'package:dro_health_task/screens/product_description.dart';
import 'package:dro_health_task/shared/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pharmacy extends StatefulWidget {
  @override
  _PharmacyState createState() => _PharmacyState();
}

class _PharmacyState extends State<Pharmacy> {
  Timer? timer;
  int? totalNumberOfItems;
  List<DatabaseItems>? databaseItems;

  Future<int> readCartItems() async {
    this.databaseItems = await CartDatabase.instance.readAllItems();
    setState(() {
      totalNumberOfItems = databaseItems!.length;
    });
    return databaseItems!.length;
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (_) => readCartItems());
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }
  @override
  Widget build(BuildContext context) {
    final provideNoOfItems =
        Provider.of<ProvideNoOfCartItems>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                children: [
                  Icon(Icons.add_location, size: 20, color: Colors.black),
                  RichText(
                    text: TextSpan(
                      text: "Delivery in ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Lagos, NG',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              color: Colors.white,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'CATEGORIES',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.3),
                          ),
                          Text(
                            'VIEW ALL',
                            style: TextStyle(
                                color: Colors.purple,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.3),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: [
                            categoriesSelection(
                                "assets/headache.jpg", "Headache"),
                            SizedBox(width: 20),
                            categoriesSelection(
                                "assets/supplements.jpg", "Supplements"),
                            SizedBox(width: 20),
                            categoriesSelection(
                                "assets/infants.jpg", "Infants"),
                            SizedBox(width: 20),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'SELECTION',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.3),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(50, 0),
                                alignment: Alignment.centerLeft),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetails(
                                    selectedProductImage:
                                        'assets/paracetamol.JPG',
                                    selectedProductName: 'Paracetamol',
                                    selectedProductType: 'Tablet',
                                    selectedProductMg: 500,
                                    selectedProductPrice: 350,
                                  ),
                                ),
                              );
                            },
                            child: ProductsSelection(
                              assetImage: 'assets/paracetamol.JPG',
                              productName: 'Paracetamol',
                              productType: 'Tablet',
                              productMg: '500',
                              productPrice: '350',
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(50, 0),
                                alignment: Alignment.centerLeft),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetails(
                                    selectedProductImage:
                                        'assets/doliprane.JPG',
                                    selectedProductName: 'Doliprane',
                                    selectedProductType: 'Capsule',
                                    selectedProductMg: 1000,
                                    selectedProductPrice: 750,
                                  ),
                                ),
                              );
                            },
                            child: ProductsSelection(
                              assetImage: 'assets/doliprane.JPG',
                              productName: 'Doliprane',
                              productType: 'Capsule',
                              productMg: '1000',
                              productPrice: '750',
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(50, 0),
                                alignment: Alignment.centerLeft),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetails(
                                    selectedProductImage:
                                        'assets/paracetamol2.JPG',
                                    selectedProductName: 'Paracetamol',
                                    selectedProductType: 'Tablet',
                                    selectedProductMg: 500,
                                    selectedProductPrice: 350,
                                  ),
                                ),
                              );
                            },
                            child: ProductsSelection(
                              assetImage: 'assets/paracetamol2.JPG',
                              productName: 'Paracetamol',
                              productType: 'Tablet',
                              productMg: '500',
                              productPrice: 350,
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(50, 0),
                                alignment: Alignment.centerLeft),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetails(
                                    selectedProductImage: 'assets/ibuprane.JPG',
                                    selectedProductName: 'Ibuprofen',
                                    selectedProductType: 'Tablet',
                                    selectedProductMg: 200,
                                    selectedProductPrice: 450,
                                  ),
                                ),
                              );
                            },
                            child: ProductsSelection(
                              assetImage: 'assets/ibuprane.JPG',
                              productName: 'Ibuprofen',
                              productType: 'Tablet',
                              productMg: '200',
                              productPrice: '450',
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(50, 0),
                                alignment: Alignment.centerLeft),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetails(
                                    selectedProductImage: 'assets/panadol.JPG',
                                    selectedProductName: 'Panadol',
                                    selectedProductType: 'Tablet',
                                    selectedProductMg: 500,
                                    selectedProductPrice: 250,
                                  ),
                                ),
                              );
                            },
                            child: ProductsSelection(
                              assetImage: 'assets/panadol.JPG',
                              productName: 'Panadol',
                              productType: 'Tablet',
                              productMg: 500,
                              productPrice: 250,
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(50, 0),
                                alignment: Alignment.centerLeft),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetails(
                                    selectedProductImage:
                                        'assets/ibuprofen.JPG',
                                    selectedProductName: 'Ibuprofen',
                                    selectedProductType: 'Capsule',
                                    selectedProductMg: 100,
                                    selectedProductPrice: 600,
                                  ),
                                ),
                              );
                            },
                            child: ProductsSelection(
                              assetImage: 'assets/ibuprofen.JPG',
                              productName: 'Ibuprofen',
                              productType: 'Capsule',
                              productMg: '100',
                              productPrice: '600',
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Cart(),
            ),
          );
        },
        child: Container(
          width: 150,
          height: 40,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFFFE806F),
                Color(0xFFE5366A),
              ],
            ),
            borderRadius: new BorderRadius.circular(40.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              children: [
                Text(
                  'Checkout',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: 7),
                Container(
                  height: 20,
                  width: 20,
                  child: Icon(
                    Icons.add_shopping_cart_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                SizedBox(width: 4),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: Colors.yellow, shape: BoxShape.circle),
                  child: Center(
                    child: FutureBuilder(
                      future: provideNoOfItems.readCartItems(),
                      builder: (context, AsyncSnapshot<int> snapshot) {
                        return Text(
                         totalNumberOfItems == null ?
                         provideNoOfItems.databaseItems!.length.toString():
                         totalNumberOfItems.toString(),
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w400),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget categoriesSelection(String imageUrl, String categoryName) {
    return Container(
      height: 100,
      width: 130,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.fill),
        color: Colors.grey,
        borderRadius: new BorderRadius.circular(15.0),
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              categoryName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductsSelection extends StatelessWidget {
  final String? assetImage;
  final productName;
  final productPrice;
  final productMg;
  final productType;

  ProductsSelection(
      {this.assetImage,
      this.productName,
      this.productPrice,
      this.productMg,
      this.productType});

  final format =
      NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.3,
      width: MediaQuery.of(context).size.width*0.42,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    image: DecorationImage(
                      image: AssetImage(assetImage!),
                      fit: BoxFit.fill
                    )
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    productName,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.3,
                        fontSize: 16),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.015),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      Text(
                        "$productType . " ,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "${productMg}mg",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.015),
                Padding(
                  padding: const EdgeInsets.only(left:10.0),
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
                          text: productPrice.toString(),
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
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

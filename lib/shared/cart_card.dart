import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



typedef CallBackFunc = void Function(int?);
class CartCard extends StatefulWidget {
  final VoidCallback? deleteFromCart;
  final int? quantity;
  final String? productName;
  final int? productPrice;
  final String? productType;
  final int? productMg;
  final String? imageUrl;
  final CallBackFunc? updateQuantity;
  CartCard({
    this.deleteFromCart,
    this.quantity,
    this.productName,
    this.productPrice,
    this.productType,
    this.productMg,
    this.imageUrl,
    this.updateQuantity
});

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  final format =
  NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      child: Container(
        height: MediaQuery.of(context).size.height*0.17,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20.0, bottom: 10),
          child: Row(
             children: [
               Container(
                 height: 100,
                 width: 100,
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage(widget.imageUrl == null ? '' : widget.imageUrl!),
                     fit: BoxFit.fill
                   ),
                 ),
               ),
               SizedBox(width: 20),
               Column(
                 children: [
                   SizedBox(height: 15),
                   Padding(
                     padding: const EdgeInsets.only(left: 10.0),
                     child: Text(
                       widget.productName.toString(),
                       style: TextStyle(
                           color: Colors.black,
                           fontWeight: FontWeight.w400,
                           letterSpacing: 0.3,
                           fontSize: 16),
                     ),
                   ),
                   SizedBox(height: 5),
                   Padding(
                     padding: const EdgeInsets.only(left: 10.0),
                     child: Row(
                       children: [
                         Text(
                           '${widget.productType} . ',
                           style: TextStyle(color: Colors.grey),
                         ),
                         Text(
                           widget.productMg.toString(),
                           style: TextStyle(color: Colors.grey),
                         ),
                       ],
                     ),
                   ),
                   SizedBox(height: 5,),
                   Padding(
                     padding: const EdgeInsets.only(left:10.0),
                     child: RichText(
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
                             text: ((widget.productPrice) !* (widget.quantity as num)).toString(),
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
               ),
               Expanded(
                 child: Align(
                   alignment: Alignment.centerRight,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.end,
                     children: [
                       Card(
                         elevation: 2,
                         child: Container(
                           width: 100,
                             height: 40,
                           child: DropdownButtonHideUnderline(
                             child: DropdownButton(
                               hint: Padding(
                                 padding: const EdgeInsets.only(left: 10.0),
                                 child: Text(
                                   widget.quantity.toString(),
                                   style: TextStyle(
                                       color: Colors.black,
                                       fontSize: 16,
                                       letterSpacing: 0.3,
                                       fontWeight: FontWeight.w300),
                                 ),
                               ),
                               itemHeight: 100,
                               isExpanded: true,
                               value: widget.quantity,
                               icon: Padding(
                                 padding: const EdgeInsets.only(right: 10.0),
                                 child: Icon(Icons.keyboard_arrow_down_outlined),
                               ),
                               iconEnabledColor: Colors.black,
                               iconSize: 30,
                               style: TextStyle(
                                 color: Colors.black,
                               ),
                               items: numbersOfItems().map((value) {
                                 return DropdownMenuItem<int>(
                                   value: value,
                                   child: Padding(
                                     padding: const EdgeInsets.only(left: 20.0),
                                     child:
                                     Text(value.toString()),
                                   ),
                                 );
                               }).toList(),
                               onChanged: widget.updateQuantity
                             ),
                           ),
                         ),
                       ),
                       TextButton(
                         style: TextButton.styleFrom(
                             padding: EdgeInsets.zero,
                             minimumSize: Size(0, 0),
                             alignment: Alignment.centerLeft),
                         onPressed: this.widget.deleteFromCart,
                         child: Padding(
                           padding: const EdgeInsets.only(top: 15.0),
                           child: Container(
                               height: 20,
                               width: 100,
                           child: Row(
                             children: [
                               Icon(Icons.delete, color: Colors.purple,),
                               SizedBox(width: 5),
                               Padding(
                                 padding: const EdgeInsets.only(top: 3.0),
                                 child: Text(
                                   'Remove',
                                   style: TextStyle(
                                       color: Colors.deepPurple
                                   ),
                                 ),
                               )
                             ],
                           ),),
                         ),
                       ),
                     ],
                   ),
                 ),
               )
             ],
          ),
        ),
      ),
    );
  }
   List numbersOfItems(){
   List numbers = [];
    for (int i = 1; i <= 100; i++) {
      numbers.add(i);
    }
    return numbers;
  }
}

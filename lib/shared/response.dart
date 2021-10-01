import 'package:dro_health_task/screens/cart.dart';
import 'package:flutter/material.dart';

class ResponseMessage extends StatefulWidget {
  @override
  ResponseMessageState createState() => ResponseMessageState();
}

class ResponseMessageState extends State<ResponseMessage>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void openBottomSheet(context, String response) {
    controller = BottomSheet.createAnimationController(this);
    controller.duration = Duration(milliseconds: 600);
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        transitionAnimationController: controller,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height*0.32,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left:10.0, right: 10.0),
                      child: Center(
                          child: Text(
                        response,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.height * 0.35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFF7A08FA),
                              Color(0xFFAD3BFC),
                            ],
                          ),
                        ),
                        child: RawMaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> Cart(),),);
                          },
                          child: Center(
                            child: Text(
                              "VIEW CART",
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
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.height * 0.35,
                        decoration: BoxDecoration(),
                        child: RawMaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Color(0xFF7A08FA), width: 1),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          fillColor: Colors.white,
                          child: Text(
                            "CONTINUE SHOPPING",
                            style: TextStyle(
                                color:    Color(0xFF7A08FA),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.3),
                          ),
                        ),
                      ),
                    ),
                  ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

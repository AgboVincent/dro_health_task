import 'package:dro_health_task/screens/pharmacy.dart';
import 'package:dro_health_task/screens/search_products.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 int _selectedIndex = 0;

  late Pharmacy pharmacy;
  late List<Widget> pages;
  late Widget currentPage;

  @override
  void initState() {
    super.initState();
    pharmacy = Pharmacy();
    //pages = [pharmacy];
    currentPage = pharmacy;
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         appBar: AppBar(
           backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 130, // Set this height
          flexibleSpace: Container(
           height: MediaQuery.of(context).size.height * 0.25,
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
           child: Padding(
             padding: const EdgeInsets.only(left: 20.0, right: 20.0),
             child: Column(
               children: [
                 SizedBox(height: 20),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
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
                         child: Container(
                           height: 30,
                           width: 30,
                           decoration: BoxDecoration(
                               image: DecorationImage(
                                   image: AssetImage(
                                       "assets/heart-outline.png"),
                                   fit: BoxFit.fill)),
                         ),
                       ),
                     ),
                     SizedBox(width: 20),
                     Align(
                       alignment: Alignment.centerRight,
                       child: Container(
                         height: 30,
                         width: 30,
                         decoration: BoxDecoration(
                             image: DecorationImage(
                                 image: AssetImage(
                                     "assets/bus-double-decker.png"),
                                 fit: BoxFit.fill)),
                       ),
                     ),
                   ],
                 ),
                 Container(
                   height: 40,
                   margin: new EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
                   child: TextFormField(
                     style: TextStyle(
                         fontSize: 12.0,
                         fontWeight: FontWeight.w500,
                         color: Colors.black,
                         decoration: TextDecoration.none),
                     controller: searchController,
                     autofocus: false,
                     decoration: InputDecoration(
                       fillColor: Colors.white38,
                       filled: true,
                       hintText: 'Search',
                       border: InputBorder.none,
                       enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                         borderSide:
                         BorderSide(color: Colors.transparent),
                       ),
                       focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10),
                           borderSide:
                           BorderSide(color: Colors.transparent)),
                       errorBorder: InputBorder.none,
                       disabledBorder: InputBorder.none,
                       contentPadding: EdgeInsets.only(
                           left: 15, bottom: 15, top: 11, right: 15),
                       hintStyle: TextStyle(
                           color: Colors.black,
                           fontSize: 14,
                           fontWeight: FontWeight.w500),
                       prefixIcon: GestureDetector(
                         onTap: () {
                           setState(() {
                             currentPage = SearchScreen();
                           });
                         },
                         child: Icon(
                           Icons.search,
                           color: Colors.grey[200],
                           size: 30,
                         ),
                       ),
                       suffixIcon: GestureDetector(
                         onTap: () {},
                         child: Icon(
                           Icons.clear,
                           color: Colors.black,
                           size: 20,
                         ),
                       ),
                     ),
                   ),
                 ),
               ],
             ),
           ),
         ),
      ),
        body: currentPage,
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home, size: 20,),
                label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person, size: 20,),
                label: "Doctors"),
            BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart, size: 20,),
                label: "Pharmacy"),
            BottomNavigationBarItem(icon: Icon(Icons.comment, size: 20,),
              label: "Community",),
            BottomNavigationBarItem(icon: Icon(Icons.person_pin_rounded, size: 20,),
              label: "Profile",),
          ],
          currentIndex: 2,
          onTap: itemTapped,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.purple,
          elevation: 4,
          backgroundColor: Colors.grey[100],
        ),
      ),
    );
  }
  void itemTapped(int index){
    setState(() {
      _selectedIndex = index;
      currentPage = pharmacy;
    });

  }
}
TextEditingController searchController = TextEditingController();
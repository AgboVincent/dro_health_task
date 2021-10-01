import 'package:dro_health_task/provider/provide_drop_down_value.dart';
import 'package:dro_health_task/provider/provide_noOf_items.dart';
import 'package:dro_health_task/provider/provide_total.dart';
import 'package:dro_health_task/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProvideTotal>(create: (context) =>ProvideTotal(),),
        ChangeNotifierProvider<ProvideDropDownValue>(create:(context) => ProvideDropDownValue()),
        ChangeNotifierProvider<ProvideNoOfCartItems>(create: (context) => ProvideNoOfCartItems()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Proxima Nova'
        ),
        home: HomePage(),
      ),
    );
  }
}


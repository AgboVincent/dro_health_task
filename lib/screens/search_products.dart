import 'package:dro_health_task/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchText = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  _SearchScreenState() {
    searchController.addListener(() {
      if (searchController.text.isEmpty) {
        if(mounted) setState(() {
          searchText = '';
        });
      }
      else
      if(mounted)setState(() {
        searchText = searchController.text;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ListView(
            padding: new EdgeInsets.symmetric(vertical: 8.0),
            children: _buildSearchList([
              'Paracetamol',
              'Panadol',
              'Doliprane',
              'Ibuprofen',
            ]),
          ),
    );
  }

  List<ChildItem> _buildSearchList(List products) {
    if (searchText.isEmpty) {
      return products.map((contact) => new ChildItem(contact))
          .toList();
    }
    else {
      List<String> _searchList = [];
      for (int i = 0; i < products.length; i++) {
        String name = products.elementAt(i);
        if (name.toLowerCase().contains(searchText.toLowerCase())) {
          _searchList.add(name);
        }
      }
      return _searchList.map((contact) => new ChildItem(contact))
          .toList();
    }
  }
}

class ChildItem extends StatelessWidget {
  final String name;
  ChildItem(this.name);
  @override
  Widget build(BuildContext context) {
    return new ListTile(title: new Text(this.name));
  }
}
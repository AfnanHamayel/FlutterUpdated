import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled4/model/images_model.dart';
import 'package:http/http.dart' as http;
import 'package:untitled4/model/items_model.dart';
import 'package:untitled4/utl/constant_value.dart';

import '../model/categouries.dart';
import 'cart_screen.dart';
// show images >>>>>

class ItemsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ItemsPageState();
  }
}
class ItemsPageState extends State<ItemsPage> {
  List<Items> itemsList = [];


  @override
  void initState() {
    super.initState();
    getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(40),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
        ),
        itemCount: itemsList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CartScreen(
                        itemsList[index].id, itemsList[index].name)),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(itemsList[index].image),
                ),
              ),
              child: Text(itemsList[index].name),
            ),
          );
        },
      ),
    );
  }





  Future getItems() async {
    final response = await http.post(
      Uri.parse("${ConstantValue.URL}Getitems.php"),);
    // body: {"Id_categories": "2"}) ;



    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      var items = jsonBody["items"];
      for (Map i in items) {
        itemsList.add(
            Items(i["Id"], i["Name"], i["HomeImage"], i["Price"], i["Des"],i["Count"]));
      }
      setState(() {});
    }
    print(itemsList);
  }
}
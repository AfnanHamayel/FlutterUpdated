import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/model/items_model.dart';
import 'package:http/http.dart' as http;
import 'package:untitled4/screens/seccess_order.dart';
import 'package:untitled4/utl/constant_value.dart';

class CartScreen extends StatefulWidget {
  var categId;
  var categName;
  CartScreen(this.categId, this.categName);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ItemsScreenState(categId,categName);
  }
}

class ItemsScreenState extends State<CartScreen> {
  var categId;
  var categName;
  double totalPrice = 0;
  String Id = '';


  ItemsScreenState(this.categId, this.categName);

  List<Items> itemsList = [];

  @override
  void initState() {
    super.initState();
    getItems();
  }


  @override
  Widget build(BuildContext context) {

    totalPrice = 0;
    for (int x = 0; x < itemsList.length; x++) {
      totalPrice = totalPrice + (itemsList[x].price * itemsList[x].count);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff5a9ea8),
        elevation: 15,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(2500),
                bottomLeft: Radius.circular(50))),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 2, 70),
              child: Row(children: [
                Text(
                  'Add To Your Cart👀',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 27,
                    color: Colors.white,
                  ),
                ),
              ])),
        ),
      ),


        body: Column(
          children: [
            SizedBox(
              width: 440,
              height:440,
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.network(
                              itemsList[index].image,
                              width:100,
                              height: 100,
                            ),
                            Column(
                              children: [
                                Text(
                                  itemsList[index].name,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(itemsList[index].price.toString())
                              ],
                            ),

                            Container(
                              alignment: Alignment.bottomCenter,
                              child: TextButton(
                                onPressed: () {
                                  if (itemsList[index].count != 1) {
                                    itemsList[index].count =
                                        itemsList[index].count - 1;
                                  } else {
                                    itemsList.removeAt(index);
                                  }

                                  setState(() {});
                                },
                                child: Text("-",
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.black)),
                              ),
                            ),
                            Text(itemsList[index].count.toString()),
                            IconButton(
                              onPressed: () {
                                itemsList[index].count = itemsList[index].count + 1;

                                setState(() {});
                              },
                              icon: Icon(
                                Icons.add,
                                size: 25,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
                itemCount: itemsList.length,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 75,
              padding: EdgeInsets.all(10),
              child: Row(
                  children: [Text("Total Price"), Text("$totalPrice")],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween),
            ),
          ],
        ),

      bottomNavigationBar: SizedBox(
        width: MediaQuery.of(context).size.width,
       // height: 75,
        child: TextButton(onPressed: () {
          addOrder();

        }, child: Text("Add Order")),
      ),
    );
  }


  Future getItems() async {
    final response = await http.post(
        Uri.parse("${ConstantValue.URL}GetItemscat.php"),
        body: {"Id_categories": categId}
    );

    if (response.statusCode == 200) {

      var jsonBody = jsonDecode(response.body);
      var items = jsonBody["items"];
      for (Map i in items) {
        itemsList.add(
            Items(i["Id"], i["Name"], i["HomeImage"], i["Price"], i["Des"],i["Count"]));
      }
      setState(() {});
    }
  }
  Future addOrder() async {
    await getId();
    Response response = await http.post(
        Uri.parse("${ConstantValue.URL}AddOrder.php"),
        body: {
          "Id_users": Id,
          "TotalPrice": totalPrice.toString(),
          "Longitude": "",
          "Latitude": "",
          "Note": "",

        });

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      print(jsonBody);
      setState(() {});
      Navigator.push(context, MaterialPageRoute(builder: (_)=> SuccesOrder()));
    }else {
      print("error");
    }
  }
  Future getId()async{
    final prefs = await SharedPreferences.getInstance();
    Id = prefs.getString("Id")!;
    setState(() {

    });
  }

}

import 'dart:convert';
//import 'dart:ffi' hide Size;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/items_model.dart';
import '../../utl/constant_value.dart';

class UpdateItem extends StatefulWidget {
  const UpdateItem({Key? key}) : super(key: key);

  @override
  State<UpdateItem> createState() => _UpdateItemState();
}

class _UpdateItemState extends State<UpdateItem> {
  TextEditingController updateItemController = TextEditingController();
  TextEditingController addItemController = TextEditingController();
  TextEditingController newItemController = TextEditingController();
  TextEditingController categoryIdController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController DesController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController newPriceController = TextEditingController();
  TextEditingController homeImageController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  List<Items> itemsList = [];

  String Id = "";
  @override
  void dispose() {
    updateItemController.dispose();
    addItemController.dispose();
    newItemController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    getItems();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  'Update Items👀',
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
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Container(
                    color: Colors.grey[300],
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: ((context, index) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Text("Category Id :"),
                            //Text(cateList[index].id),
                            SizedBox(width: 20,),
                            //Text("Name :"),
                            Text(itemsList[index].name),
                            SizedBox(width: 20,),
                            //Text("Image : "),
                            Image.network(itemsList[index].image.toString() , fit: BoxFit.cover , width: 50 , height: 50,),
                            SizedBox(width: 20,),
                          ],)),
                        separatorBuilder: (context, index) =>  Container(height: 5, width: 5, color: Colors.blue,),
                        itemCount: itemsList.length),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child:SingleChildScrollView(
                   // width: MediaQuery.of(context).size.width - 80,
                    //height: 350,
                    child: Card(
                      color: Colors.grey[300],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text("Update Items"),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 80,
                            height: 40,
                            child: TextField(
                              controller: homeImageController,
                              decoration: InputDecoration(
                                  hintText: "Enter New Item Image"),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 80,
                            height: 30,
                            child: TextField(
                              controller: updateItemController,
                              decoration:
                              InputDecoration(hintText: "Enter Item Name"),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 80,
                            height: 40,
                            child: TextField(
                              controller: newItemController,
                              decoration: InputDecoration(
                                  hintText: "Enter New Item Name"),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 80,
                            height: 40,
                            child: TextField(
                              controller: newPriceController,
                              decoration: InputDecoration(
                                  hintText: "Enter New Item Price"),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),


                          Container(
                            width: MediaQuery.of(context).size.width - 80,
                            height: 40,
                            child: TextField(
                              controller: descriptionController,
                              decoration: InputDecoration(
                                  hintText: "Enter New Item Description"),
                            ),
                          ),
                          SizedBox(height:28, width: 200,),
                          ElevatedButton(onPressed: (){
                            updateItem();
                          }, child: Text("Update"))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Future updateItem() async {
    final response =
    await http.post(Uri.parse("${ConstantValue.URL}UpdateItem.php"), body: {
      "new_item_name": newItemController.text,
      "item_name": updateItemController.text,
      "price": newPriceController.text,
      "home_image": homeImageController.text,
      "des": descriptionController.text,
    });

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      print(jsonBody);
      setState(() {});
      final SnackBar snackBar =
      SnackBar(content: Text("Updated Succesfully if Item Exists"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      final SnackBar falsesnackBar = SnackBar(content: Text("Item not found"));
      ScaffoldMessenger.of(context).showSnackBar(falsesnackBar);
    }
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

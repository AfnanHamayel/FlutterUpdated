import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/model/order_model.dart';

import '../utl/constant_value.dart';
class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  String Id = '';
  List ordersList = [];
  @override
  void initState() {
    getOrders();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff5a9ea8),
          elevation: 15,

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(2500),
                  bottomLeft: Radius.circular(50)



              )
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(150)  ,
            child: Padding(
                padding: EdgeInsets.fromLTRB(12, 0, 2, 70),
                child: Row(

                    children: [
                      Text('Your Orders👀',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 27,
                          color: Colors.white,

                        ),
                      ),

                    ]
                )
            ),
          ),
        ),

        body: Padding(
          padding: EdgeInsets.all(12.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width:  MediaQuery.of(context).size.width,
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: ((context, index) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Order :"),
                    Text(ordersList[index]["Id"]),
                    SizedBox(width: 25,),
                    Text("Total Price :"),
                    Text(ordersList[index]["TotalPrice"]),
                  ],)),
                separatorBuilder: (context, index) =>  SizedBox(height: 25,),
                itemCount: ordersList.length),
          ),
        )
    );
  }
  Future getOrders() async {
    await getId();
    final response = await http.post(
        Uri.parse("${ConstantValue.URL}getOrders.php"),
        body: {
          "Id_users": 57.toString(),

        });

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      for(var element in jsonBody['order']){
        ordersList.add(element);
      }
      print(ordersList);



      setState(() {});
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

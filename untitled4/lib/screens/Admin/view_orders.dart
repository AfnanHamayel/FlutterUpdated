import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/model/order_model.dart';
import 'package:untitled4/screens/Admin/admin_dashboard.dart';
import 'package:untitled4/screens/main_screen.dart';

import '../../utl/constant_value.dart';

class ViewOrders extends StatefulWidget {
  const ViewOrders({Key? key}) : super(key: key);

  @override
  State<ViewOrders> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<ViewOrders> {
  String Id = '';
  List ordersList = [];

  String customOrderId = "";
  String customOrderStatus = "";
  //List<String> location = ['One', 'Two', 'Three', 'Four'];

 // String dropdownValue = "fds";

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
                  bottomLeft: Radius.circular(50))),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(150),
            child: Padding(
                padding: EdgeInsets.fromLTRB(12, 0, 2, 70),
                child: Row(children: [
                  Text(
                    'All Orders',
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
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: ((context, index) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("OrderId:"),
                    Text(ordersList[index]["Id"]),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Price:"),
                    Text(ordersList[index]["TotalPrice"]),
                    SizedBox(
                      width: 10,
                    ),
                    //Text("Status :"),
                    Text(ordersList[index]["status"]),
                    SizedBox(
                      width: 10,
                    ),

                    ElevatedButton(
                        onPressed: () {
                          customOrderId = ordersList[index]["Id"];
                          setState(() {});
                          showDialog(
                              context: context,
                              builder: ((context) => Material(
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                        "Change Order Status From Below"),
                                    //SizedBox(height: 15),
                                    Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                  MaterialStateProperty
                                                      .all(Colors
                                                      .blue)),
                                              onPressed: () {
                                                customOrderStatus =
                                                "processing";
                                                setState(() {});
                                                changeOrder();
                                                Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            ViewOrders()),
                                                        (route) => false);
                                              },
                                              child:
                                              Text("Processing")),
                                           SizedBox(width: 15),
                                          ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                  MaterialStateProperty
                                                      .all(Colors
                                                      .green)),
                                              onPressed: () {
                                                customOrderStatus =
                                                "Done";
                                                setState(() {});
                                                changeOrder();
                                                Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            ViewOrders()),
                                                        (route) => false);
                                              },
                                              child: Text("Done")),
                                          SizedBox(width: 15),
                                          ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                  MaterialStateProperty
                                                      .all(Colors
                                                      .red)),
                                              onPressed: () {
                                                customOrderStatus =
                                                "Cancelled";
                                                changeOrder();
                                                setState(() {});
                                                Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            ViewOrders()),
                                                        (route) => false);
                                              },
                                              child: Text("Cancelled")),
                                        ])
                                  ],
                                ),
                              )));
                        },
                        child: Text("Change Status"))
                  ],
                )),
                separatorBuilder: (context, index) => SizedBox(
                  height: 25,
                ),
                itemCount: ordersList.length),
          ),
        ));
  }

  Future changeOrder() async {
    final response = await http
        .post(Uri.parse("${ConstantValue.URL}UpdateOrder.php"), body: {
      "order_status": customOrderStatus,
      "order_id": customOrderId,
    });

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      print(jsonBody);
      setState(() {});

    } else {
      print("error");
    }
  }

  Future getOrders() async {
    await getId();
    final response = await http
        .post(Uri.parse("${ConstantValue.URL}getAllOrders.php"), body: {
      "Id_users": 57.toString(),
    });

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      for (var element in jsonBody['order']) {
        ordersList.add(element);
      }
      print(ordersList);

      setState(() {});
    } else {
      print("error");
    }
  }  // view orders according to userid

  Future getId() async {
    final prefs = await SharedPreferences.getInstance();
    Id = prefs.getString("Id")!;
    setState(() {});
  }
}

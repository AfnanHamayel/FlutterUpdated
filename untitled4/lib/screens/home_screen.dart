import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled4/model/images_model.dart';
import 'package:http/http.dart' as http;
import 'package:untitled4/utl/constant_value.dart';

import '../model/categouries.dart';
import 'cart_screen.dart';
// show images >>>>>

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}
class HomePageState extends State<HomePage> {
  List<Categoires> cateList = [];

  List<ImagesModel> imagelist = [];

  @override
  void initState() {
    super.initState();
    getCategories();
    //getBanarImages();
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
        itemCount: cateList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CartScreen(
                        cateList [index].id, cateList[index].name)),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(cateList[index].image),
                ),
              ),
              child: Text(cateList[index].name),
            ),
          );
        },
      ),
    );
  }



  Future getCategories() async {
    final response = await http.get(
      Uri.parse("${ConstantValue.URL}GetCategories.php"),
    );

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      var categories = jsonBody["categories"];
      for (Map i in categories) {
        cateList.add(Categoires(i["Id"], i["Name"], i["Image"]));
      }
      setState(() {});
    }
  }

  Future getBanarImages() async {
    final response = await http.get(
      Uri.parse("${ConstantValue.URL}GetBanarImages.php"),
    );

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      var images = jsonBody["images"];
      for (Map i in images) {
        imagelist.add(ImagesModel(i["Id"], i["Image"]));
      }
    }
    setState(() {});
  }
}
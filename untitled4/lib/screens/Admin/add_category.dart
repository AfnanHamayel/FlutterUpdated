import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/categouries.dart';
import '../../utl/constant_value.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({Key? key}) : super(key: key);

  @override
  State<AddCategory> createState() => _AddCategoryState();
}
class _AddCategoryState extends State<AddCategory> {
  TextEditingController updateCategoryController = TextEditingController();
  TextEditingController addCategoryController = TextEditingController();
  TextEditingController newCategoryController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController newCategoryImageController = TextEditingController();

  List<Categoires> cateList = [];
  String Id = "";
  @override
  initState(){
    getCategories();
  }
  void dispose() {
    updateCategoryController.dispose();
    addCategoryController.dispose();
    newCategoryController.dispose();
    imageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    Text('Add Category👀',
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
              width:  MediaQuery.of(context).size.width,

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
                      Text(cateList[index].name),
                      SizedBox(width: 20,),
                      //Text("Image : "),
                      Image.network(cateList[index].image.toString() , fit: BoxFit.cover , width: 50 , height: 50,),
                      SizedBox(width: 20,),
                    ],)),
                  separatorBuilder: (context, index) =>  Container(height: 5, width: 5, color: Colors.blue,),
                  itemCount: cateList.length),
            ),
          ),
          Flexible(
            flex: 2,
            child:SingleChildScrollView(
             // width: MediaQuery.of(context).size.width - 80,
             // height: 350,
              child: Card(
                color: Colors.grey[300],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 15,),
                    Text("Add Category"),
                    SizedBox(height: 10,),

                    SizedBox(height: 15,),
                    Container(
                      width: MediaQuery.of(context).size.width - 80,
                      height: 100,
                      child: TextField(
                        controller: imageController,
                        decoration: InputDecoration(
                            hintText: "Enter Category image Url"
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 80,
                      height: 100,
                      child: TextField(
                        controller: addCategoryController,
                        decoration: InputDecoration(
                            hintText: "Enter Category Name"
                        ),
                      ),
                    ),
                    SizedBox(height:50, width: 200.0,
                        child: ElevatedButton(
                        onPressed: (){
                      addCategory();
                    }, child: Text("Add"))
            ),
                  ],
                ) ,
              ),
            ),
          ),

        ],

    ),

    ),

    ),


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
    print(cateList);
  }


  Future getId()async{
    final prefs = await SharedPreferences.getInstance();
    Id = prefs.getString("Id")!;
    print("this is id ? ${Id}");
    setState(() {

    });
  }

  Future addCategory() async {
    final response = await http.post(
        Uri.parse("${ConstantValue.URL}AddCategory.php"),
        body: {
          "new_category": addCategoryController.text,
          "image" : imageController.text


        });

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      print(jsonBody);
      setState(() {});
      final SnackBar snackBar = SnackBar(content: Text("Added Succesfully"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }else {
      final SnackBar falsesnackBar = SnackBar(content: Text("Error"));
      ScaffoldMessenger.of(context).showSnackBar(falsesnackBar);
    }
  }






}
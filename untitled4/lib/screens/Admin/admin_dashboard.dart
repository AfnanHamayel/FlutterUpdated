import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled4/screens/Admin/view_orders.dart';
import 'package:untitled4/screens/login_page.dart';

import 'add_category.dart';
import 'add_items.dart';
import 'update_category.dart';
import 'update_items.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => AdminDashboardState();
}

class AdminDashboardState extends State<AdminDashboard> {
  //const AdminDashboard({Key? key}) : super(key: key);

  var visable = Icon(
    Icons.visibility,
    color: Color(0xff4c5166),
  );
  var visableoff = Icon(
    Icons.visibility_off,
    color: Color(0xff4c5166),
  );



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff65b0bb),
                        Color(0xff5a9ea8),
                        Color(0xff508c95),
                        Color(0xff467b82),
                        Color(0xff3c6970),
                        Color(0xff32585d),
                        Color(0xff28464a),
                      ],

                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 100,),
                        Text(
                          "Welcome To You!☺",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize:30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height:50,),
                        AddCategoryButtons(),
                        SizedBox(height:5,),
                        UpdateCategoryButtons(),
                        SizedBox(height:5,),
                        AddItemsButtons(),
                        SizedBox(height:5,),
                        UpdateItemsButtons(),
                        SizedBox(height: 5,),
                        ViewOrdersButtons(),
                        //SizedBox(height: 5,),
                        //StatusOrdersButtons(),
                        SizedBox(height: 5,),
                        LogOutButtons() ,

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }

  Widget AddCategoryButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Container(
          height:50,
          width:200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),

          ),
          child: ElevatedButton(

            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> AddCategory() ));
            }, child: Text("Add category"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue)
            ),
          ),

      ),
    );
  }

  Widget UpdateCategoryButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Container(
        height:50,
        width:200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),

        ),
        child: ElevatedButton(

          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> UpdateCategory() ));
          }, child: Text("Update category"),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green)
          ),
        ),

      ),
    );
  }

  Widget AddItemsButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),

        ),
        child: ElevatedButton(

          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> AddItem() ));
          }, child: Text("Add items"),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue)
          ),
        ),

      ),
    );
  }

  Widget UpdateItemsButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),

        ),
        child: ElevatedButton(

          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> UpdateItem() ));
          }, child: Text("Update items"),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green)
          ),
        ),

      ),
    );
  }


  Widget ViewOrdersButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),

        ),
        child: ElevatedButton(

          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> ViewOrders() ));
          }, child: Text("View orders "),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue)
          ),
        ),

      ),
    );
  }



  Widget LogOutButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),

        ),
        child: ElevatedButton(

          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> LoginPage() ));
          }, child: Text( "LogOut"),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red)
          ),
        ),

      ),
    );
  }






















}





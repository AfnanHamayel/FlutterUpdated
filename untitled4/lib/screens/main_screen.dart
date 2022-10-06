import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled4/screens/cart_screen.dart';
import 'package:untitled4/screens/home_screen.dart';
import 'package:untitled4/screens/more_screen.dart';

import 'ItemsScreen.dart';


class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  Widget _widget = HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color(0xff5a9ea8),
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
                    Text('Welocome To Our Store 👀',
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
      body: _widget,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart), label: "Items"),
          BottomNavigationBarItem(icon: Icon(Icons.more), label: "More"),
        ],
        onTap: onTap,
        currentIndex: currentIndex,
      ),
    );
  }

  void onTap(int x) {
    currentIndex = x;
    if (currentIndex == 0) {
      _widget = HomePage();
    } else if (currentIndex == 1) {
      _widget = ItemsPage();
    } else {
      _widget = MoreScreen();
    }
    setState(() {});
  }
}










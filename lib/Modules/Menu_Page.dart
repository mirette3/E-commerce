import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                width: double.infinity,
                color: Colors.white60,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0XFFA2EEEB),
                  ),
                  child: CircleAvatar(
                    child: Image.network(
                      "https://cdn3.iconfinder.com/data/icons/avatars-round-flat/33/man5-512.png",
                      height: 140,
                      width: double.infinity,
                    ),
                    radius: 85,
                    backgroundColor: Colors.green,
                  ),
                )),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Name",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.green)),
              subtitle: Text("Mirette "),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Email",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.green)),
              subtitle: Text("mirette@gmail.com "),
            ),
            ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  "Home",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.green),
                )),
            ListTile(
              leading: Icon(Icons.local_offer),
              title: Text("Offers",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.green)),
            ),
            ListTile(
                leading: Icon(Icons.shopping_bag),
                title: Text("MyCart",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.green))),
          ],
        ),
      ),
    );
  }
}

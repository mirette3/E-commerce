
import 'package:amit_and_orange_shop_app/Layout/Cubit/cubit.dart';
import 'package:amit_and_orange_shop_app/Layout/Cubit/states.dart';
import 'package:amit_and_orange_shop_app/Modules/Item_Details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyCubit, States>(
      listener: (BuildContext context, state) {},
      builder: (context, state) => Scaffold(
        body: Container(
          color: Color(0XFFA2EEEB),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                childAspectRatio: 0.5,
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                children: List.generate(
                    MyCubit.get(context).products.length,
                        (index) => ProductCard(
                        MyCubit.get(context).products[index], context)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget ProductCard(map, context) => GestureDetector(
  onTap: () {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ItemDetails(map['id'])));},
  child:   Card(
    color: Colors.white,
    elevation: 5,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            map['avatar'],
            fit: BoxFit.cover,
            height: 200,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            map['title'],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          Text(map['name'], maxLines: 2, overflow: TextOverflow.ellipsis),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 1,
            color: Colors.black12,
            thickness: 2,
          ),
          Spacer(),
          Container(
            color: Colors.black12,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: CircleBorder(
                            side: BorderSide.none,
                          )),
                      child: Text(
                        "+",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      onPressed: () {}),
                  Text(
                    map['price_final_text'],
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  ),
);

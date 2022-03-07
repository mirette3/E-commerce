
import 'package:amit_and_orange_shop_app/Layout/Cubit/cubit.dart';
import 'package:amit_and_orange_shop_app/Layout/Cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget CartItem(map,context) =>  BlocConsumer<MyCubit, States>(
  listener: (BuildContext context, state) {},
  builder: (context, state) => SafeArea(
    child: Container(
      //height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                    child: Image.asset(map['avatar'],fit: BoxFit.cover,width: 100,height: 100,)),
                SizedBox(width: 10,),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(map['name'],maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black45),textAlign:TextAlign.left,),
                      SizedBox(height: 5,),
                      Text(map['title'],style: TextStyle(fontSize: 15),maxLines: 1,overflow: TextOverflow.ellipsis,),
                      SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  map['price_final_text'],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.red),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Color(0XFF27B46E),
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
                                    onPressed: () {
                                      MyCubit.get(context).incrementCounter();
                                    }),
                                Text("${MyCubit.get(context).count}"),
                                TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Color(0XFF27B46E),
                                        shape: CircleBorder(
                                          side: BorderSide.none,
                                        )),
                                    child: Text(
                                      "-",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    onPressed: () {
                                      MyCubit.get(context).decrementCounter();
                                    }),
                              ],
                            ),
                          ],
                        ),
                      ),

                    ],),
                )
              ],
            ),
          ],
        ),
      ),
    ),
  ),
);
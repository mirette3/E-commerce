
import 'package:amit_and_orange_shop_app/Layout/Cubit/cubit.dart';
import 'package:amit_and_orange_shop_app/Layout/Cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemDetails extends StatelessWidget {
  ItemDetails( this.productkey,{Key? key,  }) : super(key: key);
  final productkey;


  @override
  Widget build(BuildContext context) {
    print("the id = $productkey");
    return BlocProvider(
      create: (context)=>MyCubit()..getProdutsbyId(id: productkey),
      child: BlocConsumer<MyCubit, States>(
          listener: (BuildContext context, state) {},
          builder: (context, state) {
            var Products=  MyCubit.get(context).productsId;
            print("the id = $Products");
            return Scaffold(

              body: ConditionalBuilder(
                condition:MyCubit.get(context).productsId.length > 0 ,
                builder:(context)=> Container(
                  color: Color(0XFFA2EEEB),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.network(Products["avatar"],
                                fit: BoxFit.cover,
                                height: 250,
                              ),
                            ),
                            SizedBox(height: 15,),
                            Text(Products["name"],style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),textAlign:TextAlign.left,),
                            SizedBox(height: 5,),
                            Text(Products["title"],style: TextStyle(fontSize: 20),maxLines: 4,overflow: TextOverflow.ellipsis,),
                            SizedBox(height: 15,),
                            Divider(
                              height: 2,
                              color: Colors.black38,
                              thickness: 2,
                            ),
                            SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      Products["price_final_text"],
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
                                            backgroundColor: Colors.red,
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
                                            backgroundColor: Colors.red,
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
                            SizedBox(height: 15,),
                            Divider(
                              height: 2,
                              color: Colors.black38,
                              thickness: 2,
                            ),
                            SizedBox(height: 15,),
                            Text(Products["description"]??""),
                            Spacer(),
                            MaterialButton(
                                onPressed: () {},
                                minWidth: double.infinity,
                                color: Colors.green,
                                elevation: 10,
                                shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Text(
                                  "Add To Cart",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                fallback: (context)=>Center(child: CircularProgressIndicator()),
              ),
            );}),
    )
    ;}
}
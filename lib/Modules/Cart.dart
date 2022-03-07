
import 'package:amit_and_orange_shop_app/Layout/Cubit/cubit.dart';
import 'package:amit_and_orange_shop_app/Layout/Cubit/states.dart';
import 'package:amit_and_orange_shop_app/Shared/Componets/Cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyCubit, States>(
      listener: (BuildContext context, state) {},
      builder: (context, state) => Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Color(0XFFA2EEEB),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => CartItem(MyCubit.get(context).products[index], context),
                    separatorBuilder: (context, index) => Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.black12,
                        ),
                    itemCount: MyCubit.get(context).products.length),
              ),
              //Spacer(),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 130,
                      height: 60,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(side: BorderSide(color:Colors.green,width: 2)),
                        child: Text(
                          "Clear Cart",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        ),
                      ),
                    ),
                    MaterialButton(
                      minWidth: 120,
                        height: 60,
                        onPressed: () {},
                        color: Colors.red,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "Go To CheckOut",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

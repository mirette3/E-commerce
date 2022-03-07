
import 'package:amit_and_orange_shop_app/Layout/Cubit/cubit.dart';
import 'package:amit_and_orange_shop_app/Layout/Cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesPage extends StatelessWidget {
   CategoriesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyCubit, States>(
      listener: (BuildContext context, state) {},
      builder: (context, state) => Scaffold(
        body: SafeArea(
          child: Container(
            color: Color(0XFFA2EEEB),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(crossAxisCount: 2, mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                children:
                  List.generate(MyCubit.get(context).categories.length, (index) => CategoryItem(MyCubit.get(context).categories[index],context)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
Widget CategoryItem(map,context)=> Container(
  height: 500,width: 200,
  child: Card(
    child: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Ink.image(image: NetworkImage(map['avatar']),fit: BoxFit.cover,),
        TextButton(
          onPressed: () {},
          child:  Text(map['name'],
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                backgroundColor: Color(0XFFA2EEEB),
                color: Colors.black87),
          ),
        )
      ],
    ),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)),
    elevation: 10,
    margin: const EdgeInsets.all(10),
  ),
);

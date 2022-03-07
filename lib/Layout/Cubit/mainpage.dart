
import 'package:amit_and_orange_shop_app/Layout/Cubit/cubit.dart';
import 'package:amit_and_orange_shop_app/Layout/Cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyCubit, States>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) => Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios,color: Colors.red,),
          backgroundColor: Colors.white,
          title: Text(
            MyCubit.get(context).titles[MyCubit.get(context).curr_index],
            style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Color(0XFFF03613),
                fontSize: 25),
          ),
        ),
        body: MyCubit.get(context).screens[MyCubit.get(context).curr_index],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Menue',
            ),
          ],
          unselectedItemColor: Color(0XFF27B46E),
          selectedItemColor: Color(0XFFF03613),
          currentIndex: MyCubit.get(context).curr_index,
          onTap: (index) {
            MyCubit.get(context).changeState(index);
          },
        ),
      ),
    );
  }
// void changeState(int index) {
//   curr_index = index;
// }
}

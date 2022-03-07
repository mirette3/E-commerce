
import 'package:amit_and_orange_shop_app/API/DioHelper.dart';
import 'package:amit_and_orange_shop_app/Layout/Cubit/states.dart';
import 'package:amit_and_orange_shop_app/Modules/Cart.dart';
import 'package:amit_and_orange_shop_app/Modules/Categories_Page.dart';
import 'package:amit_and_orange_shop_app/Modules/Home_Page.dart';
import 'package:amit_and_orange_shop_app/Modules/Menu_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCubit extends Cubit<States> {
  MyCubit() : super(initialState());
  static MyCubit get(context) => BlocProvider.of(context);
  bool show_icon= false;
  int count=0;


  void incrementCounter(){
    count++;
    emit(increCounter());
  }
  void decrementCounter(){
    count--;
    emit(decreCounter());
  }
  int curr_index = 0;
  List<Widget> screens = [
    Home(),
    Cart(),
    CategoriesPage(),
    Menu()
  ];
  List<String> titles=[
    'Home','Cart','Categories','Menu'
  ];
  List<dynamic> categories = [];
  void getCategories() {
    DioHelper.getData(url: "api/categories").then((value) {
      categories = value.data['categories'];
      emit(gettingCategories());
      print(categories.toString());
    }).catchError((onError){
      print(onError.toString());
    });
  }

  List<dynamic> products = [];
  void getProduts() {
    DioHelper.getData(url: "api/products").then((value) {
      products = value.data['products'];
      emit(gettingProducts());
      print(products.toString());
    }).catchError((onError){
      print(onError.toString());
    });
  }

  Map productsId ={};
  void getProdutsbyId({required id}) {
    DioHelper.getData(url: "api/products/$id").then((value) {
      productsId = value.data['product'];
      print("data of product $productsId");
      emit(gettingProductsid());
      print(productsId.toString());
    }).catchError((onError){
      print(onError.toString());
    });
  }







  void changeButton() {
    show_icon != show_icon;
    emit(changeBottomSH());
  }
  void changeState(int index) {
    curr_index = index;
    emit(changestate());
  }
//   List<FocusNode> focus=[ FocusNode(), FocusNode()];
//
// void fo(){
//   focus.forEach((element) {element.addListener(() {emit(changeIcon());});});
// }
}
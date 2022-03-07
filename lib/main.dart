import 'package:amit_and_orange_shop_app/API/DioHelper.dart';
import 'package:amit_and_orange_shop_app/Layout/Cubit/cubit.dart';
import 'package:amit_and_orange_shop_app/Layout/Cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Modules/Login_Page.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => MyCubit()..getCategories()..getProduts(),
      child: BlocConsumer<MyCubit, States>(
        listener: (BuildContext context, state) {},
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home:
          //  MainPage(),
       //   Home(),
           //CategoriesPage(),
          LoginScreen(),
          //ItemDetails(),
          //Cart(),

        ),
      ),
    );
  }
}


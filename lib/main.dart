// ignore_for_file: prefer_const_constructors

import 'package:assessmenttest/product/bloc/product_bloc.dart';
import 'package:assessmenttest/repository/apiservice.dart';
import 'package:assessmenttest/view/home_screen/view/homescree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ProductBloc>(
        create: (BuildContext context) =>
            ProductBloc(ApiService())..add(FetchProducts()),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

import 'package:blocrestapicontactapplication/bloc/get/cubit/getcontact_cubit.dart';
import 'package:blocrestapicontactapplication/module.dart';
import 'package:blocrestapicontactapplication/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  locator(); //ဖွင့်ဖွင့်ခင်း service locator/ module.dart=> locatorလို
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc RestApi Contact App',
      debugShowCheckedModeBanner: false,
      home: BlocProvider<GetcontactCubit>(
          create: (context) => getIt.call(), child: Home()),
    );
  }
}

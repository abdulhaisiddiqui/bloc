import 'package:counterapp/bloc/counter/counter_bloc.dart';
import 'package:counterapp/bloc/imagePicker/image_picker_bloc.dart';
import 'package:counterapp/bloc/like/like_bloc.dart';
import 'package:counterapp/bloc/login/login_bloc.dart';
import 'package:counterapp/bloc/switch/switch_bloc.dart';
import 'package:counterapp/utils/image_picker_utils.dart';
import 'package:counterapp/views/counter_screen.dart';
import 'package:counterapp/views/image_picker_screen.dart';
import 'package:counterapp/views/login_screen.dart';
import 'package:counterapp/views/switch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
      BlocProvider(create: (_) => CounterBloc()),
      BlocProvider(create: (_) => SwitchBloc()),
      BlocProvider(create: (_) => LoginBloc()),
      BlocProvider(create: (_) => LikeBloc()),
      BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
    ], child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    ));
  }
}

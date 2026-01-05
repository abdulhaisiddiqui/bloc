import 'dart:io';

import 'package:counterapp/bloc/imagePicker/image_picker_bloc.dart';
import 'package:counterapp/bloc/imagePicker/image_picker_events.dart';
import 'package:counterapp/bloc/imagePicker/image_picker_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Bloc'),
      ),
      body: Center(
        child: BlocBuilder<ImagePickerBloc,ImagePickerStates>(builder: (context,state){
          if(state.file == null) {
            return InkWell(
              onTap: (){
                context.read<ImagePickerBloc>().add(CameraCapture());
              },
                child: CircleAvatar(
                  child: Icon(Icons.camera),
                ),
            );
          }else{
            return Image.file(File(state.file!.path.toString()));
          }
        }),
      ),
    );
  }
}

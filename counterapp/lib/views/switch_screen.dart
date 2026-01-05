import 'package:counterapp/bloc/like/like_bloc.dart';
import 'package:counterapp/bloc/like/like_event.dart';
import 'package:counterapp/bloc/like/like_state.dart';
import 'package:counterapp/bloc/switch/switch_bloc.dart';
import 'package:counterapp/bloc/switch/switch_event.dart';
import 'package:counterapp/bloc/switch/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchScreen extends StatelessWidget {
  const SwitchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Notification', style: TextStyle(fontSize: 20)),
              BlocBuilder<LikeBloc, LikeState>(
                builder: (context, states) {
                  return IconButton(
                    onPressed: () {
                      context.read<LikeBloc>().add(
                        ToggleLike(),
                      );
                    },
                    icon: Icon(states.isLiked ? Icons.favorite : Icons.favorite_border,color: states.isLiked ? Colors.red : Colors.grey,),
                  );
                },
              ),
              BlocBuilder<SwitchBloc, SwitchStates>(
                buildWhen: (previous, current) =>
                    previous.isSwitch != current.isSwitch,
                builder: (context, states) {
                  print('Notificaion');
                  return Switch(
                    value: states.isSwitch,
                    onChanged: (newvalue) {
                      context.read<SwitchBloc>().add(
                        EnableOrDisableNotification(),
                      );
                    },
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 30),

          BlocBuilder<SwitchBloc, SwitchStates>(
            buildWhen: (previous, current) => previous.slider != current.slider,
            builder: (context, states) {
              print('Slider ${states.slider}');
              return Container(
                height: 200,
                color: Colors.red.withOpacity(states.slider),
              );
            },
          ),
          SizedBox(height: 50),
          BlocBuilder<SwitchBloc, SwitchStates>(
            builder: (context, states) {
              return Slider(
                value: states.slider,
                onChanged: (value) {
                  print(value);
                  context.read<SwitchBloc>().add(SliderEvent(slider: value));
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

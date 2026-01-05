import 'package:counterapp/bloc/counter/counter_bloc.dart';
import 'package:counterapp/bloc/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter/counter_event.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc,CounterState>(builder: (context, state){
            return Center(child: Text(state.counter.toString(),style: TextStyle(fontSize: 60),));
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                context.read<CounterBloc>().add(IncrementCounter());
              }, child: Text('Increment')),
              SizedBox(width: 20,),
              BlocBuilder<CounterBloc,CounterState>(builder: (context,state){
                return ElevatedButton(
                    onPressed: (){
                  context.read<CounterBloc>().add(DecrementCounter());
                }, child: state.counter != 0 ? Text('Decrement',style: TextStyle(color: Colors.red),) : Text('Decrement'));
              })
            ],
          ),
          ElevatedButton(onPressed: (){
            context.read<CounterBloc>().add(ResetCounter());
          }, child: Text('Reset')),
        ],
      ),
    );
  }
}

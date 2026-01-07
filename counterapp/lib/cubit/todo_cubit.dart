import 'package:counterapp/model/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<TodoModel>>{
  TodoCubit(): super([]);

  void addTodo(String title){
    final todo = TodoModel(name: title, createdAt: DateTime.now());

    state.add(todo);
    print('////////////${state}');
    emit([...state]);
  }

}
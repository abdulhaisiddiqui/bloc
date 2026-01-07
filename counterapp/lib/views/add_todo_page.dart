import 'package:counterapp/cubit/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController todoTitleController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text('Add Todo'), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: todoTitleController,
              decoration: InputDecoration(hintText: 'Title'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<TodoCubit>(
                  context,
                ).addTodo(todoTitleController.text.trim());
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

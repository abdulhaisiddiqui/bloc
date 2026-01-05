import 'package:counterapp/bloc/login/login_bloc.dart';
import 'package:counterapp/bloc/login/login_event.dart';
import 'package:counterapp/bloc/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late LoginBloc _loginBloc;
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: BlocProvider(create: (_) => _loginBloc,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<LoginBloc,LoginState>(
              buildWhen: (previous,current) => previous.email != current.email,
                builder: (context,states){
                print(states.email);
              return TextFormField(
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  context.read<LoginBloc>().add(EmailChanged(email: value));
                },
                onFieldSubmitted: (value) {},
              );
            }),
            SizedBox(height: 20),

            BlocBuilder<LoginBloc,LoginState>(
              buildWhen: (previous, current) => previous.password != current.password,
                builder: (context,states){
                  print(states.password);
              return TextFormField(
                keyboardType: TextInputType.text,
                focusNode: passwordFocusNode,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  context.read<LoginBloc>().add(PasswordChanged(password: value));
                },
                onFieldSubmitted: (value) {},
              );
            }),
            SizedBox(height: 50),
            BlocListener<LoginBloc,LoginState>(
              listener: (context,state){
                if(state.loginStatus == LoginStatus.error){
                  ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text(state.message.toString())));
                }

                if(state.loginStatus == LoginStatus.loading){
                  ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text('Submitting')));
                }

                if(state.loginStatus == LoginStatus.success){
                  ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text('Login succefull')));
                }
            },
            child: BlocBuilder<LoginBloc,LoginState>(
                buildWhen: (previous,current) => false,
                builder: (context,states){
                  return ElevatedButton(onPressed: () {
                    context.read<LoginBloc>().add(LoginApi());
                  }, child: Text('Login'));
                }),
            )

          ],
        ),
      ),
      ),
    );
  }
}

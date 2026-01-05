import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable{
  LoginEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class EmailChanged extends LoginEvent{
  final String email;

  EmailChanged({required this.email});

  @override
  // TODO: implement props
  List<Object?> get props => [email];
}

class PasswordChanged extends LoginEvent{
  final String password ;

  PasswordChanged({required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [password];
}

class LoginApi extends LoginEvent{}
import 'package:equatable/equatable.dart';

abstract class LikeEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ToggleLike extends LikeEvent{}
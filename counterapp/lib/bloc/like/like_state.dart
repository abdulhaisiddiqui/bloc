import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class LikeState extends Equatable{
  final bool isLiked;

  LikeState({this.isLiked = false});

  LikeState copyWith({
    bool? isLiked,
}){
    return LikeState(
      isLiked: isLiked ?? this.isLiked
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isLiked];
}
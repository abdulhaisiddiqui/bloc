import 'package:bloc/bloc.dart';
import 'package:counterapp/bloc/like/like_event.dart';
import 'package:counterapp/bloc/like/like_state.dart';

class LikeBloc extends Bloc<LikeEvent,LikeState>{
  LikeBloc():super(
      LikeState()){
    on<ToggleLike>(_onToggleLike);
  }
  void _onToggleLike(LikeEvent event, Emitter<LikeState> emit){
    emit(state.copyWith(isLiked: !state.isLiked));
  }
}
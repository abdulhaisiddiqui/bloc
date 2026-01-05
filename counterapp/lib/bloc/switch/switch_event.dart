import 'package:equatable/equatable.dart';

abstract class SwitchEvents extends Equatable{


  SwitchEvents();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class EnableOrDisableNotification extends SwitchEvents {}


class SliderEvent extends SwitchEvents {
  double slider;

  SliderEvent({required this.slider});

  @override
  // TODO: implement props
  List<Object?> get props => [slider];
}
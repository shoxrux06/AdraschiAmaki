part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitEvent extends HomeEvent {}

class HomeNextEvent extends HomeEvent {}

class HomeSearchEvent extends HomeEvent {
  final String text;

  HomeSearchEvent(this.text);
}

class HomeGetMaterialTypes extends HomeEvent {}

class HomeFilterProductsByMaterialTypes extends HomeEvent {
  final String materialType;

  HomeFilterProductsByMaterialTypes(this.materialType);
}



part of 'car_bloc.dart';

@immutable
abstract class CarEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchCars extends CarEvent {}

class RefreshCars extends CarEvent {}

class LoadMoreCars extends CarEvent {
  final List<Car> currentCars;

  LoadMoreCars(this.currentCars);
  @override
  List<Object> get props => [currentCars];
}

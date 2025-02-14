part of 'car_bloc.dart';

abstract class CarEvent {}

class FetchCars extends CarEvent {}

class LoadMoreCars extends CarEvent {
  final List<Car> currentCars;

  LoadMoreCars(this.currentCars);
}

part of 'car_bloc.dart';

abstract class CarState {}

class CarInitial extends CarState {}

class CarLoading extends CarState {}

class CarLoaded extends CarState {
  final List<Car> cars;
  final int totalCars;
  final int currentPage;
  final int totalPages;

  CarLoaded(this.cars, this.totalCars, this.currentPage, this.totalPages);
}

class CarError extends CarState {
  final String message;
  CarError(this.message);
}

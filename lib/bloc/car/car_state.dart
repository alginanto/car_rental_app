part of 'car_bloc.dart';

abstract class CarState {}

class CarInitial extends CarState {}

class CarLoading extends CarState {}

class CarLoaded extends CarState {
  final List<Car> cars;
  final int totalCars;
  final int currentPage;
  final int totalPages;
  final bool isLoadingMore;

  CarLoaded(this.cars, this.totalCars, this.currentPage, this.totalPages,
      {this.isLoadingMore = false});

  CarLoaded copyWith({
    List<Car>? cars,
    int? totalCars,
    int? currentPage,
    int? totalPages,
    bool? isLoadingMore,
  }) {
    return CarLoaded(
      cars ?? this.cars,
      totalCars ?? this.totalCars,
      currentPage ?? this.currentPage,
      totalPages ?? this.totalPages,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class CarError extends CarState {
  final String message;
  CarError(this.message);
}

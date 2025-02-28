import 'package:equatable/equatable.dart';
import 'package:car_rental_app/model/car_model.dart';

abstract class CarState extends Equatable {
  const CarState();

  @override
  List<Object?> get props => [];
}

class CarListState extends CarState {
  final List<Car> cars;
  final int totalCars;
  final int currentPage;
  final int totalPages;
  final bool isLoadingMore;
  final String? errorMessage;
  final ApiStatus status;

  const CarListState._({
    this.cars = const [],
    this.totalCars = 0,
    this.currentPage = 1,
    this.totalPages = 1,
    this.isLoadingMore = false,
    this.errorMessage,
    required this.status,
  });

  /// Initial state
  const CarListState.initial() : this._(status: ApiStatus.loading);

  /// Success state
  const CarListState.loaded(
      {required List<Car> cars,
      required int totalCars,
      required int currentPage,
      required int totalPages})
      : this._(
            cars: cars,
            totalCars: totalCars,
            currentPage: currentPage,
            totalPages: totalPages,
            status: ApiStatus.success);

  /// Error state
  const CarListState.error(String errorMessage)
      : this._(errorMessage: errorMessage, status: ApiStatus.error);

  CarListState copyWith({
    List<Car>? cars,
    int? totalCars,
    int? currentPage,
    int? totalPages,
    bool? isLoadingMore,
    String? errorMessage,
    ApiStatus? status,
  }) {
    return CarListState._(
      cars: cars ?? this.cars,
      totalCars: totalCars ?? this.totalCars,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        cars,
        totalCars,
        currentPage,
        totalPages,
        isLoadingMore,
        errorMessage,
        status,
      ];
}

enum ApiStatus { loading, success, error }

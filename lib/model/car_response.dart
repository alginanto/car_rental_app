import 'package:car_rental_app/model/car_model.dart';

class CarResponse {
  final List<Car> cars;
  final int currentPage;
  final int totalPages;
  final int totalCars;
  final int carsPerPage;

  CarResponse({
    required this.cars,
    required this.currentPage,
    required this.totalPages,
    required this.totalCars,
    required this.carsPerPage,
  });

  factory CarResponse.fromJson(Map<String, dynamic> json) {
    return CarResponse(
      cars: (json['cars'] as List).map((car) => Car.fromJson(car)).toList(),
      currentPage: json['currentPage'],
      totalPages: json['totalPages'],
      totalCars: json['totalCars'],
      carsPerPage: json['carsPerPage'],
    );
  }
}

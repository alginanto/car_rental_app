import 'package:car_rental_app/model/car_model.dart';
import 'package:car_rental_app/model/car_response.dart';
import 'package:dio/dio.dart';
import 'dio_client.dart';

class CarRepository {
  final DioClient _dioClient = DioClient();

  Future<CarResponse> fetchCarResponse({int page = 1}) async {
    try {
      Response response = await _dioClient.dio.get('/cars/allcars?page=$page');

      if (response.statusCode == 200) {
        CarResponse carResponse = CarResponse.fromJson(response.data);
        return carResponse;
      } else {
        throw Exception("Failed to load cars");
      }
    } catch (e) {
      throw Exception("Error fetching cars: $e");
    }
  }

  Future<List<Car>> fetchAllCars({int page = 1}) async {
    try {
      Response response = await _dioClient.dio.get('/cars/allcars');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((car) => Car.fromJson(car)).toList();
      } else {
        throw Exception("Failed to load cars");
      }
    } catch (e) {
      throw Exception("Error fetching cars: $e");
    }
  }
}

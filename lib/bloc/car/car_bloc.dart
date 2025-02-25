import 'package:car_rental_app/data/car_repository.dart';
import 'package:car_rental_app/model/car_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'car_event.dart';
part 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final CarRepository carRepository;
  int currentPage = 1;
  bool isFetching = false;

  CarBloc(this.carRepository) : super(CarInitial()) {
    on<FetchCars>((event, emit) async {
      if (isFetching) return;
      isFetching = true;

      try {
        emit(CarLoading());
        final response = await carRepository.fetchCarResponse(page: currentPage);
        
        currentPage++;
        emit(CarLoaded(
          response.cars,
          response.totalCars,
          currentPage,
          response.totalPages,
          isLoadingMore: false,
        ));
      } catch (e) {
        emit(CarError("Failed to fetch cars"));
      } finally {
        isFetching = false;
      }
    });

    on<LoadMoreCars>((event, emit) async {
      if (isFetching) return;
      if (state is! CarLoaded) return;
      
      final currentState = state as CarLoaded;
      if (currentState.isLoadingMore) return;

      isFetching = true;
      emit(currentState.copyWith(isLoadingMore: true));

      try {
        final response = await carRepository.fetchCarResponse(page: currentPage);
        
        currentPage++;
        emit(CarLoaded(
          [...event.currentCars, ...response.cars],
          response.totalCars,
          currentPage,
          response.totalPages,
          isLoadingMore: false,
        ));
      } catch (e) {
        emit(CarError("Failed to load more cars"));
      } finally {
        isFetching = false;
      }
    });
  }
}
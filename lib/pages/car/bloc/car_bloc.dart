import 'package:car_rental_app/pages/car/bloc/car_state.dart';
import 'package:car_rental_app/data/car_repository.dart';
import 'package:car_rental_app/model/car_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'car_event.dart';

class CarBloc extends Bloc<CarEvent, CarListState> {
  final CarRepository carRepository;
  int currentPage = 1;
  bool isFetching = false;

  // Controllers moved to bloc
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  final ScrollController scrollController = ScrollController();

  CarBloc(this.carRepository) : super(const CarListState.initial()) {
    on<FetchCars>(_onFetchCars);
    on<RefreshCars>(_onRefreshCars);
    on<LoadMoreCars>(_onLoadMoreCars);

    // Set up scroll listener
    scrollController.addListener(_onScroll);

    // Initial fetch
    Future.microtask(() => add(FetchCars()));
  }

  void _onScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      if (state.status == ApiStatus.success &&
          !state.isLoadingMore &&
          !isFetching) {
        add(LoadMoreCars(state.cars));
      }
    }
  }

  Future<void> _onFetchCars(FetchCars event, Emitter<CarListState> emit) async {
    if (isFetching) return;
    isFetching = true;
    try {
      emit(const CarListState.initial());
      final response = await carRepository.fetchCarResponse(page: 1);

      currentPage = 2; // Reset to page 2 for next load
      emit(CarListState.loaded(
        cars: response.cars,
        totalCars: response.totalCars,
        currentPage: currentPage,
        totalPages: response.totalPages,
      ));
    } catch (e) {
      emit(CarListState.error("Failed to fetch cars"));
    } finally {
      isFetching = false;
    }
  }

  Future<void> _onRefreshCars(
      RefreshCars event, Emitter<CarListState> emit) async {
    if (isFetching) return;
    isFetching = true;
    try {
      final response = await carRepository.fetchCarResponse(page: 1);

      currentPage = 2; // Reset to page 2 for next load
      emit(CarListState.loaded(
        cars: response.cars,
        totalCars: response.totalCars,
        currentPage: currentPage,
        totalPages: response.totalPages,
      ));
    } catch (e) {
      emit(CarListState.error("Failed to refresh cars"));
    } finally {
      isFetching = false;
    }
  }

  Future<void> _onLoadMoreCars(
      LoadMoreCars event, Emitter<CarListState> emit) async {
    if (isFetching) return;
    if (state.status != ApiStatus.success) return;
    if (state.isLoadingMore) return;

    isFetching = true;
    emit(state.copyWith(isLoadingMore: true));

    try {
      final response = await carRepository.fetchCarResponse(page: currentPage);

      if (response.cars.isEmpty) {
        // No more data to load
        emit(state.copyWith(isLoadingMore: false));
        return;
      }

      currentPage++;
      emit(state.copyWith(
        cars: [...state.cars, ...response.cars],
        totalCars: response.totalCars,
        currentPage: currentPage,
        totalPages: response.totalPages,
        isLoadingMore: false,
      ));
    } catch (e) {
      emit(CarListState.error("Failed to load more cars"));
    } finally {
      isFetching = false;
    }
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    refreshController.dispose();
    return super.close();
  }
}

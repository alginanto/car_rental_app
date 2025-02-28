import 'package:car_rental_app/pages/car/bloc/car_bloc.dart';
import 'package:car_rental_app/pages/car/bloc/car_state.dart';
import 'package:car_rental_app/pages/car/widgets/car_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CarListView extends StatelessWidget {
  const CarListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CarBloc, CarListState>(
      listener: (context, state) {
        final carBloc = context.read<CarBloc>();

        if (state.status == ApiStatus.success && state.isLoadingMore == false) {
          carBloc.refreshController.loadComplete();
          carBloc.refreshController.refreshCompleted();
        } else if (state.status == ApiStatus.error) {
          carBloc.refreshController.refreshFailed();
          carBloc.refreshController.loadFailed();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage ?? 'An error occurred')),
          );
        }
      },
      builder: (context, state) {
        return _buildBody(context, state);
      },
    );
  }

  Widget _buildBody(BuildContext context, CarListState state) {
    final carBloc = context.read<CarBloc>();

    switch (state.status) {
      case ApiStatus.loading:
        if (state.cars.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return _buildCarList(context, state);

      case ApiStatus.success:
        return _buildCarList(context, state);

      case ApiStatus.error:
        if (state.cars.isNotEmpty) {
          return _buildCarList(context, state);
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state.errorMessage ?? 'Something went wrong'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => carBloc.add(FetchCars()),
                child: const Text('Try Again'),
              ),
            ],
          ),
        );
    }
  }

  Widget _buildCarList(BuildContext context, CarListState state) {
    final carBloc = context.read<CarBloc>();

    return SmartRefresher(
      controller: carBloc.refreshController,
      enablePullDown: true,
      enablePullUp: state.currentPage <= state.totalPages,
      header: const WaterDropHeader(),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus? mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = const Text("Pull up to load more");
          } else if (mode == LoadStatus.loading) {
            body = const CircularProgressIndicator();
          } else if (mode == LoadStatus.failed) {
            body = const Text("Load Failed! Click retry!");
          } else if (mode == LoadStatus.canLoading) {
            body = const Text("Release to load more");
          } else {
            body = const Text("No more cars");
          }
          return Container(
            height: 55.0,
            padding: const EdgeInsets.all(8.0),
            child: Center(child: body),
          );
        },
      ),
      onRefresh: () => carBloc.add(RefreshCars()),
      onLoading: () => carBloc.add(LoadMoreCars(state.cars)),
      child: ListView.builder(
        controller: carBloc.scrollController,
        itemCount: state.cars.length + (state.isLoadingMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == state.cars.length && state.isLoadingMore) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }

          final car = state.cars[index];
          return CarListItem(car: car);
        },
      ),
    );
  }
}

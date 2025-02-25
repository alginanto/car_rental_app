import 'package:car_rental_app/bloc/car/car_bloc.dart';
import 'package:car_rental_app/data/car_repository.dart';
import 'package:car_rental_app/model/car_model.dart';
import 'package:car_rental_app/screens/car_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final isLoadingMore = useState(false);

    useEffect(() {
      void onScroll() {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent * 0.8) {
          final state = context.read<CarBloc>().state;
          if (state is CarLoaded &&
              !isLoadingMore.value &&
              state.currentPage < state.totalPages &&
              !state.isLoadingMore) {
            isLoadingMore.value = true;
            context.read<CarBloc>().add(LoadMoreCars(state.cars));
          }
        }
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController]);

    return Scaffold(
      body: BlocProvider(
        create: (context) => CarBloc(CarRepository())..add(FetchCars()),
        child: BlocConsumer<CarBloc, CarState>(
          listener: (context, state) {
            if (state is CarLoaded && !state.isLoadingMore) {
              isLoadingMore.value = false;
            }
          },
          builder: (context, state) {
            return CustomScrollView(
              controller: scrollController,
              slivers: [
                const SliverAppBar(
                  floating: true,
                  pinned: true,
                  title: Text("Available Cars"),
                ),
                if (state is CarLoading && state is! CarLoaded)
                  const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  )
                else if (state is CarLoaded) ...[
                  SliverPadding(
                    padding: const EdgeInsets.all(8.0),
                    sliver: SliverToBoxAdapter(
                      child: Text(
                        "Loaded Cars: ${state.cars.length}/${state.totalCars}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        Car car = state.cars[index];
                        return ListTile(
                          leading: Image.network(
                            car.images.isNotEmpty
                                ? car.images[0]
                                : 'https://via.placeholder.com/150',
                          ),
                          title: Text(car.name),
                          subtitle: Text("\$${car.price.rental}/day"),
                          trailing: const Icon(Icons.arrow_forward),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CarDetailScreen(car: car),
                              ),
                            );
                          },
                        );
                      },
                      childCount: state.cars.length,
                    ),
                  ),
                  if (state.isLoadingMore)
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    )
                  else if (state.currentPage >= state.totalPages)
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(
                          child: Text(
                            "No More Cars Available 🚗",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                ] else if (state is CarError)
                  SliverFillRemaining(
                    child: Center(child: Text(state.message)),
                  )
                else
                  const SliverFillRemaining(
                    child: Center(child: Text("No data available")),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

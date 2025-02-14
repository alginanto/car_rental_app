import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/car/car_bloc.dart';

class CarListScreen extends StatefulWidget {
  @override
  _CarListScreenState createState() => _CarListScreenState();
}

class _CarListScreenState extends State<CarListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CarBloc>().add(FetchCars());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cars List")),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          if (state is CarLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CarLoaded) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Loaded Cars: ${state.cars.length}/${state.totalCars}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.cars.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.cars[index].name),
                        subtitle: Text(state.cars[index].brand),
                      );
                    },
                  ),
                ),
                if (state.currentPage < state.totalPages)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<CarBloc>().add(LoadMoreCars(state.cars));
                      },
                      child: Text("Load More Cars"),
                    ),
                  ),
                if (state.currentPage >= state.totalPages)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "No More Cars Available 🚗",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
              ],
            );
          } else if (state is CarError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}

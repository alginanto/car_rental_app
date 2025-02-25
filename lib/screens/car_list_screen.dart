import 'package:car_rental_app/model/car_model.dart';
import 'package:car_rental_app/screens/car_detail_screen.dart';
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
                    Car car = state.cars[index];
                    return ListTile(
                      leading: Image.network(car.images.isNotEmpty
                          ? car.images[0]
                          : 'https://via.placeholder.com/150'),
                      title: Text(car.name),
                      subtitle: Text("\$${car.price.rental}/day"),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CarDetailScreen(car: car)),
                        );
                      },
                    );
                  },
                )),
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

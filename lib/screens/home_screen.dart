import 'package:car_rental_app/data/car_repository.dart';
import 'package:car_rental_app/model/car_model.dart';
import 'package:car_rental_app/screens/car_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/car/car_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Available Cars")),
      body: BlocProvider(
        create: (context) => CarBloc(CarRepository())..add(FetchCars()),
        child: BlocBuilder<CarBloc, CarState>(
          builder: (context, state) {
            if (state is CarLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CarLoaded) {
              return ListView.builder(
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
              );
            } else if (state is CarError) {
              return Center(child: Text(state.message));
            } else {
              return Center(child: Text("No data available"));
            }
          },
        ),
      ),
    );
  }
}

import 'package:car_rental_app/pages/car/list/car_listview_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_rental_app/pages/car/bloc/car_bloc.dart';
import 'package:car_rental_app/data/car_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Rental Service'),
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => CarBloc(CarRepository()),
        child: const CarListView(),
      ),
    );
  }
}

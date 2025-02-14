import 'package:car_rental_app/model/car_model.dart';
import 'package:flutter/material.dart';

class CarDetailScreen extends StatelessWidget {
  final Car car;

  CarDetailScreen({required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(car.name)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(car.images.isNotEmpty
                ? car.images[0]
                : 'https://via.placeholder.com/300'),
            SizedBox(height: 10),
            Text(car.description, style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text("Price: \$${car.price.rental}/day",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement booking functionality
              },
              child: Text("Book Now"),
            )
          ],
        ),
      ),
    );
  }
}

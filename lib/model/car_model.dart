// car.dart
class Car {
  final String id;
  final String name;
  final String brand;
  final String model;
  final int year;
  final String description;
  final List<String> images;
  final bool availability;
  final Specifications specifications;
  final Price price;

  Car({
    required this.id,
    required this.name,
    required this.brand,
    required this.model,
    required this.year,
    required this.description,
    required this.images,
    required this.availability,
    required this.specifications,
    required this.price,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    // Replace all images with the specified URL
    List<String> newImages = List.generate(
      json['images']
          .length, // Maintain the original number of image entries, or 1 if you always want one image
      (index) =>
          "https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=1966&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    );
    return Car(
      id: json['_id'],
      name: json['name'],
      brand: json['brand'],
      model: json['model'],
      year: json['year'],
      description: json['description'],
      images: newImages,
      availability: json['availability'],
      specifications: Specifications.fromJson(json['specifications']),
      price: Price.fromJson(json['price']),
    );
  }
}

class Specifications {
  final String power;
  final String maxSpeed;
  final String acceleration;
  final String engineCapacity;

  Specifications({
    required this.power,
    required this.maxSpeed,
    required this.acceleration,
    required this.engineCapacity,
  });

  factory Specifications.fromJson(Map<String, dynamic> json) {
    return Specifications(
      power: json['power'],
      maxSpeed: json['maxSpeed'],
      acceleration: json['acceleration'],
      engineCapacity: json['engineCapacity'],
    );
  }
}

class Price {
  final int rental;
  final int purchase;

  Price({
    required this.rental,
    required this.purchase,
  });

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      rental: json['rental'],
      purchase: json['purchase'],
    );
  }
}

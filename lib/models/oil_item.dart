class OilItem {
  final int id;
  final String name;
  final double price;
  final String image;
  OilItem({
    required this.id,
    required this.name,
    required this.price,
    required this.image
  });

  factory OilItem.fromJson(Map<String, dynamic> json) {
    return OilItem(
      id: json['oilTypeId'],
      name: json['nameTh'],
      price: json['price'],
      image: json['image'],
    );
  }

}
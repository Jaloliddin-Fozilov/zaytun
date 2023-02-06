class FlatModel {
  final int id;
  final String owner;
  final String contract;
  final int amountOfRooms;
  final int square;
  final double capacity;
  final int priceM;
  final int price;
  final int status;
  final DateTime bookingTime;
  final String image;
  final List<String> fotoGallary;

  FlatModel({
    required this.id,
    required this.owner,
    required this.contract,
    required this.amountOfRooms,
    required this.square,
    required this.capacity,
    required this.priceM,
    required this.price,
    required this.status,
    required this.bookingTime,
    required this.image,
    required this.fotoGallary,
  });
}

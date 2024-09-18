class Bike {
  final String about;
  final String category;
  final String uid;
  final String image;
  final String level;
  final String name;
  final num price;
  final num rating;
  final String release;
  Bike({
    required this.about,
    required this.category,
    required this.uid,
    required this.image,
    required this.level,
    required this.name,
    required this.price,
    required this.rating,
    required this.release,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'about': about,
      'category': category,
      'uid': uid,
      'image': image,
      'level': level,
      'name': name,
      'price': price,
      'rating': rating,
      'release': release,
    };
  }

  factory Bike.fromJson(Map<String, dynamic> json) {
    return Bike(
      about: json['about'] as String,
      category: json['category'] as String,
      uid: json['uid'] as String,
      image: json['image'] as String,
      level: json['level'] as String,
      name: json['name'] as String,
      price: json['price'] as num,
      rating: json['rating'] as num,
      release: json['release'] as String,
    );
  }

  static Bike get empty => Bike(
      about: '',
      category: '',
      uid: '',
      image: '',
      level: '',
      name: '',
      price: 0,
      rating: 0,
      release: '');

  @override
  String toString() {
    return 'Bike(about: $about, category: $category, uid: $uid, image: $image, level: $level, name: $name, price: $price, rating: $rating, release: $release)';
  }
}

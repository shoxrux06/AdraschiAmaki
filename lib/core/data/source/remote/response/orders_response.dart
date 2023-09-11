// To parse this JSON data, do
//
//     final ordersResponse = ordersResponseFromJson(jsonString);

import 'dart:convert';

OrdersResponse ordersResponseFromJson(String str) => OrdersResponse.fromJson(json.decode(str));

String ordersResponseToJson(OrdersResponse data) => json.encode(data.toJson());

class OrdersResponse {
  List<Order> data;

  OrdersResponse({
    required this.data,
  });

  factory OrdersResponse.fromJson(Map<String, dynamic> json) => OrdersResponse(
    data: List<Order>.from(json["data"].map((x) => Order.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Order {
  int id;
  String total;
  String status;
  String qabul;
  DateTime createdAt;
  DateTime updatedAt;
  User user;
  List<Product> products;

  Order({
    required this.id,
    required this.total,
    required this.status,
    required this.qabul,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.products,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    total: json["total"],
    status: json["status"],
    qabul: json["qabul"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    user: User.fromJson(json["user"]),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "total": total,
    "status": status,
    "qabul": qabul,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "user": user.toJson(),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };

  @override
  String toString() {
    return 'Order{id: $id, total: $total, status: $status, qabul: $qabul, createdAt: $createdAt, updatedAt: $updatedAt, user: $user, products: $products}';
  }
}

class Product {
  int id;
  String category;
  String price;
  dynamic discount;
  dynamic eni;
  dynamic boyi;
  String gramm;
  String color;
  dynamic ishlabChiqarishTuri;
  String mahsulotTola;
  String brand;
  String user;
  int likes;
  int views;
  DateTime createdAt;
  DateTime updatedAt;
  List<String> photos;
  User owner;
  Pivot pivot;

  Product({
    required this.id,
    required this.category,
    required this.price,
    required this.discount,
    required this.eni,
    required this.boyi,
    required this.gramm,
    required this.color,
    required this.ishlabChiqarishTuri,
    required this.mahsulotTola,
    required this.brand,
    required this.user,
    required this.likes,
    required this.views,
    required this.createdAt,
    required this.updatedAt,
    required this.photos,
    required this.owner,
    required this.pivot,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    category: json["category"],
    price: json["price"],
    discount: json["discount"],
    eni: json["eni"],
    boyi: json["boyi"],
    gramm: json["gramm"],
    color: json["color"],
    ishlabChiqarishTuri: json["ishlab_chiqarish_turi"],
    mahsulotTola: json["mahsulot_tola"],
    brand: json["brand"],
    user: json["user"],
    likes: json["likes"],
    views: json["views"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    photos: List<String>.from(json["photos"].map((x) => x)),
    owner: User.fromJson(json["owner"]),
    pivot: Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category": category,
    "price": price,
    "discount": discount,
    "eni": eni,
    "boyi": boyi,
    "gramm": gramm,
    "color": color,
    "ishlab_chiqarish_turi": ishlabChiqarishTuri,
    "mahsulot_tola": mahsulotTola,
    "brand": brand,
    "user": user,
    "likes": likes,
    "views": views,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "photos": List<dynamic>.from(photos.map((x) => x)),
    "owner": owner.toJson(),
    "pivot": pivot.toJson(),
  };

  @override
  String toString() {
    return 'Product{category: $category, user: $user, photos: $photos, owner: $owner}';
  }
}

class User {
  int id;
  String firstName;
  String lastName;
  String phone;
  String username;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    phone: json["phone"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "phone": phone,
    "username": username,
  };
}

class Pivot {
  String orderId;
  String productId;
  String quantity;


  Pivot({
    required this.orderId,
    required this.productId,
    required this.quantity,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    orderId: json["order_id"],
    productId: json["product_id"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "product_id": productId,
    "quantity": quantity,
  };

  @override
  String toString() {
    return 'Pivot{orderId: $orderId, productId: $productId, quantity: $quantity}';
  }
}

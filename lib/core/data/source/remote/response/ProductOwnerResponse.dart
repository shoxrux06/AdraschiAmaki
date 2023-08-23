import 'GetProfileResponse.dart';

class ProductOwnerResponse {
  ProductOwnerResponse({
    required this.status,
    required this.user,
    required this.products,
  });

  bool status;
  User user;
  List<ProductDetail> products;

  factory ProductOwnerResponse.fromJson(Map<String, dynamic> json) => ProductOwnerResponse(
        status: json["status"],
        user: User.fromJson(json["user"]),
        products: List<ProductDetail>.from(json["products"].map((x) => ProductDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "user": user.toJson(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class User {
  User({
    required this.id,
    required this.fullname,
    required this.username,
    required this.phone,
    required this.status,
    required this.address,
    required this.additionalAddress,
    required this.productNumber,
    required this.phoneVerifiedAt,
    required this.role,
    this.adminUserCategory,
    required this.createdAt,
    required this.updatedAt,
    this.avatar,
    required this.views,
    required this.blocked,
  });

  int id;
  String fullname;
  String username;
  String phone;
  String status;
  String? address;
  String? additionalAddress;
  int productNumber;
  DateTime phoneVerifiedAt;
  int role;
  String? adminUserCategory;
  DateTime createdAt;
  DateTime updatedAt;
  String? avatar;
  int views;
  String blocked;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullname: json["fullname"],
        username: json["username"],
        phone: json["phone"],
        status: json["status"],
        address: json["address"] ?? "",
        additionalAddress: json["additionalAddress"] ?? "",
        productNumber: json["product_number"],
        phoneVerifiedAt: DateTime.parse(json["phone_verified_at"]),
        role: json["role"],
        adminUserCategory: json["admin_user_category"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        avatar: json["avatar"] ?? "",
        views: json["views"],
        blocked: json["blocked"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "username": username,
        "phone": phone,
        "status": status,
        "address": address,
        "additionalAddress": additionalAddress,
        "product_number": productNumber,
        "phone_verified_at": phoneVerifiedAt.toIso8601String(),
        "role": role,
        "admin_user_category": adminUserCategory,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "avatar": avatar,
        "views": views,
        "blocked": blocked,
      };
}

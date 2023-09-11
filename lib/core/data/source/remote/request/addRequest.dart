import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

String productResponseToJson(CreateRequest data) => json.encode(data.toJson());

class CreateRequest {
  int? categoryId;
  int? price;
  List<File>? photos;
  String? eni;
  String? boyi;
  String? color;
  int? ishlabChiqarishTuri;
  int? mahsulotTolaId;
  String? brand;
  String? gramm;
  int? discountPrice;
  int? rulomPrice;

  CreateRequest({
    required this.categoryId,
    required this.price,
    required this.photos,
    required this.eni,
    required this.boyi,
    required this.color,
    required this.ishlabChiqarishTuri,
    required this.mahsulotTolaId,
    required this.brand,
    required this.gramm,
    required this.discountPrice,
    required this.rulomPrice,
  });

  Future<Map<String, dynamic>> toJson() async {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['category_id'] = categoryId;
    json['price'] = price;
    json['photos[]'] = await Future.wait(photos!.map((photo) async {
      return await MultipartFile.fromFile(photo.path);
    }));
    json['eni'] = eni;
    json['boyi'] = boyi;
    json['color'] = color;
    json['ishlab_chiqarish_turi'] = ishlabChiqarishTuri;
    json['mahsulot_tola_id'] = mahsulotTolaId;
    json['brand'] = brand;
    json['gramm'] = gramm;
    json['discount'] = discountPrice;
    json['rulom_narx'] = rulomPrice;
    return json;
  }
}

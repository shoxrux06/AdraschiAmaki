import 'dart:io';
import 'package:afisha_market/core/data/source/remote/response/addResponse.dart';
import 'package:afisha_market/core/data/source/remote/response/status_and_message_response.dart';
import 'package:flutter/material.dart';

import '../../data/source/remote/response/CategoryResponse.dart';
import '../../data/source/remote/response/material_type_response.dart';
import '../../data/source/remote/response/production_types_response.dart';
import '../../handlers/network_exceptions.dart';

enum Status { initial, loading, success, fail }

@immutable
class CreateState {
  final Status status;
  final List<File> photos;
  final String name;
  final int cost;
  final String desc;
  final int category;
  final int region;
  final String color;
  final String compatibility;
  final CreateResponse createResponse;
  final StatusAndMessageResponse? statusAndMessageResponse;
  final NetworkExceptions? networkExceptions;
  final bool isCreatingProduct;
  final bool isUploaded;
  final bool isUpdatingProduct;
  final bool isUpdated;
  final bool isDeletingProduct;
  final bool isDeleted;
  final CategoryResponse? categoryResponse;
  final ProductionTypesResponse? productionTypes;
  final MaterialTypeResponse? materialTypeResponse;

  const CreateState({
    this.status = Status.initial,
    this.photos = const [],
    this.name = '',
    this.cost = 0,
    this.region = 1,
    this.desc = '',
    this.color = '',
    this.category = 8,
    this.compatibility = '',
    required this.createResponse,
    this.statusAndMessageResponse,
    this.networkExceptions,
    this.isCreatingProduct = false,
    this.isUploaded = false,
    this.isUpdatingProduct = false,
    this.isUpdated = false,
    this.isDeletingProduct = false,
    this.isDeleted = false,
    this.categoryResponse,
    this.productionTypes,
    this.materialTypeResponse,
  });

  CreateState copyWith({
    Status? status,
    List<File>? photos,
    String? name,
    int? cost,
    String? desc,
    int? category,
    int? region,
    String? color,
    String? compatibility,
    CreateResponse? createResponse,
    StatusAndMessageResponse? statusAndMessageResponse,
    NetworkExceptions? networkExceptions,
    bool? isCreatingProduct,
    bool? isUploaded,
    bool? isUpdatingProduct,
    bool? isUpdated,
    bool? isDeletingProduct,
    bool? isDeleted,
    CategoryResponse? categoryResponse,
    ProductionTypesResponse? productionTypes,
    MaterialTypeResponse? materialTypeResponse
  }) {
    return CreateState(
      status: status ?? this.status,
      photos: photos ?? this.photos,
      name: name ?? this.name,
      cost: cost ?? this.cost,
      region: region ?? this.region,
      desc: desc ?? this.desc,
      category: category ?? this.category,
      color: color ?? this.color,
      compatibility: compatibility ?? this.compatibility,
      createResponse: createResponse ?? this.createResponse,
      statusAndMessageResponse: statusAndMessageResponse ?? this.statusAndMessageResponse,
      networkExceptions: networkExceptions ?? this.networkExceptions,
      isCreatingProduct: isCreatingProduct ?? this.isCreatingProduct,
      isUploaded: isUploaded ?? this.isUploaded,
      isUpdatingProduct: isUpdatingProduct ?? this.isUpdatingProduct,
      isUpdated: isUpdated??this.isUpdated,
      isDeletingProduct: isDeletingProduct??this.isDeletingProduct,
      isDeleted: isDeleted??this.isDeleted,
      categoryResponse: categoryResponse??this.categoryResponse,
      productionTypes: productionTypes??this.productionTypes,
      materialTypeResponse: materialTypeResponse??this.materialTypeResponse,
    );
  }
}

import 'package:afisha_market/core/data/source/remote/request/addRequest.dart';
import 'package:flutter/cupertino.dart';

abstract class CreateEvent {}

class CreateInitialEvent extends CreateEvent {}

class CreateSuccessEvent extends CreateEvent {
  final BuildContext context;
  final CreateRequest createRequest;

  CreateSuccessEvent(this.context,this.createRequest);
}

class UpdateSuccessEvent extends CreateEvent {
  final BuildContext context;
  final CreateRequest createRequest;
  final int id;

  UpdateSuccessEvent(this.context,this.createRequest,this.id);
}

class DeleteSuccessEvent extends CreateEvent {
  final BuildContext context;
  final int id;

  DeleteSuccessEvent(this.context,this.id);
}

class CreateErrorEvent extends CreateEvent {}

class FetchCategoriesEvent extends CreateEvent {}

class FetchProductionTypesEvent extends CreateEvent {}

class FetchMaterialTypesEvent extends CreateEvent {}

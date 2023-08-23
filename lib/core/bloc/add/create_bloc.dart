import 'package:afisha_market/core/bloc/add/create_event.dart';
import 'package:afisha_market/core/bloc/add/create_state.dart';
import 'package:afisha_market/core/data/repository/product_repository.dart';
import 'package:afisha_market/core/data/source/remote/response/addResponse.dart';
import 'package:afisha_market/core/data/source/remote/response/status_and_message_response.dart';
import 'package:afisha_market/core/handlers/network_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateBloc extends Bloc<CreateEvent, CreateState> {
  final ProductRepository productRepository;

  CreateBloc(this.productRepository) : super(CreateState(createResponse: CreateResponse())) {
    on<CreateInitialEvent>((event, emit) {
      emit(state.copyWith(
        status: Status.initial,
        photos: [],
        name: '',
        cost: 0,
        desc: '',
        category: 8,
        color: '',
        compatibility: '',
        isCreatingProduct: false,
        statusAndMessageResponse:
            StatusAndMessageResponse(status: false, message: ''),
        isUploaded: false,
      ));
    });

    on<CreateSuccessEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading, isCreatingProduct: true));
      try {
        var response = await productRepository.createProduct(event.context,event.createRequest);
        response.when(
          success: (data) {
            emit(state.copyWith(
              status: Status.success,
              createResponse: data,
              isCreatingProduct: false,
              isUploaded: true,
            ));
          },
          failure: (failure) {
            emit(state.copyWith(
                status: Status.fail,
                isCreatingProduct: false,
                isUploaded: false,
                networkExceptions: failure));
          },
        );
      } on DioError catch (e) {
        emit(
          state.copyWith(
            statusAndMessageResponse: StatusAndMessageResponse.fromJson(e.response?.data ?? {}),
              isCreatingProduct: false,
              isUploaded: false,
              networkExceptions: e.type.runtimeType as NetworkExceptions
          ),
        );
      } catch (e) {

      }
    });

    on<UpdateSuccessEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading, isUpdatingProduct: true));
      try {
        var response = await productRepository.updateProduct(event.context,event.createRequest, event.id);
        response.when(
          success: (data) {
            emit(state.copyWith(
              status: Status.success,
              createResponse: data,
              isUpdatingProduct: false,
              isUpdated: true,
            )
            );
          },
          failure: (failure) {
            emit(state.copyWith(
                status: Status.fail,
                isUpdatingProduct: false,
                isUpdated: false,
                networkExceptions: failure,
            ));
          },
        );
      } on DioError catch (e) {
        emit(
          state.copyWith(
              statusAndMessageResponse: StatusAndMessageResponse.fromJson(e.response?.data ?? {}),
              isUpdatingProduct: false,
              isUpdated: false,
              networkExceptions: e.type.runtimeType as NetworkExceptions
          ),
        );
      } catch (e) {}
    });

    on<DeleteSuccessEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading, isDeletingProduct: true));
      try {
        var response = await productRepository.deleteProduct(event.context,event.id);
        response.when(
          success: (data) {
            emit(state.copyWith(
              status: Status.success,
              statusAndMessageResponse: data,
              isDeletingProduct: false,
              isDeleted: true,
            ));
          },
          failure: (failure) {
            emit(state.copyWith(
              status: Status.fail,
              isDeletingProduct: false,
              isDeleted: false,
              networkExceptions: failure,
            ));
          },
        );
      } on DioError catch (e) {
        emit(
          state.copyWith(
              statusAndMessageResponse: StatusAndMessageResponse.fromJson(e.response?.data ?? {}),
              isDeletingProduct: false,
              isDeleted: false,
              networkExceptions: e.type.runtimeType as NetworkExceptions
          ),
        );
      } catch (e) {}
    });

    on<FetchCategoriesEvent>((event, emit) async {
      emit(state.copyWith());
      try {
        var response = await productRepository.getProductCategoryList();
        response.when(
          success: (data) {
            emit(state.copyWith(
              categoryResponse: data,
            ));
          },
          failure: (failure) {
            emit(state.copyWith(
              networkExceptions: failure,
            ));
          },
        );
      } on DioError catch (e) {
        emit(
          state.copyWith(
              statusAndMessageResponse: StatusAndMessageResponse.fromJson(e.response?.data ?? {}),
              networkExceptions: e.type.runtimeType as NetworkExceptions
          ),
        );
      } catch (e) {}
    });

    on<FetchProductionTypesEvent>((event, emit) async {
      emit(state.copyWith());
      try {
        var response = await productRepository.getProductionTypes();
        response.when(
          success: (data) {
            emit(state.copyWith(
              productionTypes: data,
            ));
          },
          failure: (failure) {
            emit(state.copyWith(
              networkExceptions: failure,
            ));
          },
        );
      } on DioError catch (e) {
        emit(
          state.copyWith(
              statusAndMessageResponse: StatusAndMessageResponse.fromJson(e.response?.data ?? {}),
              networkExceptions: e.type.runtimeType as NetworkExceptions
          ),
        );
      } catch (e) {}
    });

    on<FetchMaterialTypesEvent>((event, emit) async {
      emit(state.copyWith());
      try {
        var response = await productRepository.getMaterialTypes();
        response.when(
          success: (data) {
            emit(state.copyWith(
              materialTypeResponse: data,
            ));
          },
          failure: (failure) {
            emit(state.copyWith(
              networkExceptions: failure,
            ));
          },
        );
      } on DioError catch (e) {
        emit(
          state.copyWith(
              statusAndMessageResponse: StatusAndMessageResponse.fromJson(e.response?.data ?? {}),
              networkExceptions: e.type.runtimeType as NetworkExceptions
          ),
        );
      } catch (e) {}
    });



  }
}

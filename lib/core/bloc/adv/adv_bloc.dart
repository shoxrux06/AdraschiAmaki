
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/adv_repository.dart';
import 'adv_event.dart';
import 'adv_state.dart';

class AdvBloc extends Bloc<AdvEvent,AdvState>{
  final AdvRepository advRepository;
  AdvBloc(this.advRepository): super(AdvState()){
    on<AdvAddEvent>((event, emit) async{
      emit(state.copyWith(advIsAdding: true));
      try {
        var response = await advRepository.postAds(event.context, event.images);
        response.when(
          success: (data) {
            emit(state.copyWith(
              advAddResponse: data,
              advIsAdding: false,
              advIsAdded: true
            ));
          },
          failure: (failure) {
            emit(state.copyWith());
          },
        );
      } on DioError catch (e) {
        emit(
          state.copyWith(

          ),
        );
      } catch (e) {

      }
    });
  }


}
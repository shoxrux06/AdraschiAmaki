import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  GalleryBloc() : super(GalleryState()) {
    on<GalleryEvent>((event, emit) {
      if(event is ImagePickedEvent){
        emit(GalleryState(imageFile: event.imageFile));
      }
    });
  }
}

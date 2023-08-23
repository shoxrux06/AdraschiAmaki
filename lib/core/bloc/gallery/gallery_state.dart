part of 'gallery_bloc.dart';

class GalleryState {
  File? imageFile;

  GalleryState({
    this.imageFile
});
  GalleryState copyWith({File? imageFile}) {
    return  GalleryState(imageFile: imageFile??this.imageFile);
  }
}


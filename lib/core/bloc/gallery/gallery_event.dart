part of 'gallery_bloc.dart';

@immutable
abstract class GalleryEvent {}

class ImagePickedEvent extends GalleryEvent {
  final File imageFile;

  ImagePickedEvent(this.imageFile);
}

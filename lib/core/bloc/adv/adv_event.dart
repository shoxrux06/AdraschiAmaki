import 'dart:io';

import 'package:flutter/cupertino.dart';

abstract class AdvEvent{}

class AdvAddEvent extends AdvEvent{
  final BuildContext context;
  final List<File> images;

  AdvAddEvent({
    required this.context,
    required this.images
});
}
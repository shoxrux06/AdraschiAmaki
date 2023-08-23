import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/bloc/gallery/gallery_bloc.dart';

class CircleImage extends StatefulWidget {
  const CircleImage({Key? key}) : super(key: key);

  @override
  State<CircleImage> createState() => _CircleImageState();
}

class _CircleImageState extends State<CircleImage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryBloc, GalleryState>(
        builder: (context, state) => state.imageFile != null
            ? Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: Image.file(
                    state.imageFile ?? File('path'),
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : Container(
                child: Text('Select Image'),
              ));
  }
}

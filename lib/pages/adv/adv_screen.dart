import 'dart:io';
import 'package:afisha_market/core/bloc/adv/adv_bloc.dart';
import 'package:afisha_market/core/bloc/adv/adv_event.dart';
import 'package:afisha_market/core/bloc/adv/adv_state.dart';
import 'package:afisha_market/core/constants/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/utils/app_helpers.dart';
import '../add/video_widget.dart';
import '../utils/const.dart';
import '../utils/custom_button.dart';
import '../utils/custom_button_two.dart';

class AdvScreen extends StatefulWidget {
  const AdvScreen({super.key});

  @override
  State<AdvScreen> createState() => _AdvScreenState();
}

class _AdvScreenState extends State<AdvScreen> {
  List<File> selectedImages = [];
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final l10n = AppLocalizations.of(context);
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              height: height / 2,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InkWell(
                      onTap: selectedImages.length >= 8
                          ? () {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Rasmlar soni 8 tadan oshmasligi kerak')));
                      } : () {
                        if (selectedImages.length >= 8) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Rasmlar soni 8 tadan oshmasligi kerak')));
                        }
                        showModalBottomSheet(context: context, builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomButtonTwo('${l10n?.image}',onTap: (){ getImages();},),
                                CustomButtonTwo('${l10n?.video}',onTap: (){ getVideos();},),
                              ],
                            ),
                          );
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: mainColor,
                                width: 2)),
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              l10n?.selectImageFromGallery ?? '',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceEvenly,
                        children: [
                          customImageContainer(0, 1),
                          customImageContainer(1, 2),
                          customImageContainer(2, 3),
                          customImageContainer(3, 4),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          customImageContainer(4, 5),
                          customImageContainer(5, 6),
                          customImageContainer(6, 7),
                          customImageContainer(7, 8),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BlocConsumer<AdvBloc, AdvState>(
              listener: (context,state){
                if(state.advIsAdded?? false){
                  Navigator.of(context).pushReplacementNamed(AppRoutes.main);
                }
              },
              builder: (context, state){
                return  CustomButton(
                  l10n!.publish,
                  isLoading: state.advIsAdding??false,
                  onTap:(){
                    if (selectedImages.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Something went wrong')));
                    }else {
                      context.read<AdvBloc>().add(AdvAddEvent(context: context, images: selectedImages));
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget customImageContainer(int index, int size) {
    return Container(
      width: MediaQuery.of(context).size.width / 5.5,
      height: 100,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 2),
          borderRadius: BorderRadius.circular(8)),
      child: (selectedImages.length >= size)
          ? Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: (
                    selectedImages[index].path.substring(
                        selectedImages[index].path.lastIndexOf('.') + 1,
                        selectedImages[index].path.length) == 'mp4' ||
                        selectedImages[index].path.substring(
                            selectedImages[index].path.lastIndexOf('.') + 1,
                            selectedImages[index].path.length) == 'm4p' ||
                        selectedImages[index].path.substring(
                            selectedImages[index].path.lastIndexOf('.') + 1,
                            selectedImages[index].path.length) == 'mov'
                ) ?
                VideoWidget(selectedImages[index]) : Image.file(
                  File(
                    selectedImages[index].path,
                  ),
                  fit: BoxFit.fill,
                )),
          ),
          Positioned(
              right: -5,
              top: -10,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      selectedImages.removeAt(index);
                    });
                  },
                  icon: const Icon(
                    Icons.cancel,
                    color: Colors.white,
                  ))
          )
        ],
      )
          : Container(),
    );
  }

  Future getImages() async {
    final pickedFile = await picker.pickMultiImage(imageQuality: 100, maxHeight: 1000, maxWidth: 1000);
    List<File> filePick = pickedFile.map<File>((e) => File(e.path)).toList();
    setState(() {
      if (filePick.isNotEmpty) {
        for (var i = 0; i < filePick.length; i++) {
          selectedImages.add(filePick[i]);
        }
        Navigator.of(context).pop();
      }
      else {
        AppHelpers.showSnackBar(context,'Nothing is selected');
      }
    },
    );
  }

  Future getVideos() async {
    final pickedVideo = await picker.pickVideo(source: ImageSource.gallery);
    setState(() {
      if (pickedVideo?.path.isNotEmpty ?? false) {
        final myFile = File(pickedVideo?.path ?? '');
        selectedImages.add(myFile);
        Navigator.of(context).pop();
      }
      else {
        AppHelpers.showSnackBar(context,'Nothing is selected');
      }
    },
    );
  }
}

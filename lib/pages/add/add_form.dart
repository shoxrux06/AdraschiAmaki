import 'dart:io';
import 'dart:math';
import 'package:afisha_market/core/bloc/add/create_bloc.dart';
import 'package:afisha_market/core/bloc/add/create_event.dart';
import 'package:afisha_market/core/bloc/add/create_state.dart';
import 'package:afisha_market/core/bloc/home/home_bloc.dart';
import 'package:afisha_market/core/data/source/remote/request/addRequest.dart';
import 'package:afisha_market/core/data/source/remote/response/RegionResponse.dart';
import 'package:afisha_market/core/data/source/remote/response/material_type_response.dart';
import 'package:afisha_market/core/data/source/remote/response/production_types_response.dart';
import 'package:afisha_market/core/utils/app_helpers.dart';
import 'package:afisha_market/pages/add/video_widget.dart';
import 'package:afisha_market/pages/utils/const.dart';
import 'package:afisha_market/pages/utils/custom_button_two.dart';
import 'package:afisha_market/pages/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:path_provider/path_provider.dart';
import '../../core/data/source/remote/response/CategoryResponse.dart';
import '../../core/data/source/remote/response/GetProfileResponse.dart';
import '../main_container.dart';
import '../utils/custom_border_button.dart';
import '../utils/custom_button.dart';
import 'package:http/http.dart' as http;

class AddScreenForm extends StatefulWidget {
  final ProductDetail? productDetail;

  const AddScreenForm({Key? key, this.productDetail}) : super(key: key);

  @override
  State<AddScreenForm> createState() => _AddScreenFormState();
}
class _AddScreenFormState extends State<AddScreenForm> {
  late CreateBloc _createBloc;
  List<File> selectedImages = [];
  List<District> districtList = [];

  bool isHaveAdditionalParams = false;

  final picker = ImagePicker();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final _costController = TextEditingController(text: widget.productDetail?.price.toString());
  late final _widthController = TextEditingController(text: widget.productDetail?.body);
  late final _highController = TextEditingController(text: widget.productDetail?.body);
  late final _colorController = TextEditingController(text: widget.productDetail?.color);
  late final _discountController = TextEditingController(text: widget.productDetail?.color);
  late final _brandController = TextEditingController(text: widget.productDetail?.compatibility);
  late final _grammController = TextEditingController(text: widget.productDetail?.district);
  late final _sizeController = TextEditingController(text: widget.productDetail?.district);

  String capitalize(String value) {
    var result = value[0].toUpperCase();
    bool cap = true;
    for (int i = 1; i < value.length; i++) {
      if (value[i - 1] == " " && cap == true) {
        result = result + value[i].toUpperCase();
      } else {
        result = result + value[i];
        cap = false;
      }
    }
    return result;
  }

  Future<List<File>> urlToFile() async {
    final List<File> tempList = [];
    int l = widget.productDetail?.photos.length??0;
    for(int i = 0;i<l;i++){
      var rng =  Random();
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      File file =  File('$tempPath${rng.nextInt(100)}.png');
      http.Response response = await http.get(Uri.parse('${widget.productDetail?.photos[i]}'));
      await file.writeAsBytes(response.bodyBytes);
      tempList.add(file);
    }
    return tempList;
  }

  Map<String,dynamic> myMap = {};

  getImages2()async{
    selectedImages = await urlToFile();
    setState(() {});
    print('SEL IMAGES --> $selectedImages');
  }

  @override
  void initState() {
    context.read<HomeBloc>().add(HomeInitEvent());
    context.read<CreateBloc>().add(FetchCategoriesEvent());
    context.read<CreateBloc>().add(FetchProductionTypesEvent());
    context.read<CreateBloc>().add(FetchMaterialTypesEvent());
    super.initState();
    setState(() {
      getImages2();
    });
    _createBloc = BlocProvider.of<CreateBloc>(context);
  }


  @override
  void dispose() {
    _costController.dispose();
    _widthController.dispose();
    _colorController.dispose();
    _discountController.dispose();
    _sizeController.dispose();
    _brandController.dispose();
    _grammController.dispose();
    super.dispose();
  }

  String? dropdownValueCategory;
  int? dropdownValueCategoryId;

  String? dropdownValueProductionType;
  int? dropdownValueProductionTypeId;

  String? dropdownValueProductFiber;
  int? dropdownValueProductFiberId;

  int? categoryId;
  int? selectedRegionId;
  int? selectedDistrictId;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final l10n = AppLocalizations.of(context);
    String categoryString = AppLocalizations.of(context)!.categories;
    List<String> categories = categoryString.split(':');
    print('categorise : $categories');
    return LayoutBuilder(builder: (context, constraint) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraint.maxHeight),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: BlocConsumer<CreateBloc, CreateState>(listener: (context, state) {
                if (state.isUploaded ) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Tovar muaffaqiyatli qo\'shildi')));
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => MainContainer()));
                }
                if (state.isUpdated) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Tovar muaffaqiyatli yangilandi')));
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => MainContainer(isFromProfile: true,)));
                }
                if (state.isDeleted) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Tovar muaffaqiyatli o\'chirildi')));
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const MainContainer(isFromProfile: true,)));
                }
              }, builder: (context, state) {
                return Form(
                  key: _formKey,
                  child: Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: height / 3,
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
                                          color: textFieldColor,
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(
                                              color: mainColor,
                                              width: 2
                                          )
                                      ),
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
                        ),
                        const SizedBox(height: 20,),
                        DropdownButtonFormField(
                            value: dropdownValueCategory,
                            icon: const Icon(Icons.arrow_drop_down),
                            elevation: 16,
                            isExpanded: true,
                            isDense: true,
                            dropdownColor: helperColor,
                            style: TextStyle(color: disableColor),
                            decoration: AppHelpers.decoration(
                                isHintText: true,
                                text:  l10n?.category ?? '',
                            ),
                            items: state.categoryResponse?.categories.map<DropdownMenuItem<String>>((Category value) {
                              return DropdownMenuItem<String>(
                                value: value.name,
                                child: Text(value.name),
                              );
                            }).toList(),
                            validator: (val){
                              if (val == null) {
                                return 'Iltimos kategoriyani tanlang';
                              }
                            },
                            onChanged: (String? value) {
                              final categories = state.categoryResponse?.categories;
                              categories?.forEach((cat) {
                                if(cat.name == value){
                                  dropdownValueCategoryId = cat.id;
                                  print('dropdownValueCategoryId >> $dropdownValueCategoryId');
                                }
                              });
                              setState(() {
                                dropdownValueCategory = value!;
                              });
                            }),
                        const SizedBox(height: 20,),
                        MyTextFormField2(
                          l10n?.price ?? '',
                          null,
                          _costController,
                          keyboardType: TextInputType.number,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Iltimos maydonni to\'ldiring';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20,),
                        MyTextFormField2(
                          l10n?.rulomPrice ?? '',
                          null,
                          _sizeController,
                          keyboardType: TextInputType.number,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Iltimos maydonni to\'ldiring';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20,),
                        MyTextFormField2(
                          l10n?.color ?? '',
                          null,
                          _colorController,
                          onChanged: (val){
                            _colorController.value = TextEditingValue(
                              text: capitalize(val??''),
                              selection: _colorController.selection,
                            );
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Iltimos maydonni to\'ldiring';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 20,),
                        DropdownButtonFormField(
                            value: dropdownValueProductionType,
                            icon: const Icon(Icons.arrow_drop_down),
                            elevation: 16,
                            isExpanded: true,
                            isDense: true,
                            dropdownColor: helperColor,
                            style: TextStyle(color: disableColor),
                            decoration: AppHelpers.decoration(
                              isHintText: true,
                              text:  l10n?.productionType ?? '',
                            ),
                            items: state.productionTypes?.ishlabChiqarishlar.map<DropdownMenuItem<String>>((IshlabChiqarishlar value) {
                              return DropdownMenuItem<String>(
                                value: value.name,
                                child: Text(value.name),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              final ishlabChiraqishlar = state.productionTypes?.ishlabChiqarishlar;
                              ishlabChiraqishlar?.forEach((element) {
                                if(value == element.name){
                                  dropdownValueProductionTypeId = element.id;
                                  print('dropdownValueProductionTypeId >> $dropdownValueProductionTypeId');
                                }
                              });
                              setState(() {
                                dropdownValueProductionType = value!;
                              });
                            },
                            validator: (val){
                              if (val == null) {
                                return 'Iltimos ishlab chiqarish turini tanlang';
                              }
                        },
                            ),
                        const SizedBox(height: 20,),
                        DropdownButtonFormField(
                            value: dropdownValueProductFiber,
                            icon: const Icon(Icons.arrow_drop_down),
                            elevation: 16,
                            isExpanded: true,
                            isDense: true,
                            dropdownColor: helperColor,
                            style: TextStyle(color: disableColor),
                            decoration: AppHelpers.decoration(
                              isHintText: true,
                              text:  l10n?.productFiber ?? '',
                            ),
                            items: state.materialTypeResponse?.mahsulotTolasi.map<DropdownMenuItem<String>>((MahsulotTolasi value) {
                              return DropdownMenuItem<String>(
                                value: value.name,
                                child: Text(value.name),
                              );
                            }).toList(),
                            validator: (val){
                              if (val == null) {
                                return 'Iltimos mahsulot tolasini tanlang';
                              }
                            },
                            onChanged: (String? value) {
                              final mahsulotTolasiList = state.materialTypeResponse?.mahsulotTolasi;
                              mahsulotTolasiList?.forEach((element) {
                                if(value == element.name){
                                  dropdownValueProductFiberId = element.id;
                                  print('dropdownValueProductFiberId >> $dropdownValueProductFiberId');
                                }
                              });
                              setState(() {
                                dropdownValueProductFiber = value!;
                              });
                            }),

                        const SizedBox(height: 20,),
                        MyTextFormField2(
                          l10n?.brand ?? '',
                          null,
                          _brandController,
                          onChanged: (val){
                            _brandController.value = TextEditingValue(
                              text: capitalize(val??''),
                              selection: _brandController.selection,
                            );
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Iltimos maydonni to\'ldiring';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20,),
                        MyTextFormField2(
                          l10n?.gram ?? '',
                          null,
                          _grammController,
                          keyboardType: TextInputType.number,
                          suffixText: 'gramm',
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Iltimos maydonni to\'ldiring';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20,),
                        const SizedBox(
                          height: 20,
                        ),
                        CheckboxListTile(
                          title: Text('${l10n?.discount}'),
                            value: isHaveAdditionalParams,
                            onChanged: (val){
                            setState(() {
                              isHaveAdditionalParams = !isHaveAdditionalParams;
                            });

                        }),
                        const SizedBox(
                          height: 20,
                        ),
                        isHaveAdditionalParams? MyTextFormField2(
                          '20 %' ?? '',
                          null,
                          _discountController,
                          keyboardType: TextInputType.number,
                          suffixText: '%',
                          // validator: (val) {
                          //   if (val!.isEmpty) {
                          //     return 'Iltimos maydonni to\'ldiring';
                          //   }
                          //   return null;
                          // },
                        ): Container(),
                        const SizedBox(
                          height: 20,
                        ),
                        isHaveAdditionalParams?MyTextFormField2(
                          l10n?.width ?? '',
                          null,
                          _widthController,
                          suffixText: 'sm',
                          keyboardType: TextInputType.number,
                          // validator: (val) {
                          //   if (val!.isEmpty) {
                          //     return 'Iltimos maydonni to\'ldiring';
                          //   }
                          //   return null;
                          // },
                        ): Container(),
                        const SizedBox(
                          height: 20,
                        ),
                        isHaveAdditionalParams?MyTextFormField2(
                          l10n?.height ?? '',
                          null,
                          _highController,
                          keyboardType: TextInputType.number,
                          suffixText: 'metr',
                          // validator: (val) {
                          //   if (val!.isEmpty) {
                          //     return 'Iltimos maydonni to\'ldiring';
                          //   }
                          //   return null;
                          // },
                        ): Container() ,
                        SizedBox(height: isHaveAdditionalParams?20:0,),
                        CustomButton(
                          widget.productDetail == null
                              ? l10n?.publish ?? ''
                              : l10n?.edit ?? '',
                          isLoading:  widget.productDetail == null?state.isCreatingProduct: state.isUpdatingProduct,
                          onTap:widget.productDetail == null? () {
                            bool isValid = _formKey.currentState!.validate();
                            if(isValid){
                              _createBloc.add(CreateSuccessEvent(
                                context,
                                CreateRequest(
                                    categoryId: dropdownValueCategoryId,
                                    price: int.parse(_costController.text),
                                    photos: selectedImages,
                                    eni: _widthController.text,
                                    boyi: _highController.text,
                                    color: _colorController.text,
                                    ishlabChiqarishTuri: dropdownValueProductionTypeId,
                                    mahsulotTolaId: dropdownValueProductFiberId,
                                    brand: _brandController.text,
                                    gramm: _grammController.text,
                                    discountPrice:int.tryParse(_discountController.text),
                                    rulomPrice: int.parse(_sizeController.text)
                                ),
                              ));
                            }
                          }:(){
                            bool isValid = _formKey.currentState!.validate();
                            if(isValid){
                              _createBloc.add(UpdateSuccessEvent(
                                  context,
                                  CreateRequest(
                                      categoryId: dropdownValueCategoryId,
                                      price: int.parse(_costController.text),
                                      photos: selectedImages,
                                      eni: _widthController.text,
                                      boyi: _highController.text,
                                      color: _colorController.text,
                                      ishlabChiqarishTuri: dropdownValueProductionTypeId,
                                      mahsulotTolaId: dropdownValueProductFiberId,
                                      brand: _brandController.text,
                                      gramm: _grammController.text,
                                      discountPrice: int.tryParse(_discountController.text??''),
                                      rulomPrice: int.parse(_sizeController.text)
                                  ),
                                  widget.productDetail?.id??0
                              ));
                            }
                          },
                        ),
                        widget.productDetail == null? Container():CustomBorderButton(
                          '${l10n?.delete}',
                          onTap: () {
                            _delete(context, widget.productDetail?.id??0);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      );
    });

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

  void _delete(BuildContext context, int id) {
    final l10n = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text('${l10n?.pleaseConfirm}'),
          content: Text('${l10n?.areYouSureDeleteThisProduct}'),
          actions: [
            // The "Yes" button
            TextButton(
              onPressed: () {
                context.read<CreateBloc>().add(DeleteSuccessEvent(context, id));
                Navigator.of(context).pop();
              },
              child: Text('${l10n?.yes}'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('${l10n?.no}'))
          ],
        );
      },
    );
  }


  bool isFieldsEmpty() => (_sizeController.text.isEmpty &&
      _costController.text.isEmpty &&
      _widthController.text.isEmpty &&
      _brandController.text.isEmpty &&
      _colorController.text.isEmpty
  );

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

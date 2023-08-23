import 'package:afisha_market/core/bloc/add/create_bloc.dart';
import 'package:afisha_market/core/bloc/add/create_state.dart';
import 'package:afisha_market/pages/add/add_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/data/source/remote/response/GetProfileResponse.dart';
import '../../core/di/dependency_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddScreen extends StatefulWidget {
  final ProductDetail? productDetail;

  const AddScreen({Key? key, this.productDetail}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  void initState() {
    // TODO: implement initState
    print('Add page');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print('PHOTOS -> ${widget.productDetail?.photos}');
    return BlocProvider(
      create: (_) => CreateBloc(productRepository),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            color: Colors.white,
            child: AddScreenForm(
              productDetail: widget.productDetail,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:afisha_market/core/data/source/remote/response/adv_add_response.dart';

class AdvState {
  final AdvAddResponse? addResponse;
  final bool? advIsAdding;
  final bool? advIsAdded;

  AdvState({this.addResponse, this.advIsAdding, this.advIsAdded});

  AdvState copyWith({
    AdvAddResponse? advAddResponse,
    bool? advIsAdding,
    bool? advIsAdded,
  }) {
    return AdvState(
      addResponse: addResponse ?? addResponse,
      advIsAdding: advIsAdding ?? advIsAdding,
      advIsAdded: advIsAdded ?? advIsAdded,
    );
  }
}

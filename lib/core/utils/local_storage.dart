import 'package:afisha_market/core/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences? _preferences;

  LocalStorage._();

  static LocalStorage? _localStorage;

  static LocalStorage instance = LocalStorage._();

  static Future<LocalStorage> getInstance() async {
    if (_localStorage == null) {
      _localStorage = LocalStorage._();
      await _localStorage?._init();
    }
    return _localStorage!;
  }

  Future<void> _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setToken(String? token) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.keyToken, token ?? '');
    }
  }

  String getToken() => _preferences?.getString(AppConstants.keyToken) ?? '';

  Future<void> setUserId(int? userId) async {
    if (_preferences != null) {
      await _preferences!.setInt(AppConstants.keyUserId, userId ?? 0);
    }
  }

  Future<void> setUserName(String? username) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.keyUserName, username ?? '');
    }
  }

  Future<void> setUserPhone(String? phone) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.keyUserPhone, phone ?? '');
    }
  }

  int getUserId() => _preferences?.getInt(AppConstants.keyUserId) ?? 0;

  String getUserName() =>
      _preferences?.getString(AppConstants.keyUserName) ?? '';

  String getUserPhone() =>
      _preferences?.getString(AppConstants.keyUserPhone) ?? '';

  void deleteToken() => _preferences?.remove(AppConstants.keyToken);

  void deleteUserId() => _preferences?.remove(AppConstants.keyUserId);

  void deleteUsername() => _preferences?.remove(AppConstants.keyUserName);

  void deleteUserPhone() => _preferences?.remove(AppConstants.keyUserPhone);

  Future<void> setLanguage(String? lang) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.keyLang, lang ?? '');
    }
  }

  String getLanguage() => _preferences?.getString(AppConstants.keyLang) ?? '';

  setFavProductIds(List<int> intProductIdList) async {
    List<String> stringProductIdList =
        intProductIdList.map((item) => item.toString()).toList();
    if (_preferences != null) {
      await _preferences?.setStringList(
          AppConstants.keyProductId, stringProductIdList);
    }
  }

  List<String> getFavProductIds() => _preferences?.getStringList(AppConstants.keyProductId)??[];
}

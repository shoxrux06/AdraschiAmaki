import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveHelper {
  late final Box _box;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init("${dir.path}afisha");
    _box = await Hive.openBox("data");
  }

  Future<void> saveToken(String? token) async {
    await _box.put("token", token);
  }

  String? getToken() {
    return _box.get("token");
  }
}

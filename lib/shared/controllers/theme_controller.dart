import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends ChangeNotifier {
  static const _k = 'isDark';
  bool _isDark;
  final SharedPreferences _prefs;

  ThemeController(this._isDark, this._prefs);

  bool get isDark => _isDark;

  Future<void> toggle() async {
    _isDark = !_isDark;
    await _prefs.setBool(_k, _isDark);
    notifyListeners();
  }

  static Future<ThemeController> bootstrap() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool(_k) ?? true;
    return ThemeController(isDark, prefs);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _mobileNo = await secureStorage.getString('ff_mobileNo') ?? _mobileNo;
    });
    await _safeInitAsync(() async {
      _ztoken = await secureStorage.getString('ff_ztoken') ?? _ztoken;
    });
    await _safeInitAsync(() async {
      _digitkey = await secureStorage.getString('ff_digitkey') ?? _digitkey;
    });
    await _safeInitAsync(() async {
      _token = await secureStorage.getString('ff_token') ?? _token;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _mobileNo = '';
  String get mobileNo => _mobileNo;
  set mobileNo(String value) {
    _mobileNo = value;
    secureStorage.setString('ff_mobileNo', value);
  }

  void deleteMobileNo() {
    secureStorage.delete(key: 'ff_mobileNo');
  }

  String _ztoken = '';
  String get ztoken => _ztoken;
  set ztoken(String value) {
    _ztoken = value;
    secureStorage.setString('ff_ztoken', value);
  }

  void deleteZtoken() {
    secureStorage.delete(key: 'ff_ztoken');
  }

  String _digitkey = '';
  String get digitkey => _digitkey;
  set digitkey(String value) {
    _digitkey = value;
    secureStorage.setString('ff_digitkey', value);
  }

  void deleteDigitkey() {
    secureStorage.delete(key: 'ff_digitkey');
  }

  String _token = '';
  String get token => _token;
  set token(String value) {
    _token = value;
    secureStorage.setString('ff_token', value);
  }

  void deleteToken() {
    secureStorage.delete(key: 'ff_token');
  }

  bool _videoComplete = false;
  bool get videoComplete => _videoComplete;
  set videoComplete(bool value) {
    _videoComplete = value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}

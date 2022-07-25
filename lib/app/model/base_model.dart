import 'dart:convert';

abstract class Model {

  Map<String, dynamic> toJson();

  @override
  String toString() {
    return toJson().toString();
  }

  String stringFromJson(
    Map<String, dynamic>? json,
    String attribute, {
    String defaultValue = '',
  }) {
    try {
      return json != null
          ? json[attribute] != null
              ? json[attribute].toString()
              : defaultValue
          : defaultValue;
    } catch (e) {
      return defaultValue;
    }
  }

  dynamic mapFromJson(
    Map<String, dynamic>? json,
    String attribute, {
    Map<dynamic, dynamic>? defaultValue,
  }) {
    try {
      return json != null
          ? json[attribute] != null
              ? jsonDecode(json[attribute] as String)
              : defaultValue ?? {}
          : defaultValue ?? {};
    } catch (e) {
      throw Exception('Error while parsing $attribute[${e.toString()}]');
    }
  }

  DateTime? dateFromJson(
    Map<String, dynamic>? json,
    String attribute, {
    DateTime? defaultValue,
  }) {
    try {
      return json != null
          ? json[attribute] != null
              ? DateTime.parse(json[attribute] as String).toLocal()
              : defaultValue
          : defaultValue;
    } catch (e) {
      return defaultValue;
    }
  }

  int intFromJson(
    Map<String, dynamic>? json,
    String attribute, {
    int defaultValue = 0,
  }) {
    try {
      if (json != null && json[attribute] != null) {
        if (json[attribute] is int) {
          return json[attribute] as int;
        }
        return int.parse(json[attribute] as String);
      }
      return defaultValue;
    } catch (e) {
      return defaultValue;
    }
  }

  double doubleFromJson(
    Map<String, dynamic>? json,
    String attribute, {
    int decimal = 2,
    double defaultValue = 0.0,
  }) {
    try {
      if (json != null && json[attribute] != null) {
        if (json[attribute] is double) {
          return double.parse(
            (json[attribute] as double).toStringAsFixed(decimal),
          );
        }
        if (json[attribute] is int) {
          return double.parse(
            (json[attribute] as int).toDouble().toStringAsFixed(decimal),
          );
        }
        return double.parse(
          double.tryParse(json[attribute] as String)!.toStringAsFixed(decimal),
        );
      }
      return double.parse(defaultValue.toStringAsFixed(decimal));
    } catch (e) {
      return defaultValue;
    }
  }

  bool boolFromJson(
    Map<String, dynamic>? json,
    String attribute, {
    bool defaultValue = false,
  }) {
    try {
      if (json != null && json[attribute] != null) {
        if (json[attribute] is bool) {
          return json[attribute] as bool;
        } else if ((json[attribute] is String) &&
            !['0', '', 'false'].contains(json[attribute])) {
          return true;
        } else if ((json[attribute] is int) &&
            ![0, -1].contains(json[attribute])) {
          return true;
        }
        return false;
      }
      return defaultValue;
    } catch (e) {
      return defaultValue;
    }
  }

  List<T> listFromJson<T>(
    Map<String, dynamic>? json,
    String attribute,
    T Function(Map<String, dynamic>) callback,
  ) {
    final List<T> list = <T>[];
    try {
      if (json != null &&
          json[attribute] != null &&
          json[attribute] is List &&
          (json[attribute] as List).isNotEmpty) {
        for (final v in json[attribute] as List) {
          if (v is Map<String, dynamic>) {
            list.add(callback(v));
          }
        }
      }
      return list;
    } catch (e) {
      return list;
    }
  }

  List<String> stringListFromJson<T>(
    Map<String, dynamic>? json,
    String attribute,
  ) {
    final List<String> list = <String>[];
    try {
      if (json != null &&
          json[attribute] != null &&
          json[attribute] is List &&
          (json[attribute] as List).isNotEmpty) {
        for (final v in json[attribute] as List) {
          if (v is String) {
            list.add(v);
          }
        }
      }
      return list;
    } catch (e) {
      return list;
    }
  }

  T objectFromJson<T>(
    Map<String, dynamic>? json,
    String attribute,
    T Function(Map<String, dynamic>) callback, {
    T? defaultValue,
  }) {
    try {
      if (json != null &&
          json[attribute] != null &&
          json[attribute] is Map<String, dynamic>) {
        return callback(json[attribute] as Map<String, dynamic>);
      }
      return defaultValue ?? T as T;
    } catch (e) {
      return defaultValue ?? T as T;
    }
  }
}

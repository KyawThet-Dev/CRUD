import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:xml/xml.dart' as xml;

extension DateTimeExt on DateTime {
  String formatWithDateFormat({
    String pattern = "d MMM, yyyy",
  }) {
    final formatted = DateFormat(pattern).format(this);
    return formatted;
  }

  DateTime get firstDateOfTheMonth => DateTime(year, month, 1);

  DateTime get lastDateOfTheMonth => DateTime(year, month + 1, 0);

  String toFormattedString([String pattern = 'dd/MM/yyyy']) {
    final formatter = DateFormat(pattern);
    return formatter.format(this);
  }

  String get yyyyMMddhhmmssa =>
      DateFormat('yyyy-MM-dd hh:mm:ss a').format(this);
}

extension StringExt on String {
  /// Convert [String] to [XmlDocument]
  xml.XmlDocument? get asXmlDocument {
    try {
      return xml.XmlDocument.parse(this);
    } on xml.XmlParserException catch (e) {
      if (kDebugMode) {
        print('XmlParserException: ${e.message}');
      }
      return null;
    }
  }

  /// [String] value of [XmlDocument]
  ///
  /// Return the concatenated text of this node and all its descendants,
  /// for [XmlData] nodes return the textual value of the node.
  // ignore: deprecated_member_use
  String get xmlToText => asXmlDocument?.text ?? '';

  /// Parses the xml string and returns the resulting Json object.
  dynamic get xmlToJson => jsonDecode(xmlToText);

  /// [String] to [num].
  num? get valNum => num.tryParse(this);

  /// [String] to [int].
  int? get valInt => int.tryParse(this);

  /// [String] to [double].
  double? get valDouble => double.tryParse(this);

  /// Check two strings are equal.
  bool areTheSame(String other) =>
      trim().toLowerCase() == other.trim().toLowerCase();

  /// [String] to [DateTime?]
  DateTime? toDateTime() {
    try {
      return DateTime.parse(this);
    } on FormatException catch (e) {
      return null;
    }
  }

  /// [String] to formatted [DateTime]
  String toFormattedDateTime({
    bool addJM = false,
  }) {
    final dateTime = toDateTime();

    if (dateTime == null) return this;

    final formattedDateTime = addJM
        ? DateFormat.yMMMd().add_jm().format(dateTime)
        : DateFormat.yMMMd().format(dateTime);
    return formattedDateTime;
  }

  /// Remove every `,` from [String]
  String get withoutComma => replaceAll(',', '');

  /// Format [int] value of [String] with thousand separator `,`.
  String get withCommaSeparated {
    var formatter = NumberFormat('#,##0,000');

    final value = valInt;

    if (value == null) return '0';

    if (value < 1000) {
      return '$value';
    } else {
      return formatter.format(value);
    }
  }

  String toSearchListDate(String tempDate) {
    DateFormat inputFormat = DateFormat('d MMM, yyyy');
    DateTime input = inputFormat.parse(tempDate);
    var date = DateFormat('dd/MM/yyyy').format(input);
    return date;
  }

  DateTime convertToDateTime({String pattern = "yyyy-MM-dd hh:mm:ss"}) {
    return DateFormat(pattern).parse(this);
  }

  TimeOfDay convertToTimeOfDay() {
    if (isEmpty) return TimeOfDay.now();

    final hrAndMin = split(":");

    if (hrAndMin.length < 2) {
      return TimeOfDay.now();
    }

    final hr = hrAndMin[0].valInt ?? 0;
    final min = hrAndMin[1].valInt ?? 0;
    return TimeOfDay(hour: hr, minute: min);
  }

  Future<String> imageToBase64() async {
    if (isEmpty) return '';

    File imageFile = File(this);
    Uint8List imageBytes = await imageFile.readAsBytes();
    final base64Image = base64.encode(imageBytes);
    return base64Image;
  }

  DateTime toDateTimeWithDF({String pattern = "yyyy-MM-dd hh:mm:ss"}) {
    return DateFormat(pattern).parse(this);
  }

  TimeOfDay toTimeOfDay() {
    if (isEmptyOrNull) return TimeOfDay.now();

    final hrAndMin = split(":");

    if (hrAndMin.length < 2) {
      return TimeOfDay.now();
    }

    final hr = hrAndMin[0].valInt ?? 0;
    final min = hrAndMin[1].valInt ?? 0;
    return TimeOfDay(hour: hr, minute: min);
  }
}

/// Extensions for nullable [String].
extension NullableStringX on String? {
  String validate({String value = ''}) {
    if (isEmptyOrNull) {
      return value;
    } else {
      return this!;
    }
  }

  /// Returns true if given String is null or isEmpty
  bool get isEmptyOrNull =>
      this == null ||
      (this != null && this!.isEmpty) ||
      (this != null && this! == 'null');
}

extension DoubleStringToIntString on String {
  String get toIntString => double.parse(this).toInt().numberFormatToString;
}

/// Extensions for nullable [int].
extension NulluableIntX on int? {
  int validate({int value = 0}) {
    return this ?? value;
  }
}

/// Extensions for [int].
extension IntX on int {
  /// [double] `bytes` value of [int] `bytes`.
  double get bytes => toDouble();

  /// Killobytes of a given [bytes].
  double get kb => bytes / 1024;

  /// Megabytes of a given [bytes].
  double get mb => kb / 1024;

  /// Giggabytes of a given [bytes].
  double get gb => mb / 1024;

  String get numberFormatToString => NumberFormat.decimalPattern().format(this);
}

/// Extensions for nullable [bool].
extension NullableBoolX on bool? {
  bool validate({bool value = false}) => this ?? value;
}

/// Extensions for nullable [double].
extension NullableDoubleX on double? {
  double validate({double value = 0.0}) => this ?? value;
}

extension DioErrorX on DioException {
  /// Check [DioException] is [SocketException] and [DioException.other].
  /// If result is `true`, it can be no connection error.
  ///
  /// Return `true` when the condition is true.
  bool get isNoConnectionError {
    return type == DioExceptionType.unknown && error is SocketException;
  }
}

/// Extensions for [BuildContext].
extension BuildContextX on BuildContext {
  /// Get [MediaQueryData] of widget on specific [BuildContext].
  MediaQueryData get mq => MediaQuery.of(this);

  /// Get the [Size] of layout on specific [BuildContext].
  Size get mqSize => mq.size;

  /// Get the width of layout on specific [BuildContext].
  double get mqWidth => mqSize.width;

  /// Get the height of layout on specific [BuildContext].
  double get mqHeight => mqSize.height;

  /// Get the `top` safearea padding on specific [BuildContext].
  double get safePaddingTop => mq.padding.top;

  /// Get the `bottom` safearea padding on specific [BuildContext].
  double get safePaddingBottom => mq.padding.bottom;

  // isWide
  // sm [Table Size]: Size(1024.0, 768.0)
  bool get isWide => mqSize.width > 1024;
  // huawei Table Size]: Size(732.0, 480.0)
  bool get isSmall => mqSize.width < 900;
}

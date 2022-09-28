import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var mainColor = Colors.blueGrey;

Uri getUri(String url) {
  return Uri.parse(url);
}

String getFormattedDate(String date) {
  return DateFormat.yMd().add_jm().format(DateTime.parse(date));
}

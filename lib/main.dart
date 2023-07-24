import 'package:birthday_app/feature/presentation/pages/birthday_app.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

void main() {
  AndroidYandexMap.useAndroidViewSurface = false;
  runApp(BirthdayApp());
}


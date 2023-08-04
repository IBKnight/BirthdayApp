import 'package:birthday_app/data/models/guest_model.dart';
import 'package:birthday_app/feature/presentation/pages/birthday_app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

void main() async {
  AndroidYandexMap.useAndroidViewSurface = false;
  await Hive.initFlutter();
  await Hive.deleteFromDisk();
  await Hive.deleteBoxFromDisk('guests');



  Hive.registerAdapter<GuestModel>(GuestModelAdapter());

  await Hive.openBox<GuestModel>("guests");

  runApp(const BirthdayApp());
}


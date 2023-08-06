import 'package:birthday_app/data/models/guests/guest_model.dart';
import 'package:birthday_app/presentation/pages/birthday_app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  AndroidYandexMap.useAndroidViewSurface = false;
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await Hive.initFlutter();

  Hive.registerAdapter<GuestModel>(GuestModelAdapter());
  await Hive.openBox<GuestModel>("guests");

  runApp(const BirthdayApp());
}

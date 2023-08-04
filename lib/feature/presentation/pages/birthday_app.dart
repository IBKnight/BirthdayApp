import 'package:birthday_app/common/router/router.dart';
import 'package:birthday_app/feature/bloc/guest_list_bloc/guest_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class BirthdayApp extends StatelessWidget {
  const BirthdayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GuestListBloc()..add(LoadGuestList()),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        splitScreenMode: true,
        builder: (context, child) =>
            MaterialApp.router(
              routerConfig: AppRouter.router,
              title: 'BirthDay App',
              theme: ThemeData(
                textTheme: GoogleFonts.jostTextTheme(),
              ),
              debugShowCheckedModeBanner: false,
              //home: HomePage(),
              // home: DetailScreen(),
            ),
      ),
    );
  }
}
//TODO: поместить блок провайдер на уровень выше того, где юзаю и передать его в боттом шит через BlocProvider.value();
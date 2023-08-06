import 'package:birthday_app/common/router/router.dart';
import 'package:birthday_app/feature/bloc/guest_list_bloc/guest_list_bloc.dart';
import 'package:birthday_app/feature/bloc/wishlist_bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BirthdayApp extends StatelessWidget {
  const BirthdayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GuestListBloc()..add(LoadGuestList()),
        ),
        BlocProvider(
          create: (context) => WishListBloc()..add(LoadWishList()),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        splitScreenMode: true,
        builder: (context, child) => MaterialApp.router(
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

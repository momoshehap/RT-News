import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rt_news/business_logic/cubit/newsCubit.dart';
import 'package:rt_news/presentation/screens/news_screen.dart';
import 'package:rt_news/service/local/shared_prefrence.dart';
import 'package:rt_news/service/remote/api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Helper.init();
  await Shared.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => NewsAppCubit()
            ..getBusiness()
            ..getScience()
            ..getSports(),
        ),
      ],
      child: MaterialApp(
        title: 'RT NEWS ',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 20,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarBrightness: Brightness.dark,
            ),
            titleTextStyle: TextStyle(
              color: Colors.lightGreen,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          textTheme: const TextTheme(
            bodyText1: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        themeMode: ThemeMode.light,
        darkTheme: ThemeData(
          scaffoldBackgroundColor: HexColor("333739"),
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: HexColor("333739"),
                statusBarBrightness: Brightness.light,
              ),
              iconTheme: const IconThemeData(),
              titleTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            elevation: 20,
            unselectedItemColor: HexColor("333739"),
            backgroundColor: HexColor("333739"),
          ),
          textTheme: const TextTheme(
            bodyText1: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        home: const Directionality(
          textDirection: TextDirection.rtl,
          child: NewsScreen(),
        ),
      ),
    );
  }
}

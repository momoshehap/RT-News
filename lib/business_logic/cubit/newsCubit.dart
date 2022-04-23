import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rt_news/business_logic/cubit/newsStates.dart';
import 'package:rt_news/presentation/screens/business_screen.dart';
import 'package:rt_news/presentation/screens/news_screen.dart';
import 'package:rt_news/presentation/screens/science_screen.dart';
import 'package:rt_news/presentation/screens/settings_screen.dart';
import 'package:rt_news/presentation/screens/sport_screen.dart';
import 'package:rt_news/service/remote/api.dart';

class NewsAppCubit extends Cubit<NewsappStates> {
  NewsAppCubit() : super(InitNewsappState());
  static NewsAppCubit get(context) => BlocProvider.of(context);

  int navbarIndex = 0;
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: "business",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: "sports",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: "science",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: "settings",
    ),
  ];

  List<Widget> screens = const [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];

  void changeBottomNavBar(int index) {
    navbarIndex = index;

    emit(ChangeBottomNavBarstate());
  }

  List<dynamic> business = [];
  void getBusiness() {
    print("business Func  is caled");

    emit(NewsBusinessLoadingState());

    Helper.getData(Helper.path, Helper.query).then((value) {
      business = value.data['articles'];
      print("business data is here$business");

      emit(GetBusinessDataSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(GetBusinessDataErorrState(e.toString()));
    });
  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewsScienceLoadingState());

    Helper.getData(Helper.path, {
      'country': 'eg',
      'category': 'science',
      'apiKey': Helper.apiKey
    }).then((value) {
      science = value.data['articles'];

      emit(GetScienceDataSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(GetScienceDataErorrState(e.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsSportsLoadingState());

    Helper.getData(Helper.path, {
      'country': 'eg',
      'category': 'sports',
      'apiKey': Helper.apiKey
    }).then((value) {
      sports = value.data['articles'];

      emit(GetSportsDataSuccessState());
    }).catchError((e) {
      emit(GetSportsDataErorrState(e.toString()));
    });
  }

  static String searchPath = "v2/everything";

  List<dynamic> searchList = [];
  void search(String value) {
    emit(NewsSearchLoadingState());
    print(value);
    Helper.getData(searchPath, {'q': value, 'apiKey': Helper.apiKey})
        .then((value) {
      searchList = value.data['articles'];
      print(value);

      emit(GetSearcheDataSuccessState());
    }).catchError((e) {
      emit(GetSearchDataErorrState(e.toString()));
    });
  }
}

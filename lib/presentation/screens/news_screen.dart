import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rt_news/business_logic/cubit/newsCubit.dart';
import 'package:rt_news/business_logic/cubit/newsStates.dart';
import 'package:rt_news/presentation/screens/search_screen.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsappStates>(
        listener: (context, state) => {},
        builder: (context, state) {
          var cubit = NewsAppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text("RT News"),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchScreen()));
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ))
              ],
            ),
            body: cubit.screens[cubit.navbarIndex],
            bottomNavigationBar: BottomNavigationBar(
              elevation: 20,
              unselectedItemColor: Colors.black,
              selectedItemColor: Colors.lightGreen,
              showUnselectedLabels: true,
              currentIndex: cubit.navbarIndex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              items: cubit.items,
            ),
          );
        });
  }
}

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rt_news/business_logic/cubit/newsCubit.dart';
import 'package:rt_news/business_logic/cubit/newsStates.dart';
import 'package:rt_news/presentation/widgets/articleItem.dart';

class SearchScreen extends StatelessWidget {
  var searchControlar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsappStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Search",
                    prefixIcon: Icon(Icons.search),
                  ),
                  controller: searchControlar,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    NewsAppCubit.get(context).search(value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Search must not be empty";
                    }
                  },
                ),
              ),
              ConditionalBuilder(
                condition: NewsAppCubit.get(context).searchList.isNotEmpty,
                builder: (context) => ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    return buildArticleItem(
                      context,
                      NewsAppCubit.get(context).searchList[index],
                    );
                  },
                  separatorBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                    );
                  },
                  itemCount: NewsAppCubit.get(context).searchList.length,
                ),
                fallback: (context) => const Center(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

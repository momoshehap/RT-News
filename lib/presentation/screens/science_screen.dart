import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rt_news/business_logic/cubit/newsCubit.dart';
import 'package:rt_news/business_logic/cubit/newsStates.dart';
import 'package:rt_news/presentation/widgets/articleItem.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsappStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: NewsAppCubit.get(context).science.isNotEmpty,
          builder: (context) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, index) {
              return buildArticleItem(
                  context, NewsAppCubit.get(context).science[index]);
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
            itemCount: NewsAppCubit.get(context).science.length,
          ),
          fallback: (context) => const Center(
              child: CircularProgressIndicator(
            color: Colors.red,
            backgroundColor: Colors.black,
          )),
        );
      },
    );
  }
}

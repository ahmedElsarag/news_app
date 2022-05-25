import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_cubit.dart';

class NewsLayout extends StatefulWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  State<NewsLayout> createState() => _NewsLayoutState();
}

class _NewsLayoutState extends State<NewsLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('News App'),
              actions: const [
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 20),
                  child: Icon(Icons.search_rounded),
                )
              ],
            ),
            bottomNavigationBar:
                BottomNavigationBar(
                    currentIndex: cubit.selectedIndex,
                    onTap: (index){
                      cubit.changeBottomNavSelectedItem(index);
                    },
                    items: cubit.bottomNavItems),
            body: cubit.screens[cubit.selectedIndex],

          );
        },
      ),
    );
  }
}

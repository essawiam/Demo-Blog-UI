import 'package:app_blog/core/constants/titles.dart';
import 'package:app_blog/features/home_blog/bloc/home_blog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/home_blog_widget.dart';

class HomeBlogPage extends StatefulWidget {
  const HomeBlogPage({super.key});

  @override
  _HomeBlogPageState createState() => _HomeBlogPageState();
}

class _HomeBlogPageState extends State<HomeBlogPage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBlogBloc>().add(HomeBlogItemsFetched());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBlogBloc, HomeBlogState>(
      builder: (context, state) {
        if (state.homeBlogStatus.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.homeBlogStatus.isFailure) {
          return Center(
            child: Text(
              state.errorMessage!,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        } else if (state.homeBlogStatus.isSuccess) {
          return Scaffold(
            appBar: AppBar(title: const Text(home)),
            body: ListView.builder(
                itemCount: state.homeBlogs?.length,
                itemBuilder: (context, index) {
                  return HomeBlogWidget(
                    homeBlogModel: state.homeBlogs![index],
                  );
                }),
          );
        }

        return const SizedBox();
      },
    );
  }
}

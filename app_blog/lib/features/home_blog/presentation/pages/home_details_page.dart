import 'package:app_blog/core/constants/titles.dart';
import 'package:app_blog/features/home_blog/presentation/pages/home_edit_page.dart';
import 'package:flutter/material.dart';

import '../../bloc/home_blog_bloc.dart';
import '../../data/models/home_blog_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDetailsPage extends StatefulWidget {
  final HomeBlogModel homeBlogModel;
  const HomeDetailsPage({super.key, required this.homeBlogModel});

  @override
  State<HomeDetailsPage> createState() => _HomeDetailsPageState();
}

class _HomeDetailsPageState extends State<HomeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final blogItem = context.select<HomeBlogBloc, HomeBlogModel>(
      (blog) => blog.state.homeBlogs!
          .where((element) => element.id == widget.homeBlogModel.id)
          .first,
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(details),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: BlocProvider.of<HomeBlogBloc>(context),
                      child: HomeEditPage(homeBlogModel: blogItem),
                    ),
                  ),
                );
              },
              child: const Icon(
                Icons.edit,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 25,
            right: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                blogItem.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                blogItem.description,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

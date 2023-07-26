import 'package:app_blog/features/home_blog/bloc/home_blog_bloc.dart';
import 'package:app_blog/features/home_blog/data/models/home_blog_model.dart';
import 'package:app_blog/features/home_blog/presentation/pages/home_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBlogWidget extends StatelessWidget {
  final HomeBlogModel homeBlogModel;
  const HomeBlogWidget({required this.homeBlogModel, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: BlocProvider.of<HomeBlogBloc>(context),
              child: HomeDetailsPage(
                homeBlogModel: homeBlogModel,
              ),
            ),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding:
              const EdgeInsets.only(bottom: 10, left: 5, right: 5, top: 10),
          child: Row(children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    homeBlogModel.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    homeBlogModel.subTitle,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.asset(homeBlogModel.imageUrl, fit: BoxFit.fill),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ]),
        ),
      ),
    );
  }
}

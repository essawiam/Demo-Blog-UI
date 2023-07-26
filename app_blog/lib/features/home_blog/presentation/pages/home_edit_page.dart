import 'package:app_blog/core/constants/titles.dart';
import 'package:app_blog/features/home_blog/bloc/home_blog_bloc.dart';
import 'package:app_blog/features/home_blog/data/models/home_blog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class HomeEditPage extends StatefulWidget {
  HomeBlogModel homeBlogModel;
  HomeEditPage({required this.homeBlogModel, super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeEditPageState createState() => _HomeEditPageState();
}

class _HomeEditPageState extends State<HomeEditPage> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late Bloc homeBloc;

  @override
  void initState() {
    super.initState();
    homeBloc = context.read<HomeBlogBloc>();
    _titleController = TextEditingController(text: widget.homeBlogModel.title);
    _descriptionController =
        TextEditingController(text: widget.homeBlogModel.description);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text(edit), actions: [
          TextButton(
            onPressed: () {
              homeBloc.add(
                HomeBlogItemUpdated(
                  homeBlogModel: HomeBlogModel(
                    description: _descriptionController.text,
                    title: _titleController.text,
                    id: widget.homeBlogModel.id,
                    imageUrl: widget.homeBlogModel.imageUrl,
                    subTitle: widget.homeBlogModel.subTitle,
                  ),
                ),
              );
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.save,
              color: Colors.black,
            ),
          ),
        ]),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
                right: 10,
                left: 10,
                bottom: 15,
              ),
              child: Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    title,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    controller: _titleController,
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    description,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    controller: _descriptionController,
                    maxLines: 6,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}

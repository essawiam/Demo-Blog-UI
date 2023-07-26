import 'package:app_blog/core/error/failure.dart';
import 'package:app_blog/features/home_blog/data/data_source/data_source.dart';
import 'package:app_blog/features/home_blog/data/data_source/fake_data.dart';
import 'package:app_blog/features/home_blog/data/models/home_blog_model.dart';

import '../../../../core/constants/errors.dart';

class LocalDataSource extends DataSource {
  final List<HomeBlogModel> _inMemoryDataSource = fakeData;

  @override
  ({Failure? error, List<HomeBlogModel>? success}) getHomeBlogs() {
    try {
      return (error: null, success: _inMemoryDataSource);
    } catch (e) {
      return (
        error: Failure(
          errorMessage: e.toString(),
        ),
        success: null
      );
    }
  }

  @override
  ({Failure? error, bool success}) updateHomeBlogData(HomeBlogModel data) {
    try {
      final index = _inMemoryDataSource.indexWhere((obj) => obj.id == data.id);
      if (index != -1) {
        final updatedObject = _inMemoryDataSource[index].copyWith(
          title: data.title,
          imageUrl: data.imageUrl,
          subTitle: data.subTitle,
          description: data.description,
        );
        _inMemoryDataSource[index] = updatedObject;
        return (error: null, success: true);
      } else {
        return (
          error: const Failure(errorMessage: objectNotFound),
          success: false
        );
      }
    } catch (e) {
      return (error: Failure(errorMessage: e.toString()), success: false);
    }
  }
}

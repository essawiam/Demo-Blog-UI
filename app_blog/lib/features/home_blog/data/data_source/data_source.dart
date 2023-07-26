import 'package:app_blog/core/error/failure.dart';
import 'package:app_blog/features/home_blog/data/models/home_blog_model.dart';

/// [DataSource] Is intended to be used as a base class for various data source implementations
///
/// such any local database might use in the future.
abstract class DataSource {
  ({Failure? error, List<HomeBlogModel>? success}) getHomeBlogs();
  ({Failure? error, bool success}) updateHomeBlogData(HomeBlogModel data);
}

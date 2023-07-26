import 'package:app_blog/features/home_blog/data/data_source/data_source.dart';

import '../../../../core/error/failure.dart';
import '../models/home_blog_model.dart';

/// [HomeBlogRepo] Is like a single point of truth.
///
/// Controls where to call the data like [Local DB, Remote API].
class HomeBlogRepo {
  final DataSource dataSource;

  HomeBlogRepo({required this.dataSource});

  ({Failure? error, List<HomeBlogModel>? success}) getHomeBlogs() {
    return dataSource.getHomeBlogs();
  }

  ({Failure? error, bool success}) updateHomeBlogData(HomeBlogModel data) {
    return dataSource.updateHomeBlogData(data);
  }
}

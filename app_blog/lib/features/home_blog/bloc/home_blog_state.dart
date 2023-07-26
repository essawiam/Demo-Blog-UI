part of 'home_blog_bloc.dart';

enum HomeBlogStatus {
  initial,
  loading,
  success,
  failure,
}

extension HomeBlogStatusX on HomeBlogStatus {
  bool get isInitial => this == HomeBlogStatus.initial;
  bool get isLoading => this == HomeBlogStatus.loading;
  bool get isSuccess => this == HomeBlogStatus.success;
  bool get isFailure => this == HomeBlogStatus.failure;
}

class HomeBlogState extends Equatable {
  final HomeBlogStatus homeBlogStatus;
  final List<HomeBlogModel>? homeBlogs;
  final String? errorMessage;

  const HomeBlogState({
    required this.homeBlogStatus,
    this.homeBlogs,
    this.errorMessage,
  });

  HomeBlogState copyWith({
    required homeBlogStatus,
    List<HomeBlogModel>? homeBlogs,
    String? errorMessage,
  }) {
    return HomeBlogState(
      homeBlogStatus: homeBlogStatus,
      homeBlogs: homeBlogs ?? this.homeBlogs,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [homeBlogStatus, homeBlogs, errorMessage];
}

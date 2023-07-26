import 'dart:async';

import 'package:app_blog/core/constants/errors.dart';
import 'package:app_blog/features/home_blog/data/repository/home_blog_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/home_blog_model.dart';
import 'package:equatable/equatable.dart';

part 'home_blog_event.dart';
part 'home_blog_state.dart';

class HomeBlogBloc extends Bloc<HomeBlogEvent, HomeBlogState> {
  final HomeBlogRepo homeBlogRepo;
  HomeBlogBloc({required this.homeBlogRepo})
      : super(
          const HomeBlogState(
            homeBlogStatus: HomeBlogStatus.initial,
            errorMessage: noError,
            homeBlogs: [],
          ),
        ) {
    on<HomeBlogItemsFetched>(_homeBlogItemsFetched);
    on<HomeBlogItemUpdated>(_homeBlogItemUpdated);
  }

  FutureOr<void> _homeBlogItemsFetched(
      HomeBlogItemsFetched event, Emitter<HomeBlogState> emit) {
    emit(
      const HomeBlogState(homeBlogStatus: HomeBlogStatus.loading),
    );
    final result = homeBlogRepo.getHomeBlogs();
    if (result.error == null) {
      emit(
        state.copyWith(
          homeBlogStatus: HomeBlogStatus.success,
          homeBlogs: result.success,
        ),
      );
    } else {
      emit(
        state.copyWith(
          homeBlogStatus: HomeBlogStatus.failure,
          errorMessage: result.error!.errorMessage,
        ),
      );
    }
  }

  FutureOr<void> _homeBlogItemUpdated(
      HomeBlogItemUpdated event, Emitter<HomeBlogState> emit) {
    emit(
      const HomeBlogState(homeBlogStatus: HomeBlogStatus.loading),
    );
    final result = homeBlogRepo.updateHomeBlogData(event.homeBlogModel);
    if (result.error == null) {
      add(HomeBlogItemsFetched());
    } else {
      emit(
        state.copyWith(
          homeBlogStatus: HomeBlogStatus.failure,
          errorMessage: result.error!.errorMessage,
        ),
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_list_getx/application/movie_list/movie_list_controller.dart';
import 'dart:developer';

import '../../../domain/movie_list/movie_list_model/result.dart';

class MovieListScreeen extends StatelessWidget {
  MovieListScreeen({super.key});

  final MovieListController controller = Get.put(MovieListController());

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    List<Result> movieList = [];
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      log('Called');
      controller.getMovieList();
    });
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        controller.getMovieList();
      }
    });
    return Scaffold(
      body: SafeArea(child: Obx(() {
        log('Built');
        final result = controller.resultData.value;
        if (result.resultData == null) {
          return const Text('Something Went Wrong');
        }
        if (result.isError) {
          return const Center(child: Text('Error while fetching data'));
        } else if (result.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (result.resultData!.isEmpty) {
          return const Text('List is Empty');
        }

        movieList.addAll(result.resultData!);
        return ListView.builder(
          itemCount: movieList.length + 1,
          controller: scrollController,
          itemBuilder: (context, index) {
            if (index == movieList.length) {
              return const Center(child: CircularProgressIndicator());
            }

            final movie = movieList[index];
            return ListTile(
              title: Text(movie.originalTitle ??= 'No Title'),
              leading: Image.network(movie.get()),
            );
          },
        );
      })),
    );
  }
}

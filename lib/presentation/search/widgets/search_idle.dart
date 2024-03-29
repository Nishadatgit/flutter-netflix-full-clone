import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_netflix/application/search/search_bloc.dart';
import 'package:project_netflix/core/colors/colors.dart';
import 'package:project_netflix/core/constants.dart';
import 'package:project_netflix/core/strings.dart';
import 'package:project_netflix/domain/downloads/models/downloads.dart';

import 'search_title_widget.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitleWidget(
          text: 'Top Searches',
        ),
        kHeight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              final data = state.idleList;
              if (state.isLoading == true) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.isError && state.idleList.isEmpty) {
                return const Center(child: Text("Error occured"));
              } else {
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) => TopSearchItemTile(
                    downloadsModel: data[index],
                  ),
                  separatorBuilder: (ctx, index) => kHeight20,
                  itemCount: data.length,
                );
              }
            },
          ),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key, required this.downloadsModel});

  final Downloads downloadsModel;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          height: 65,
          width: screenWidth * 0.35,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              image: DecorationImage(
                  image:
                      NetworkImage("$imgBaseUrl${downloadsModel.posterPath}"),
                  fit: BoxFit.cover)),
        ),
        kWidth,
        Expanded(
            child: Text(
          downloadsModel.title ?? 'No title',
          style: const TextStyle(
              color: kWhiteColor, fontWeight: FontWeight.bold, fontSize: 16),
        )),
        CircleAvatar(
          radius: 25,
          backgroundColor: kWhiteColor,
          child: CircleAvatar(
              backgroundColor: kBlack,
              radius: 23,
              child: IconButton(
                onPressed: () {
                  print(downloadsModel.id);
                },
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.play_arrow,
                  color: kWhiteColor,
                ),
              )),
        ),
        kWidth,
      ],
    );
  }
}

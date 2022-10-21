import 'package:alquran/common/constant.dart';
import 'package:alquran/presentation/bloc/detail_surah_bloc/detail_surah_bloc.dart';
import 'package:alquran/presentation/widgets/detail_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SurahPage extends StatefulWidget {
  static const route_name = '/detail';

  final int id;
  SurahPage({required this.id});

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<DetailSurahBloc>().add(
            FetchSurahDetail(widget.id),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quran app',
          style: TextStyle(color: kDarkPurple),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: kSecondary))
        ],
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: BlocBuilder<DetailSurahBloc, DetailSurahState>(
        builder: (context, state) {
          if (state is DetailSurahHasData) {
            final result = state.detailSurah;
            return DetailContent(result);
          } else if (state is DetailSurahError) {
            return const Center(
              child: Text('Failed'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

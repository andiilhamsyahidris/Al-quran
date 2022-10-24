import 'package:alquran/common/constant.dart';
import 'package:alquran/presentation/bloc/surah_list_bloc/surah_list_bloc.dart';
import 'package:alquran/presentation/pages/search_page.dart';
import 'package:alquran/presentation/widgets/category_list.dart';
import 'package:alquran/presentation/widgets/surah_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSurahPage extends StatefulWidget {
  @override
  _HomeSurahPageState createState() => _HomeSurahPageState();
}

class _HomeSurahPageState extends State<HomeSurahPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<SurahListBloc>().add(
            FetchSurahList(),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu_book_outlined),
        title: const Text(
          'Quran app',
          style: TextStyle(color: kDarkPurple),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SearchPage.route_name);
              },
              icon: const Icon(
                Icons.search,
                color: kDarkPurple,
              ))
        ],
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(8.0),
          child: _buildMainPage(),
        ),
      ),
    );
  }

  Container _buildDashboardPage() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              'Assalamualaikum',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.black.withOpacity(0.5)),
            ),
          ),
          Flexible(
            child: Text(
              'Andi Ilhamsyah Idris',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                margin: const EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [kDarkPurple, kSecondary],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.menu_book,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              'Last Read',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 190,
                top: 30,
                child: Image.asset(
                  "assets/dashboard.png",
                  height: 160,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  CategoryList? _buildCategory() {
    return const CategoryList();
  }

  SingleChildScrollView _buildMainPage() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildDashboardPage(),
          SizedBox(
            child: _buildCategory(),
          ),
          BlocBuilder<SurahListBloc, SurahListState>(
            builder: (context, state) {
              if (state is SurahListLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is SurahListHasData) {
                final result = state.getSurahQuran;
                return ListView.builder(
                  shrinkWrap: true,
                  controller: ScrollController(keepScrollOffset: true),
                  itemBuilder: (context, index) {
                    final surah = result[index];
                    return SurahList(surah);
                  },
                  itemCount: result.length,
                );
              } else if (state is SurahListError) {
                return Center(
                  child: Text(state.message),
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}

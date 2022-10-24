import 'package:alquran/common/constant.dart';
import 'package:alquran/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  static const route_name = '/search';

  const SearchPage({super.key});
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quran app',
          style: TextStyle(color: kDarkPurple),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [_buildTextField()],
        ),
      ),
    );
  }

  Container _buildTextField() {
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (query) {
                context.read<SearchBloc>().add(OnQueryChanged(query));
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: kDarkPurple.withOpacity(0.3),
                hintText: 'Search the text of the Quran',
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide.none),
              ),
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(height: 16),
            Text(
              'Search Result',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SearchHasData) {
                  final result = state.result;
                  return ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    shrinkWrap: true,
                    controller: ScrollController(keepScrollOffset: true),
                    itemBuilder: (context, index) {
                      final data = result[index];
                      return ListTile(
                        title: Text(data.text),
                      );
                    },
                    itemCount: result.length,
                  );
                } else if (state is SearchError) {
                  return const Center(
                    child: Text('Error'),
                  );
                } else {
                  return Container();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

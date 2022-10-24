import 'dart:convert';

import 'package:alquran/common/exception.dart';
import 'package:alquran/data/models/detail_surah_model.dart';
import 'package:alquran/data/models/search_model.dart';
import 'package:alquran/data/models/search_response.dart';
import 'package:alquran/data/models/surah_model.dart';
import 'package:alquran/data/models/surah_response.dart';
import 'package:http/http.dart' as http;

abstract class AlquranRemoteDataSource {
  Future<List<SurahModel>> getSurahAlquran();
  Future<DetailSurahModel> getDetailSurah(int number);
  Future<List<SearchModel>> searchTextQuran(String keyword);
}

class AlquranRemoteDataSourceImpl implements AlquranRemoteDataSource {
  static const BASE_URL = 'http://api.alquran.cloud/v1/surah';
  final http.Client client;

  AlquranRemoteDataSourceImpl({required this.client});

  @override
  Future<List<SurahModel>> getSurahAlquran() async {
    final response = await client.get(Uri.parse(BASE_URL));
    if (response.statusCode == 200) {
      return SurahResponse.fromJson(json.decode(response.body)).surahList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<DetailSurahModel> getDetailSurah(int number) async {
    final response = await client.get(Uri.parse("$BASE_URL/$number"));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var data = jsonResponse['data'];
      return DetailSurahModel.fromJson(data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<SearchModel>> searchTextQuran(String keyword) async {
    final response = await client
        .get(Uri.parse("http://api.alquran.cloud/v1/search/$keyword/all/en"));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var data = jsonResponse["data"];
      return SearchResponse.fromJson(data).searchList;
    } else {
      throw ServerException();
    }
  }
}

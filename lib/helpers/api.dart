import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  late Dio dio;
  final String url;
  Api({required this.url}) {
    BaseOptions options = BaseOptions(
      baseUrl: url,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> get({
    required String endPoint,
  }) async {
    try {
      final response = await dio.get(endPoint);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(
          "GET request error: ${response.statusCode}",
        );
      }
    } catch (e) {
      throw Exception("GET request error: $e");
    }
  }

  Future<dynamic> postProduct({
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    try {
      final response = await dio.post(
        url,
        data: body,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.data);
      } else {
        throw Exception(
          'There is a problem with Status code ${response.statusCode} with data ${response.data}',
        );
      }
    } catch (e) {
      throw Exception(
        'There is a problem with $e ',
      );
    }
  }
}

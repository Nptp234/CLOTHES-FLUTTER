import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class API {
  Dio _dio = Dio();
  String apiUrl = 'http://192.168.10.245:3000';

  API() {
    _dio.options.baseUrl = '$apiUrl/api';
    _dio.options.connectTimeout = Duration(seconds: 5); // Increase timeout to 5 seconds (adjust as necessary)
  }

  Dio get sendRequest => _dio;

  Map<String, dynamic> header(String token) {
    return {
      'Authorization': 'Bearer $token',
    };
  }
}
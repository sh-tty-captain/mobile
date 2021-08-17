import 'package:bekhterev_app/layers/drivers/session.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'headers_signatura.dart';

class DioClient {
  final Dio _dio;
  final String baseEndpoint;

  DioClient(
    this._dio, {
    required this.baseEndpoint,
  });

  Future<Options> _defaultOptions(Session session) async {
    final sign = await session.sign();

    if (sign is HeadersSignature) {
      return Options(headers: sign.headers);
    } else {
      return Options();
    }
  }

  Future<Options> _createOptions(
    Options? options,
    Session? session,
  ) async {
    if (options != null) {
      return options;
    } else if (session != null) {
      return _defaultOptions(session);
    } else {
      return Options();
    }
  }

  Future<Response<T>> get<T>(
    String endpoint, {
    Options? options,
    CancelToken? cancelToken,
    Session? session,
  }) async {
    return _request<T>(
      () async => _dio.get(
        '$baseEndpoint$endpoint',
        options: await _createOptions(options, session),
        cancelToken: cancelToken,
      ),
    );
  }

  Future<Response<T>> post<T>(
    String endpoint, {
    // ignore: avoid_annotating_with_dynamic
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
    Session? session,
  }) async {
    return _request<T>(
      () async => _dio.post(
        '$baseEndpoint$endpoint',
        data: data,
        // options: await _createOptions(options, session),
        options: options,
        cancelToken: cancelToken,
      ),
    );
  }

  Future<Response<T>> patch<T>(
    String endpoint, {
    // ignore: avoid_annotating_with_dynamic
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
    Session? session,
  }) async {
    return _request<T>(
      () async => _dio.patch(
        '$baseEndpoint$endpoint',
        data: data,
        options: await _createOptions(options, session),
        cancelToken: cancelToken,
      ),
    );
  }

  Future<Response<T>> put<T>(
    String endpoint, {
    // ignore: avoid_annotating_with_dynamic
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
    Session? session,
  }) async {
    return _request<T>(
      () async => _dio.put(
        '$baseEndpoint$endpoint',
        data: data,
        options: await _createOptions(options, session),
        cancelToken: cancelToken,
      ),
    );
  }

  Future<Response<T>> delete<T>(
    String endpoint, {
    // ignore: avoid_annotating_with_dynamic
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
    Session? session,
  }) async {
    return _request<T>(
      () async => _dio.delete(
        '$baseEndpoint$endpoint',
        data: data,
        options: await _createOptions(options, session),
        cancelToken: cancelToken,
      ),
    );
  }

  Future<Response<T>> _request<T>(Future<Response<T>> Function() handler) async {
    try {
      final response = await handler();
      return response;
    } on DioError catch (e, stackTrace) {
      // TODO: Handle errors
      // throw dioErrorToException(e);
      debugPrint(e.toString());
      debugPrint(stackTrace.toString());
      throw StateError('Oh no!');
    } catch (e, stackTrace) {
      debugPrint(e.toString());
      debugPrint(stackTrace.toString());

      // TODO: Handle error
      // throw ConnectionException();
      throw StateError('Oh no!');
    }
  }

  // Map<String, dynamic> getJsonBody<T>(Response<T> response) {
  //   try {
  //     return response.data as Map<String, dynamic>;
  //   } on Exception catch (e, stackTrace) {
  //     debugPrint(stackTrace.toString());
  //     // TODO:
  //     // throw SchemeConsistencyException('Bad body format');
  //   }
  // }
}

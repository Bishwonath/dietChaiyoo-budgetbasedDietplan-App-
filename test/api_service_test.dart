import 'package:diet_chaiyoo/core/network/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:diet_chaiyoo/app/constants/api_endpoints.dart';
import 'package:diet_chaiyoo/core/network/dio_error_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// Mock Dio class
class MockDio extends Mock implements Dio {}

void main() {
  group('ApiService Tests', () {
    late MockDio mockDio;
    late ApiService apiService;

    setUp(() {
      // Initialize the MockDio instance and the ApiService
      mockDio = MockDio();

      // Initialize the interceptors property to an empty list or add mock interceptors
      when(() => mockDio.interceptors).thenReturn(Interceptors());

      // Initialize options (BaseOptions)
      when(() => mockDio.options).thenReturn(BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: ApiEndpoints.connectionTimeout,
        receiveTimeout: ApiEndpoints.receiveTimeout,
      ));

      // Initialize the ApiService with the mocked Dio
      apiService = ApiService(mockDio);
    });

    test('ApiService initialization sets up Dio correctly', () {
      // Check if the base URL and headers are set correctly
      expect(apiService.dio.options.baseUrl, ApiEndpoints.baseUrl);
      expect(apiService.dio.options.connectTimeout, ApiEndpoints.connectionTimeout);
      expect(apiService.dio.options.receiveTimeout, ApiEndpoints.receiveTimeout);
      expect(apiService.dio.options.headers, {
        'Accept': 'application/json',
      });
    });

    test('Dio interceptors are added correctly', () {
      final interceptors = apiService.dio.interceptors;
      
      // Check if interceptors were added
      expect(interceptors, isNotEmpty);
      expect(interceptors, contains(isA<DioErrorInterceptor>()));
      expect(interceptors, contains(isA<PrettyDioLogger>()));
    });

    test('ApiService calls Dio get method', () async {
      // Mock a response for the GET request
      final response = Response(
        data: {'key': 'value'},
        statusCode: 200,
        requestOptions: RequestOptions(path: 'test'),
      );

      // Mock the GET method call for Dio
      when(() => mockDio.get(any())).thenAnswer((_) async => response);

      // Call the API method (you can replace with actual API method)
      final result = await mockDio.get('test');

      // Verify the call and the response
      expect(result.data, {'key': 'value'});
      verify(() => mockDio.get('test')).called(1);
    });

    test('Dio get method throws DioError on failure', () async {
      // Mock DioError response for failure scenario
      when(() => mockDio.get(any())).thenThrow(DioError(
        requestOptions: RequestOptions(path: 'test'),
        error: 'Network error',
      ));

      try {
        await mockDio.get('test');
      } catch (e) {
        expect(e, isA<DioError>());
      }

      verify(() => mockDio.get('test')).called(1);
    });
  });
}

import 'package:frappe_mobile/frappe_mobile.dart';

class DoctypeApiService {
  static final DoctypeApiService _instance = DoctypeApiService._internal();
  factory DoctypeApiService() => _instance;
  DoctypeApiService._internal();

  final ApiClient _client = ApiClient();

  Future<Map<String, dynamic>> getDoctypeMetaData({
    required String doctype
  }) async {
    try {
      final response = await _client.post(
        ApiEndpoints.getDoctypeMetadata(doctype),
        includeAuth: true,
      );

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data as Map<String, dynamic>;
        return data;
      } else {
        throw FrappeException.authentication('Login failed with status: ${response.statusCode}');
      }
    } on FrappeException {
      rethrow;
    } catch (e) {
      throw FrappeException.authentication('Login failed: $e');
    }
  }

  Future<Map<String, dynamic>> getDoctypeResource({
    required String doctype
  }) async {
    try {
      final response = await _client.get(
        ApiEndpoints.getDoctypeResource(doctype),
        includeAuth: true,
      );

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data as Map<String, dynamic>;
        return data;
      } else {
        throw FrappeException.authentication('Failed to get doctype resource with status: ${response.statusCode}');
      }
    } on FrappeException {
      rethrow;
    } catch (e) {
      throw FrappeException.authentication('Failed to get doctype resource: $e');
    }
  }

  Future<Map<String, dynamic>> getDoctypeRecords({
    required String doctype,
    String? name,
  }) async {
    try {
      final response = await _client.get(
        ApiEndpoints.getDoctypeRecords(doctype, name),
        includeAuth: true,
      );

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data as Map<String, dynamic>;
        return data;
      } else {
        throw FrappeException.authentication('Failed to get doctype records with status: ${response.statusCode}');
      }
    } on FrappeException {
      rethrow;
    } catch (e) {
      throw FrappeException.authentication('Failed to get doctype records: $e');
    }
  }

}
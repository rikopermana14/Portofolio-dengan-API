import 'package:utp/models/maroon.dart';
import 'dart:convert';
import 'package:utp/models/maroon.dart';
import 'package:http/http.dart' as http;

class MaroonService {
  static final _baseUrl =
      'https://prak-labkom-mobpro.000webhostapp.com/api/maroons';

  static Future<void> createItem(Maroon item) async {
    final response = await http.post(Uri.parse(_baseUrl),
        body: json.encode({
          'message': item.message,
          'name': item.name,
          'created_at': item.createdAt,
          'updated_at': item.updatedAt,
        }),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode != 200) {
      throw Exception('Failed to create item');
    }
  }

  static Future<List<Maroon>> readItems() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;
      return data.map((itemJson) => Maroon.fromJson(itemJson)).toList();
    } else {
      throw Exception('Failed to read items');
    }
  }

  static Future<void> updateItem(
    int id,
    String npm,
    String name,
    DateTime created_at,
    DateTime updated_at,
  ) async {
    final response = await http.put(Uri.parse('$_baseUrl/$id'),
        body: json.encode({
          'npm': npm,
          'name': name,
          'created_at': created_at,
          'updated_at': updated_at,
        }),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode != 200) {
      throw Exception('Failed to update item');
    }
  }

  static Future<void> deleteItem(int id) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete item');
    }
  }
}

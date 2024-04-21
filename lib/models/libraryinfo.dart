import 'dart:convert';
import 'package:http/http.dart' as http;

class LibraryInfo {
  final String libraryName;
  final int openingTime;
  final int closingTime;
  final int timeOfTravel;
  final double distance;
  final String imageAssetPath;
  final int spaceavailability;

  LibraryInfo({
    required this.libraryName,
    required this.openingTime,
    required this.closingTime,
    required this.timeOfTravel,
    required this.distance,
    required this.imageAssetPath,
    required this.spaceavailability,
  });

  factory LibraryInfo.fromJson(Map<String, dynamic> json) {
    return LibraryInfo(
      libraryName: json['Library name'],
      openingTime: json['Opening time']?.toInt() ?? 0,
      closingTime: json['Closing time']?.toInt() ?? 0,
      timeOfTravel: json['Time of travel (min)']?.toInt() ?? 0,
      distance: json['How far it is (km)']?.toDouble() ?? 0.0,
      imageAssetPath: json['AssetPath'] ?? 'https://placeholder.com/image.jpg',
      spaceavailability: json['Space Availability'].toInt() ?? 0,
    );
  }
}

class LibraryInfoService {
  Future<List<LibraryInfo>> fetchLibraryInfo() async {
    final response = await http.get(Uri.parse(
        'https://script.google.com/macros/s/AKfycbwDFRP9Nu6rhztfPoohG49BJn4-4Z275EKTxqeGV1K9w63DD5oijI_3fsWF8AyY1e4-/exec'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((item) => LibraryInfo.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load library information');
    }
  }
}

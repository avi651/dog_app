import 'dart:convert';
import 'package:http/http.dart' as http;

class ImageBase64 {
  const ImageBase64();
  Future<String?> networkImageToBase64(String imageUrl) async {
    http.Response response = await http.get(
      Uri.parse(imageUrl),
    );
    final bytes = response.bodyBytes;
    return base64Encode(bytes);
  }
}

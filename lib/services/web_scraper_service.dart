import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

class WebScraperService {
  Future<List<Map<String, dynamic>>> fetchAndConvertToJson() async {
    const url = 'https://sgnewsradio.com/radio-lives';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Phân tích HTML
        final document = parser.parse(response.body);

        // Chọn tbody và các hàng tr
        final tbody = document.querySelector('tbody');
        final rows = tbody?.querySelectorAll('tr.eeSFL_Item') ?? [];

        List<Map<String, dynamic>> data = [];

        for (var row in rows) {
          final id = row.id;
          final fileNameElement = row.querySelector('.eeSFL_FileLink a');
          final fileDateElement = row.querySelector('.eeSFL_FileDate');

          final fileName = fileNameElement?.text ?? 'No file name';
          final fileLink = fileNameElement?.attributes['href'] ?? 'No link';
          final fileDate = fileDateElement?.text.trim() ?? 'No date';

          data.add({
            'id': id,
            'name': fileName,
            'link': fileLink,
            'date': fileDate,
          });
        }

        // Trả về danh sách dữ liệu JSON
        return data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

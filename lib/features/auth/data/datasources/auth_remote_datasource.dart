import 'package:http/http.dart' as http;
import '../models/profession_model.dart';

class AuthRemoteDatasource {

  Future<List<ProfessionModel>> fetchProfessions() async {
    // final response = await http.get(Uri.parse("https://your-api.com/professions"));
    //
    // final data = jsonDecode(response.body);
    //
    // return List<ProfessionModel>.from(
    //   data.map((e) => ProfessionModel.fromJson(e)),
    // );


    await Future.delayed(const Duration(seconds: 2)); // simulate network delay

    final dummyJson = [
      {"id": 1, "name": "Games Designer"},
      {"id": 2, "name": "Motion Graphic Designer"},
      {"id": 3, "name": "UX Designer"},
      {"id": 4, "name": "UI Designer"},
      {"id": 5, "name": "UI/UX Designer"},
      {"id": 6, "name": "2D / 3D Designer"},
      {"id": 7, "name": "Graphic Designer"},
      {"id": 8, "name": "Product Designer"},
      {"id": 9, "name": "Social Content Designer"},
    ];

    return dummyJson.map((e) => ProfessionModel.fromJson(e)).toList();
  }
}

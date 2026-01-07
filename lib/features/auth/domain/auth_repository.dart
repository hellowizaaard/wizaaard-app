import '../data/models/profession_model.dart';

abstract class AuthRepository {
  Future<List<ProfessionModel>> getProfessions();
  Future<bool> isLoggedIn();


  Future<bool> login(String email, String password);
  Future<bool> register(Map<String, dynamic> body);

}

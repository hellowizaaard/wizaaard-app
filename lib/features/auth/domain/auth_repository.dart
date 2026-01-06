import '../data/models/profession_model.dart';

abstract class AuthRepository {
  Future<List<ProfessionModel>> getProfessions();
}

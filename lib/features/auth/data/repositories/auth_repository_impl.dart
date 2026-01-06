import '../../domain/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/profession_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<List<ProfessionModel>> getProfessions() {
    return datasource.fetchProfessions();
  }
}

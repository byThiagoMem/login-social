import 'package:login_social/models/reference_table_model.dart';
import 'package:login_social/repositories/fipe/fipe_repository.dart';

import './fipe_service.dart';

class FipeServiceImpl implements FipeService {
  final FipeRepository _fipeRepository;

  FipeServiceImpl({
    required FipeRepository fipeRepository,
  }) : _fipeRepository = fipeRepository;

  @override
  Future<List<ReferenceTableModel>> getReferenceTable() => _fipeRepository.getReferenceTable();
}

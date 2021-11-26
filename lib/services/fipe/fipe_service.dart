import 'package:login_social/models/reference_table_model.dart';

abstract class FipeService {
  Future<List<ReferenceTableModel>> getReferenceTable();
}

import 'package:login_social/models/reference_table_model.dart';

abstract class FipeRepository {
  Future<List<ReferenceTableModel>> getReferenceTable();
}

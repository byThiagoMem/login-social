import 'package:login_social/models/reference_table_model.dart';
import 'package:login_social/models/vehicle_brand_model.dart';
import 'package:login_social/models/vehicle_model_model.dart';

abstract class FipeRepository {
  Future<List<ReferenceTableModel>> getReferenceTable();

  Future<List<VehicleBrandModel>> getVehicleBrand({required int codigoTabelaReferencia, required int codigoTipoVeiculo});

  Future<List<VehicleModelModel>> getVehicleModels({required int codigoTabelaReferencia, required int codigoTipoVeiculo, required codigoMarca});
}

import 'package:login_social/models/reference_table_model.dart';
import 'package:login_social/models/vehicle_brand_model.dart';
import 'package:login_social/models/vehicle_model_model.dart';

abstract class FipeService {
  Future<List<ReferenceTableModel>> getReferenceTable();

  Future<List<VehicleBrandModel>> getVehicleBrand({required int codigoTabelaReferencia, required int codigoTipoVeiculo});

  Future<List<VehicleModelModel>> getVehicleModels({required int codigoTabelaReferencia, required int codigoTipoVeiculo, required int codigoMarca});
}

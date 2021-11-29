import 'package:login_social/models/reference_table_model.dart';
import 'package:login_social/models/vehicle_brand_model.dart';
import 'package:login_social/models/vehicle_model_model.dart';
import 'package:login_social/repositories/fipe/fipe_repository.dart';

import './fipe_service.dart';

class FipeServiceImpl implements FipeService {
  final FipeRepository _fipeRepository;

  FipeServiceImpl({
    required FipeRepository fipeRepository,
  }) : _fipeRepository = fipeRepository;

  @override
  Future<List<ReferenceTableModel>> getReferenceTable() => _fipeRepository.getReferenceTable();

  @override
  Future<List<VehicleBrandModel>> getVehicleBrand({required int codigoTabelaReferencia, required int codigoTipoVeiculo}) =>
      _fipeRepository.getVehicleBrand(codigoTabelaReferencia: codigoTabelaReferencia, codigoTipoVeiculo: codigoTipoVeiculo);

  @override
  Future<List<VehicleModelModel>> getVehicleModels({required int codigoTabelaReferencia, required int codigoTipoVeiculo, required int codigoMarca}) =>
      _fipeRepository.getVehicleModels(
          codigoTabelaReferencia: codigoTabelaReferencia, codigoTipoVeiculo: codigoTipoVeiculo, codigoMarca: codigoMarca);
}

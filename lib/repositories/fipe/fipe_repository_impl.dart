import 'dart:convert';

import 'package:login_social/application/rest_client/rest_client.dart';
import 'package:login_social/models/reference_table_model.dart';
import 'package:login_social/models/vehicle_brand_model.dart';
import 'package:login_social/models/vehicle_model_model.dart';

import './fipe_repository.dart';

class FipeRepositoryImpl implements FipeRepository {
  final RestClient _restClient;

  FipeRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<ReferenceTableModel>> getReferenceTable() async {
    final response = await _restClient.post<List<ReferenceTableModel>>(
      '/ConsultarTabelaDeReferencia',
      '',
      headers: {
        'chave': '\$2y\$10\$8IAZn7HKq7QJWbh37N3GOOeRVv.sM9tcTLBRYwRuf2g98olRyqieW',
      },
      decoder: (data) {
        if (data != null) {
          var result = jsonDecode(data);
          return result.map<ReferenceTableModel>((d) => ReferenceTableModel.fromMap(d)).toList();
        }
        return <ReferenceTableModel>[];
      },
    );

    if (response.hasError) {
      throw Exception('Erro ao buscar tabela de referencia');
    }
    return response.body ?? <ReferenceTableModel>[];
  }

  @override
  Future<List<VehicleBrandModel>> getVehicleBrand({required int codigoTabelaReferencia, required int codigoTipoVeiculo}) async {
    final response = await _restClient.post<List<VehicleBrandModel>>(
      '/ConsultarMarcas',
      {
        'codigoTabelaReferencia': codigoTabelaReferencia,
        'codigoTipoVeiculo': codigoTipoVeiculo,
      },
      headers: {
        'chave': '\$2y\$10\$8IAZn7HKq7QJWbh37N3GOOeRVv.sM9tcTLBRYwRuf2g98olRyqieW',
      },
      decoder: (data) {
        if (data != null) {
          var result = jsonDecode(data);
          return result.map<VehicleBrandModel>((d) => VehicleBrandModel.fromMap(d)).toList();
        }
        return <VehicleBrandModel>[];
      },
    );
    if (response.hasError) {
      throw Exception('Erro ao buscar marcas de veículos');
    }
    return response.body ?? <VehicleBrandModel>[];
  }

  @override
  Future<List<VehicleModelModel>> getVehicleModels(
      {required int codigoTabelaReferencia, required int codigoTipoVeiculo, required codigoMarca}) async {
    final response = await _restClient.post<List<VehicleModelModel>>(
      '/ConsultarModelos',
      {
        'codigoTabelaReferencia': codigoTabelaReferencia,
        'codigoTipoVeiculo': codigoTipoVeiculo,
        'codigoMarca': codigoMarca,
      },
      headers: {
        'chave': '\$2y\$10\$8IAZn7HKq7QJWbh37N3GOOeRVv.sM9tcTLBRYwRuf2g98olRyqieW',
      },
      decoder: (data) {
        final result = jsonDecode(data);
        final resultData = result['Modelos'];
        if (resultData != null) {
          return resultData.map<VehicleModelModel>((d) => VehicleModelModel.fromMap(d)).toList();
        }
        return <VehicleModelModel>[];
      },
    );

    if (response.hasError) {
      throw Exception('Erro ao buscar marcas de veículos');
    }
    return response.body ?? <VehicleModelModel>[];
  }
}

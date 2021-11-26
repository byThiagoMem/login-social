import 'dart:convert';

import 'package:login_social/application/rest_client/rest_client.dart';
import 'package:login_social/models/reference_table_model.dart';

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
}

import 'package:get/get.dart';
import 'package:login_social/application/ui/messages/messages_mixin.dart';
import 'package:login_social/models/reference_table_model.dart';
import 'package:login_social/services/fipe/fipe_service.dart';

class FipeController extends GetxController with MessagesMixin {
  final FipeService _fipeService;

  final _message = Rxn<MessageModel>();

  final tableReference = <ReferenceTableModel>[].obs;

  int monthReferenceSelected = 0;

  FipeController({
    required FipeService fipeService,
  }) : _fipeService = fipeService;

  @override
  void onInit() {
    super.onInit();
    messageListener(_message);
  }

  Future<void> getTableReference() async {
    final response = await _fipeService.getReferenceTable();
    if (response.isNotEmpty) {
      tableReference.assignAll(response);
      monthReferenceSelected = response.last.cod;
    } else {
      _message(MessageModel.error(title: 'Erro ', message: 'Erro ao carregar dados da página'));
    }
  }
}

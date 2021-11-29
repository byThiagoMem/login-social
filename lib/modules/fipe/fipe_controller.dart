import 'package:get/get.dart';
import 'package:login_social/application/ui/loader/loader_mixin.dart';
import 'package:login_social/application/ui/messages/messages_mixin.dart';
import 'package:login_social/models/reference_table_model.dart';
import 'package:login_social/models/vehicle_brand_model.dart';
import 'package:login_social/models/vehicle_model_model.dart';
import 'package:login_social/modules/home/widgets/custom_card.dart';
import 'package:login_social/services/fipe/fipe_service.dart';

class FipeController extends GetxController with MessagesMixin, LoaderMixin {
  final FipeService _fipeService;

  final loading = false.obs;
  final _message = Rxn<MessageModel>();

  var isFirst = true;

  final tableReference = <ReferenceTableModel>[].obs;
  final vehicleBrand = <VehicleBrandModel>[].obs;
  final vehicleModels = <VehicleModelModel>[].obs;

  RxInt monthReferenceCodSelected = 0.obs;
  RxString monthReferenceLabelSelected = ''.obs;
  RxString labelMarca = ''.obs;
  RxString codigoMarca = ''.obs;
  RxString labelModel = ''.obs;
  RxString codigoModel = ''.obs;

  int get cod => Get.arguments == ConsultType.car
      ? 1
      : Get.arguments == ConsultType.motorcycle
          ? 2
          : 3;

  FipeController({
    required FipeService fipeService,
  }) : _fipeService = fipeService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await getMonthReferenceTable().whenComplete(() => getVehicleBrand(codigoTipoVeiculo: cod));
  }

  Future<void> getMonthReferenceTable() async {
    try {
      loading(true);
      final response = await _fipeService.getReferenceTable();
      tableReference.assignAll(response);
      if (isFirst) {
        monthReferenceCodSelected.value = response.first.cod;
        monthReferenceLabelSelected.value = response.first.month;
        isFirst = false;
      }
      loading(false);
    } catch (_) {
      loading(false);
      _message(MessageModel.error(title: 'Erro ', message: 'Erro ao carregar dados da página'));
    }
  }

  Future<void> getVehicleBrand({required int codigoTipoVeiculo}) async {
    try {
      loading(true);
      final response = await _fipeService.getVehicleBrand(
        codigoTabelaReferencia: monthReferenceCodSelected.value,
        codigoTipoVeiculo: codigoTipoVeiculo,
      );
      vehicleBrand.assignAll(response);
      loading(false);
    } catch (e) {
      loading(false);
      _message(MessageModel.error(title: 'Erro ', message: 'Erro ao carregar dados da página'));
    }
  }

  Future<void> getVehicleModels({required int codigoTipoVeiculo}) async {
    try {
      loading(true);
      final response = await _fipeService.getVehicleModels(
        codigoTabelaReferencia: monthReferenceCodSelected.value,
        codigoTipoVeiculo: codigoTipoVeiculo,
        codigoMarca: int.parse(codigoMarca.value),
      );
      vehicleModels.assignAll(response);
      loading(false);
    } catch (e) {
      loading(false);
      _message(MessageModel.error(title: 'Erro ', message: 'Erro ao carregar dados da página'));
    }
  }

  void toggleValuesDropDownReferenceTable({required int cod, required String label}) {
    monthReferenceCodSelected.value = cod;
    monthReferenceLabelSelected.value = label;
    Get.back();
  }

  void toggleValuesDropDownMarca({required String cod, required String label}) async {
    codigoMarca.value = cod;
    labelMarca.value = label;
    Get.back();
    await getVehicleModels(codigoTipoVeiculo: this.cod);
  }

  void toggleValuesDropDownModels({required String cod, required String label}) {
    codigoModel.value = cod;
    labelModel.value = label;
    Get.back();
  }
}

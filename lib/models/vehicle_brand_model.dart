class VehicleBrandModel {
  final String label;
  final String value;

  VehicleBrandModel({
    required this.label,
    required this.value,
  });

  factory VehicleBrandModel.fromMap(Map<String, dynamic> map) {
    return VehicleBrandModel(
      label: map['Label'],
      value: map['Value'],
    );
  }
}

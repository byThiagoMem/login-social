class VehicleModelModel {
  final String label;
  final int value;

  VehicleModelModel({
    required this.label,
    required this.value,
  });

  factory VehicleModelModel.fromMap(Map<String, dynamic> map) {
    return VehicleModelModel(
      label: map['Label'],
      value: map['Value'],
    );
  }
}

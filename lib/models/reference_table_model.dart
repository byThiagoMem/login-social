class ReferenceTableModel {
  final int cod;
  final String month;

  ReferenceTableModel({
    required this.cod,
    required this.month,
  });

  factory ReferenceTableModel.fromMap(Map<String, dynamic> map) {
    return ReferenceTableModel(
      cod: map['Codigo'],
      month: map['Mes'],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_social/modules/fipe/fipe_controller.dart';

class CustomDropdownMonthReference extends GetView<FipeController> {
  final String title;
  final Future<Object?> futureBuilder;
  final List<dynamic> data;
  const CustomDropdownMonthReference({required this.data, required this.title, required this.futureBuilder, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          FutureBuilder(
            future: futureBuilder,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (data.isNotEmpty) {
                return Column(
                  children: [
                    Center(
                      child: SizedBox(
                        child: DropdownButtonFormField<String>(
                          alignment: Alignment.bottomLeft,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          menuMaxHeight: 300,
                          value: data.first.month,
                          onChanged: (_) {},
                          items: data.map<DropdownMenuItem<String>>(
                            (e) {
                              return DropdownMenuItem<String>(
                                onTap: () => controller.monthReferenceSelected = e.cod,
                                value: e.month,
                                child: Text(
                                  e.month,
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    )
                  ],
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Erro ao carregar dados'),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}

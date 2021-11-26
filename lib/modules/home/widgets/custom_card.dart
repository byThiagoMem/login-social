import 'package:flutter/material.dart';

enum ConsultType { car, motorcycle, truck }

class CustomCard extends StatelessWidget {
  final ConsultType consultType;
  final VoidCallback onTap;
  const CustomCard({Key? key, required this.consultType, required this.onTap}) : super(key: key);

  String get title => consultType == ConsultType.car
      ? 'Consulta de carros e utilitários pequenos'
      : consultType == ConsultType.motorcycle
          ? 'Consulta de motos'
          : 'Consulta de caminhões e micro-ônibus';

  String get image => consultType == ConsultType.car
      ? 'assets/images/carro.png'
      : consultType == ConsultType.motorcycle
          ? 'assets/images/moto.png'
          : 'assets/images/caminhao.png';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: consultType == ConsultType.car
            ? Colors.red[50]
            : consultType == ConsultType.motorcycle
                ? Colors.transparent
                : Colors.red[50],
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200,
                margin: const EdgeInsets.symmetric(horizontal: 18),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  image,
                  color: Colors.black,
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

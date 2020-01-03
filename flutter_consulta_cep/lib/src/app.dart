import 'package:flutter/material.dart';
import 'package:flutter_consulta_cep/src/pages/busca_cep_page.dart';

class CepApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Consulta CEP",
      home: BuscaCepPage(),
    );
  }
}

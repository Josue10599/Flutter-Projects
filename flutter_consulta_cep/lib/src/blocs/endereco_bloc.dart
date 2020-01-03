import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_consulta_cep/src/models/endereco_model.dart';

class EnderecoBloc {
  final StreamController<String> _controller = StreamController<String>.broadcast();

  Sink<String> get input => _controller.sink;

  Stream<EnderecoModel> get output => _controller.stream.asyncMap((cep) => _searchCep(cep));

  url(String cep) => 'https://viacep.com.br/ws/$cep/json';

  Future<EnderecoModel> _searchCep(String cep) async {
    Response response = await Dio().get(url(cep));
    return EnderecoModel.fromJson(response.data);
  }
}

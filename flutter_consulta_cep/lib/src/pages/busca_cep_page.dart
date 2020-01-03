import 'package:flutter/material.dart';
import 'package:flutter_consulta_cep/src/blocs/endereco_bloc.dart';
import 'package:flutter_consulta_cep/src/models/endereco_model.dart';

class BuscaCepPage extends StatefulWidget {
  @override
  _BuscaCepPageState createState() => _BuscaCepPageState();
}

class _BuscaCepPageState extends State<BuscaCepPage> {
  EnderecoBloc _enderecoBloc = EnderecoBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Pesquisar Endereço'),
      ),
      body: Column(
        children: <Widget>[
          _campoTexto(),
          _apresentaPesquisa(),
        ],
      ),
    );
  }

  _campoTexto() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        maxLines: 1,
        keyboardType: TextInputType.number,
        onSubmitted: (texto) => _enderecoBloc.input.add(texto),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Digite o CEP do local',
        ),
      ),
    );
  }

  _apresentaPesquisa() {
    return StreamBuilder<EnderecoModel>(
      stream: _enderecoBloc.output,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          if (snapshot.hasData) {
            EnderecoModel enderecoModel = snapshot.data;
            if (enderecoModel.cep != null) {
              debugPrint('Endereco recebido');
              return _enderecoEncontrado(enderecoModel);
            } else {
              return _enderecoNaoEncontrado();
            }
          } else {
            debugPrint('Erro');
            return _enderecoNaoEncontrado();
          }
        } else {
          return LinearProgressIndicator();
        }
      },
    );
  }

  _enderecoEncontrado(EnderecoModel endereco) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Center(
              child: Text(
            "CEP: ${endereco.cep}",
            style: Theme.of(context).textTheme.headline,
          )),
          Container(margin: EdgeInsets.symmetric(vertical: 8.0)),
          Text(
            "Localidade: ${endereco.localidade}",
            style: Theme.of(context).textTheme.body1,
          ),
          Container(margin: EdgeInsets.symmetric(vertical: 8.0)),
          Text(
            "Estado: ${endereco.uf}",
            style: Theme.of(context).textTheme.body1,
          ),
          Container(margin: EdgeInsets.symmetric(vertical: 8.0)),
          Text(
            "Bairro: ${endereco.bairro}",
            style: Theme.of(context).textTheme.body1,
          ),
          Container(margin: EdgeInsets.symmetric(vertical: 8.0)),
          Text(
            "Logradouro: ${endereco.logradouro}",
            style: Theme.of(context).textTheme.body1,
          ),
          Container(margin: EdgeInsets.symmetric(vertical: 8.0)),
          Text(
            "Complemento: ${endereco.complemento}",
            style: Theme.of(context).textTheme.body1,
          ),
          Container(margin: EdgeInsets.symmetric(vertical: 8.0)),
          Text(
            "Unidade: ${endereco.unidade}",
            style: Theme.of(context).textTheme.body1,
          ),
          Container(margin: EdgeInsets.symmetric(vertical: 8.0)),
          Text(
            "IBGE: ${endereco.ibge}",
            style: Theme.of(context).textTheme.body1,
          ),
          Container(margin: EdgeInsets.symmetric(vertical: 8.0)),
          Text(
            "GIA: ${endereco.gia}",
            style: Theme.of(context).textTheme.body1,
          ),
        ],
      ),
    );
  }

  _enderecoNaoEncontrado() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Text("NENHUMA LOCALIDADE ENCONTRADA"),
    );
  }
}

import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  late TextEditingController _controladorCalc;

  @override
  void initState() {
    _controladorCalc = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _controladorCalc.dispose();

    super.dispose();
  }

  void _adicao() {
    int qtdPosicoes = _controladorCalc.text.split('+').length.toInt();

    late List<double> valor = [];

    for (int cont = 0; cont < qtdPosicoes; cont++) {
      valor.add(double.parse(_controladorCalc.text.split('+')[cont]));
    }

    double valorDouble = 0;

    for (int cont = 0; cont < qtdPosicoes; cont++) {
      valorDouble = valorDouble + valor[cont];
    }

    if (valorDouble.toString().endsWith('.0')) {
      _controladorCalc.text = valorDouble
          .toString()
          .substring(0, valorDouble.toString().length - 2);
    } else {
      _controladorCalc.text = valorDouble.toString();
    }
  }

  void _subtracao() {
    int qtdPosicoes = _controladorCalc.text.split('-').length.toInt();

    late List<double> valor = [];

    for (int cont = 0; cont < qtdPosicoes; cont++) {
      valor.add(double.parse(_controladorCalc.text.split('-')[cont]));
    }

    double valorDouble = valor[0];

    for (int cont = 1; cont < qtdPosicoes; cont++) {
      valorDouble = valorDouble - valor[cont];
    }

    if (valorDouble.toString().endsWith('.0')) {
      _controladorCalc.text = valorDouble
          .toString()
          .substring(0, valorDouble.toString().length - 2);
    } else {
      _controladorCalc.text = valorDouble.toString();
    }
  }

  void _multiplicacao() {
    int qtdPosicoes = _controladorCalc.text.split('X').length.toInt();

    late List<double> valor = [];

    for (int cont = 0; cont < qtdPosicoes; cont++) {
      valor.add(double.parse(_controladorCalc.text.split('X')[cont]));
    }

    double valorDouble = valor[0];

    for (int cont = 1; cont < qtdPosicoes; cont++) {
      valorDouble = valorDouble * valor[cont];
    }

    if (valorDouble.toString().endsWith('.0')) {
      _controladorCalc.text = valorDouble
          .toString()
          .substring(0, valorDouble.toString().length - 2);
    } else {
      _controladorCalc.text = valorDouble.toString();
    }
  }

  void _divisao() {
    int qtdPosicoes = _controladorCalc.text.split('÷').length.toInt();

    late List<double> valor = [];

    for (int cont = 0; cont < qtdPosicoes; cont++) {
      valor.add(double.parse(_controladorCalc.text.split('÷')[cont]));
    }

    double valorDouble = valor[0];

    if (valor[1] == 0) {
      _controladorCalc.text = 'NÃO É POSSÍVEL REALIZAR DIVISÃO POR ZERO';
    } else {
      for (int cont = 1; cont < qtdPosicoes; cont++) {
        valorDouble = valorDouble / valor[cont];
      }

      if (valorDouble.toString().endsWith('.0')) {
        _controladorCalc.text = valorDouble
            .toString()
            .substring(0, valorDouble.toString().length - 2);
      } else {
        _controladorCalc.text = valorDouble.toString();
      }
    }
  }

  void _porcentagem() {
    double valor1 = double.parse(_controladorCalc.text.split('%')[0]);
    double valor2 = double.parse(_controladorCalc.text.split('%')[1]);

    double resultado = (valor1 / 100) * valor2;

    String resultadoFormatado = resultado.toString();

    if (resultadoFormatado.endsWith('.0')) {
      resultadoFormatado =
          resultadoFormatado.substring(0, resultadoFormatado.length - 2);
    }
    _controladorCalc.text = resultadoFormatado;
  }

  void _adicionarTextField(String valor) {
    String valorAtual = _controladorCalc.text;
    _controladorCalc.text = valorAtual + valor;
  }

  void _limpar() {
    _controladorCalc.clear();
  }

  void _realizaOperacao() {
    String valor = _controladorCalc.text;

    if (valor.contains("+")) {
      _adicao();
    } else if (valor.contains("-")) {
      _subtracao();
    } else if (valor.contains("X")) {
      _multiplicacao();
    } else if (valor.contains("÷")) {
      _divisao();
    } else if (valor.contains("%")) {
      _porcentagem();
    }
  }

  void _apagaPosicao() {
    if (_controladorCalc.text.isNotEmpty) {
      _controladorCalc.text =
          _controladorCalc.text.substring(0, _controladorCalc.text.length - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0x3E3D644D),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 200),
              TextField(
                controller: _controladorCalc,
                readOnly: true,
                decoration: const InputDecoration(
                    label: Center(
                      child: Text(
                        'Insira os valores...',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Ex: 1 + 1 = 2',
                    hintStyle: TextStyle(fontSize: 20)),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.width / 4,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.blueGrey)),
                    onPressed: () => _adicionarTextField('7'),
                    child: const Text(
                      '7',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.width / 4,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.blueGrey)),
                    onPressed: () => _adicionarTextField('8'),
                    child: const Text(
                      '8',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.width / 4,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.blueGrey)),
                    onPressed: () => _adicionarTextField('9'),
                    child: const Text(
                      '9',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.width / 4,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.grey)),
                    onPressed: () => _adicionarTextField('÷'),
                    child: const Text(
                      '÷',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 4,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blueGrey)),
                      onPressed: () => _adicionarTextField('4'),
                      child: const Text(
                        '4',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 4,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blueGrey)),
                      onPressed: () => _adicionarTextField('5'),
                      child: const Text(
                        '5',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 4,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blueGrey)),
                      onPressed: () => _adicionarTextField('6'),
                      child: const Text(
                        '6',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 4,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.grey)),
                      onPressed: () => _adicionarTextField('X'),
                      child: const Text(
                        'X',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 4,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blueGrey)),
                      onPressed: () => _adicionarTextField('1'),
                      child: const Text(
                        '1',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 4,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blueGrey)),
                      onPressed: () => _adicionarTextField('2'),
                      child: const Text(
                        '2',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 4,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blueGrey)),
                      onPressed: () => _adicionarTextField('3'),
                      child: const Text(
                        '3',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 4,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.grey)),
                      onPressed: () => _adicionarTextField('-'),
                      child: const Text(
                        '-',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 4,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blueGrey)),
                      onPressed: () => _adicionarTextField('0'),
                      child: const Text(
                        '0',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 4,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blueGrey)),
                      onPressed: () => _adicionarTextField('.'),
                      child: const Text(
                        '.',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 4,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blueAccent)),
                      onPressed: () => _realizaOperacao(),
                      child: const Text(
                        '=',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 4,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.grey)),
                      onPressed: () => _adicionarTextField('+'),
                      child: const Text(
                        '+',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 4,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green)),
                      onPressed: () => _limpar(),
                      child: const Text(
                        'CE',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 4,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.grey)),
                      onPressed: () => _adicionarTextField('%'),
                      child: const Text(
                        '%',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 4,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.grey)),
                      onPressed: () => _apagaPosicao(),
                      child: const Text(
                        '⌫',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

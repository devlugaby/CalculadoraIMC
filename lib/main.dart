import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC',
      theme: ThemeData(
        primaryColor: Colors.green[900], // Cor verde escuro
        hintColor: Colors.greenAccent,
      ),
      initialRoute: '/login', // Definindo a rota inicial como a tela de login
      routes: {
        '/login': (context) => const LoginScreen(), // Tela de login
        '/imc': (context) => const IMCCalculator(), // Tela de cálculo de IMC
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.green[900], // Cor verde escuro
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context,
                '/imc'); // Navegar para a tela de cálculo de IMC ao clicar no botão
          },
          child: const Text('Ir para o cálculo de IMC'),
        ),
      ),
    );
  }
}

class IMCCalculator extends StatefulWidget {
  const IMCCalculator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IMCCalculatorState createState() => _IMCCalculatorState();
}

class _IMCCalculatorState extends State<IMCCalculator> {
  double _weight = 0;
  double _height = 0;
  double _imc = 0;

  void _calculateIMC() {
    setState(() {
      _imc = _weight /
          ((_height / 100) * (_height / 100)); // Convertendo altura para metros
    });
  }

  String _getIMCResult() {
    if (_imc < 16) {
      return 'Magreza grave';
    } else if (_imc >= 16 && _imc < 16.9) {
      return 'Magreza moderada';
    } else if (_imc >= 17 && _imc < 18.5) {
      return 'Magreza leve';
    } else if (_imc >= 18.5 && _imc < 25) {
      return 'Peso ideal';
    } else if (_imc >= 25 && _imc < 30) {
      return 'Sobrepeso';
    } else if (_imc >= 30 && _imc < 35) {
      return 'Obesidade grau I';
    } else if (_imc >= 35 && _imc < 40) {
      return 'Obesidade grau II ou severa';
    } else {
      return 'Obesidade grau III ou mórbida';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
        backgroundColor: Colors.green[900], // Cor verde escuro
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Digite o peso (kg)'),
              onChanged: (value) {
                setState(() {
                  _weight = double.tryParse(value) ?? 0;
                });
              },
            ),
            const SizedBox(height: 20.0),
            TextField(
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Digite a altura (cm)'),
              onChanged: (value) {
                setState(() {
                  _height = double.tryParse(value) ?? 0;
                });
              },
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _calculateIMC,
              child: const Text('Calcular IMC'),
            ),
            const SizedBox(height: 20.0),
            Text(
              'IMC: ${_imc.toStringAsFixed(2)}',
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Resultado: ${_getIMCResult()}',
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Criado por: Luana Gabrielly',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}

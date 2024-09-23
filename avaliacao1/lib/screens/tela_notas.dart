import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TelaNotas extends StatefulWidget {
  final String token;
  TelaNotas({required this.token});

  @override
  _TelaNotasState createState() => _TelaNotasState();
}

class _TelaNotasState extends State<TelaNotas> {
  List<Map<String, dynamic>> alunos = [];
  List<Map<String, dynamic>> alunosFiltrados = [];

  Future<void> _buscarNotas() async {
    final response =
        await http.get(Uri.parse('http://demo9657599.mockable.io/notasAlunos'));

    if (response.statusCode == 200) {
      setState(() {
        final data = jsonDecode(response.body);
        alunos = List<Map<String, dynamic>>.from(data['alunos']);
        alunosFiltrados = alunos;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao buscar notas: ${response.statusCode}')),
      );
    }
  }

  void _filtrarAlunos(int filtro) {
    setState(() {
      if (filtro == 0) {
        alunosFiltrados = alunos.where((aluno) => aluno['nota'] < 60).toList();
      } else if (filtro == 1) {
        alunosFiltrados = alunos
            .where((aluno) => aluno['nota'] >= 60 && aluno['nota'] < 100)
            .toList();
      } else {
        alunosFiltrados =
            alunos.where((aluno) => aluno['nota'] == 100).toList();
      }
    });
  }

  Color _corDeFundo(int nota) {
    if (nota == 100) return Colors.green;
    if (nota >= 60) return Colors.blue;
    return Colors.yellow;
  }

  @override
  void initState() {
    super.initState();
    _buscarNotas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notas dos Alunos')),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _filtrarAlunos(0),
                child: Text('<60'),
              ),
              ElevatedButton(
                onPressed: () => _filtrarAlunos(1),
                child: Text('>=60 e <100'),
              ),
              ElevatedButton(
                onPressed: () => _filtrarAlunos(2),
                child: Text('=100'),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: alunosFiltrados.length,
              itemBuilder: (context, index) {
                final aluno = alunosFiltrados[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  color: _corDeFundo(aluno['nota']),
                  child: ListTile(
                    title: Text('${aluno['nome']} - Nota: ${aluno['nota']}'),
                    subtitle: Text('Matrícula: ${aluno['matricula']}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

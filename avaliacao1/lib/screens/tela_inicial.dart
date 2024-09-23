import 'package:flutter/material.dart';
import 'tela_login.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo_escola.png', height: 150),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaLogin(),
                  ),
                );
              },
              child: Text('Acessar'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //fazerLogin();
    buscarContatos();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Função para buscar os valores dos documentos na coleção 'contacts'
void buscarContatos() async {
  try {
    // Referência à coleção 'contacts'
    CollectionReference contatosRef =
        FirebaseFirestore.instance.collection('contacts');

    // Obter os documentos da coleção 'contacts'
    QuerySnapshot querySnapshot = await contatosRef.get();

    // Iterar sobre os documentos e acessar seus dados
    querySnapshot.docs.forEach((doc) {
      // Acessar os dados de cada documento
      Map<String, dynamic>? dados = doc.data() as Map<String, dynamic>?;

      // Exemplo de como acessar os valores de campos específicos
      String nome = dados?['name'];
      String telefone = dados?['phoneNumber'];

      // Faça o que precisar com os dados
      print('Nome: $nome, Telefone: $telefone');
    });
  } catch (e) {
    print('Erro ao buscar contatos: $e');
  }
}

Future<void> fazerLogin() async {
  try {
    // Fazer o login com e-mail e senha
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: 'garridolygia@gmail.com',
      password: 'teste123',
    );

    // Se o login for bem-sucedido, o usuário está autenticado
    print(
        'Login realizado com sucesso! Usuário: ${userCredential.user?.email}');
  } catch (e) {
    // Se ocorrer um erro durante o login, imprima o erro
    print('Erro ao fazer login: $e');
  }
}

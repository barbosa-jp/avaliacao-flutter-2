import 'package:avaliacao_2/src/features/cadastro/presentation/pages/tela_cadastro.dart';
import 'package:avaliacao_2/src/features/diario/presentation/pages/diario.dart';
import 'package:avaliacao_2/src/features/navigator/presentation/widgets/navigator.dart';
import 'package:flutter/material.dart';
import 'package:avaliacao_2/src/features/cores/core/cores.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final _formKey = GlobalKey<FormState>();
  final _emailLogin = '';
  final _senhaLogin = '';

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  void _carregarDados() async{
    final url = Uri.https(
      'flutter-project-prova-default-rtdb.firebaseio.com', 'user.json'
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> users = json.decode(response.body);
        final listaLogados = users.entries.toList();

        bool isUserValido = listaLogados.any((entry) {
          final userDado = entry.value;
          return 
            userDado['email'] == _emailLogin && 
            userDado['senha'] == _senhaLogin;
        });

        if(isUserValido) {
          if(!context.mounted) {
            return;
          }

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const Diario();
              }
            )
          );
        } else {
          if(!context.mounted) {
            return;
          }
          showDialog(
            context: context, 
            builder: (ctx) => AlertDialog(
              title: const Text('Erro'),
              content: const Text('Email ou senha inválidos!'),
            )
          );
        }
      } else {
        throw Exception('Falha ao carregar os dados');
      }

    } catch (error) {
      print(error);
    }
  }

  void _validarLogin() async{
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      print('EMAIL SALVO: ${_emailLogin}');
      _carregarDados();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.roxo1,
      body: Padding(
        padding: const EdgeInsets.only(top: 150),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 25,
              ),
              child: Image.asset(
                'assets/images/diary.png',
                height: 120,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Diário',
              style: GoogleFonts.lato(
                fontSize: 40,
                color: Cores.branco,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 25,
              ),
              child: Form(
                  child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Cores.branco,
                    style: GoogleFonts.lato(color: Cores.branco),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: const TextStyle(color: Cores.branco50),
                      hintText: 'Digite seu email...',
                      prefixIcon: const Icon(Icons.email),
                      prefixIconColor: Cores.branco,
                      filled: true,
                      fillColor: Cores.roxo2,
                      hintStyle: GoogleFonts.lato(color: Cores.branco50),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (String value) {},
                    validator: (value) {
                      return value;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    cursorColor: Cores.branco,
                    style: GoogleFonts.lato(color: Cores.branco),
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      labelStyle: const TextStyle(color: Cores.branco50),
                      hintText: 'Digite sua senha...',
                      prefixIcon: const Icon(Icons.password),
                      prefixIconColor: Cores.branco,
                      filled: true,
                      fillColor: Cores.roxo2,
                      hintStyle: GoogleFonts.lato(color: Cores.branco50),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (String value) {},
                    validator: (value) {
                      return value;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Não tem uma conta?',
                        style: TextStyle(
                          fontSize: 18,
                          color: Cores.branco50
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return const TelaCadastro();
                              }
                            )
                          );
                        },
                        child: const Text(
                          'Registra-se',
                          style: TextStyle(
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                            decorationColor: Cores.branco50,
                            color: Cores.branco50
                          ),
                        )
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 135,
                    height: 45,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          backgroundColor: Cores.roxo5),
                      onPressed: _validarLogin,
                      child: Text(
                        'Entrar',
                        style: GoogleFonts.lato(
                          color: Cores.branco,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  )
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}

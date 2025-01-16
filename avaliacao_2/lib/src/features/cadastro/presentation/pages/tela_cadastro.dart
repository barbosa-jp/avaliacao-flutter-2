import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:avaliacao_2/src/features/cores/core/cores.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;


class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final _formKey = GlobalKey<FormState>();
  var _emailInserido = '';
  var _senhaInserida = '';

  void _saveUser() async{
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final url = Uri.https(
        'flutter-project-prova-default-rtdb.firebaseio.com', 'user.json'
      );
      final response = await http.post(
        url, 
        headers: {
          'Content-Type': 'application/json',
        }, 
        body: json.encode({
          'email': _emailInserido,
          'senha': _senhaInserida,
        })
      );
      print(response.statusCode);

      if(!context.mounted) {
        return;
      }
      Navigator.of(context).pop();
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
            Text(
              'Cadastro',
              style: GoogleFonts.lato(
                fontSize: 20,
                color: Cores.branco50,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 25,
              ),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Cores.branco,
                        style: const TextStyle(color: Cores.branco),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: const TextStyle(color: Cores.branco50),
                          hintText: 'Digite seu email...',
                          prefixIcon: const Icon(Icons.email),
                          prefixIconColor: Cores.branco,
                          filled: true,
                          fillColor: Cores.roxo2,
                          hintStyle: GoogleFonts.lato(color: Cores.branco50),
                          errorStyle: const TextStyle(
                              fontSize: 16, color: Cores.vermelho),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$')
                                  .hasMatch(value)) {
                            return 'Insira um email válido';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _emailInserido = value!;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        cursorColor: Cores.branco,
                        style: const TextStyle(color: Cores.branco),
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          labelStyle: const TextStyle(color: Cores.branco50),
                          hintText: 'Digite sua senha...',
                          prefixIcon: const Icon(Icons.password),
                          prefixIconColor: Cores.branco,
                          filled: true,
                          fillColor: Cores.roxo2,
                          hintStyle: GoogleFonts.lato(color: Cores.branco50),
                          errorStyle: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 228, 96, 94)),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim().length <= 3) {
                            return 'Insira uma senha com mais de 3 caracteres';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _senhaInserida = value!;
                        },
                      ),
                      const SizedBox(
                        height: 50,
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
                          onPressed: _saveUser,
                          child: Text(
                            'Cadastrar',
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

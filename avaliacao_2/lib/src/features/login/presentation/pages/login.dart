import 'package:avaliacao_2/src/features/cadastro/presentation/pages/tela_cadastro.dart';
import 'package:avaliacao_2/src/features/diario/presentation/pages/diario.dart';
import 'package:flutter/material.dart';
import 'package:avaliacao_2/src/features/cores/core/cores.dart';
import 'package:google_fonts/google_fonts.dart';

class TelaLogin extends StatelessWidget {
  const TelaLogin({super.key});

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
                    keyboardType: TextInputType.emailAddress,
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
                      onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return const Diario();
                              }
                            )
                        );
                      },
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

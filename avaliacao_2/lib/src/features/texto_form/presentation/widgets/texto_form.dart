// import 'package:avaliacao_2/src/features/cores/core/cores.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class TextoForm extends StatelessWidget {
//   const TextoForm({super.key, required this.tipo, required this.texto});

//   final TextInputType tipo; 
//   final String texto;
//   final String hintTexto;
//   final Icon icone;
//   final String erro;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       keyboardType: tipo,
//       cursorColor: Cores.branco,
//       style: GoogleFonts.lato(color: Cores.branco),
//       decoration: InputDecoration(
//         labelText: texto,
//         labelStyle: const TextStyle(color: Cores.branco50),
//         hintText: hintTexto,
//         prefixIcon: icone,
//         prefixIconColor: Cores.branco,
//         filled: true,
//         fillColor: Cores.roxo2,
//         hintStyle: GoogleFonts.lato(color: Cores.branco50),
//         border: const OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//           borderSide: BorderSide.none,
//         ),
//       ),
//       validator: (value) {
//         if (value == null ||
//             value.isEmpty ||
//             !RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$')
//                 .hasMatch(value)) {
//           return erro;
//         }
//         return null;
//       },
//       onSaved: (value) {
//         // _emailLogin = value!;
//       },
//     ),
//   }
// }

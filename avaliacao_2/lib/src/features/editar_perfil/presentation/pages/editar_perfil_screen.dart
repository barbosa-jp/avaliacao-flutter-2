import 'dart:typed_data';

import 'package:avaliacao_2/src/features/cores/core/cores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:avaliacao_2/src/features/editar_perfil/presentation/pages/utils.dart';

class EditarPerfil extends StatefulWidget {
  const EditarPerfil({super.key});

  @override
  State<EditarPerfil> createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  Color corBanner = Cores.branco;
  Uint8List?  _image;

  selecionarImagem() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  buildColorPicker() => ColorPicker(
      pickerColor: corBanner,
      enableAlpha: false,
      onColorChanged: (cor) => setState(() {
            corBanner = cor;
          }));

  void escolherCor(context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Text('Escolha uma cor'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildColorPicker(),
              TextButton(
                child: Text(
                  'Selecionar',
                  style: TextStyle(fontSize: 25),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          )));

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 25,
        ),
        child: Form(
            child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Container(
              width: 400,
              height: 50,
              decoration: BoxDecoration(
                color: corBanner,
              ),
              child: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () => escolherCor(context),
              )),
          SizedBox(height: 15),
          Text('Editar cor do banner', style: TextStyle(color: Cores.branco50)),
          SizedBox(
            height: 30,
          ),
          Stack(children: [
            SizedBox(
              height: 100,
              width: 100,              
              child: 
                _image != null ?
                  CircleAvatar(
                    radius: 64,
                    backgroundImage: MemoryImage(_image!),
                  )

                :
                  CircleAvatar(
                    backgroundColor: Cores.roxo5,
                    child: IconButton(
                        onPressed: selecionarImagem,
                        icon: Icon(Icons.person_2_sharp,
                            size: 50, color: Cores.branco50)),
                  ),
            ),
          ]),
          SizedBox(height: 15),
          Text(
            'Editar foto de perfil',
            style: TextStyle(color: Cores.branco50)
          ),
          SizedBox(height: 30),
          TextFormField(
            keyboardType: TextInputType.name,
            cursorColor: Cores.branco,
            style: const TextStyle(color: Cores.branco),
            decoration: InputDecoration(
              labelText: 'Nome',
              labelStyle: const TextStyle(color: Cores.branco50),
              hintText: 'Digite seu nome...',
              prefixIconColor: Cores.branco,
              filled: true,
              fillColor: Cores.roxo2,
              hintStyle: GoogleFonts.lato(color: Cores.branco50),
              errorStyle: const TextStyle(fontSize: 16, color: Cores.vermelho),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none,
              ),
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                return 'Insira um email válido';
              }
              return null;
            },
            onSaved: (value) {
              // _emailInserido = value!;
            },
          ),
          SizedBox(height: 25),
          TextFormField(
            keyboardType: TextInputType.number,
            cursorColor: Cores.branco,
            style: const TextStyle(color: Cores.branco),
            decoration: InputDecoration(
              labelText: 'Idade',
              labelStyle: const TextStyle(color: Cores.branco50),
              hintText: 'Digite sua idade...',
              prefixIconColor: Cores.branco,
              filled: true,
              fillColor: Cores.roxo2,
              hintStyle: GoogleFonts.lato(color: Cores.branco50),
              errorStyle: const TextStyle(fontSize: 16, color: Cores.vermelho),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none,
              ),
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                return 'Insira um email válido';
              }
              return null;
            },
            onSaved: (value) {
              // _emailInserido = value!;
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
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  backgroundColor: Cores.roxo5),
              onPressed: () {},
              child: Text(
                'Salvar',
                style: GoogleFonts.lato(
                  color: Cores.branco,
                  fontSize: 18,
                ),
              ),
            ),
          )
        ])));
  }
}

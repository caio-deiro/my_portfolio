import 'package:flutter/material.dart';

import '../cpf_controller.dart';

class CpfGenerator extends StatefulWidget {
  const CpfGenerator({Key? key}) : super(key: key);

  @override
  State<CpfGenerator> createState() => _CpfGeneratorState();
}

class _CpfGeneratorState extends State<CpfGenerator> {
  late CpfController controller;

  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controller = CpfController();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Validacao de CPF'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () => controller.generateCpf(),
                  child: Text('Gerar CPF'),
                ),
                SizedBox(height: 25),
                Text(
                  'o CPF gerado é: ${controller.cpfGenerated}',
                ),
                SizedBox(height: 40),
                Form(
                  key: formkey,
                  child: TextFormField(
                    maxLength: 11,
                    keyboardType: TextInputType.number,
                    controller: controller.cpfController,
                    decoration: InputDecoration(
                      label: Text('Coloque um CPF!'),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value != null) {
                        if (value.isEmpty) {
                          return 'campo vazio, ensira um cpf';
                        } else if (value.contains(RegExp(r'[^0-9]'))) {
                          return 'digitar apenas números!';
                        } else if (value.length < 11) {
                          return 'coloque um CPF com 11 digitos';
                        }
                      }
                      return null;
                    },
                    onFieldSubmitted: (_) async {
                      if (formkey.currentState?.validate() ?? false) {
                        if (controller
                            .validateCpf(controller.cpfController.text)) {
                          await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    'CPF Válido!',
                                    style: TextStyle(color: Colors.green),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('Voltar'),
                                    )
                                  ],
                                );
                              });
                        } else {
                          await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('CPF Inválido'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('Voltar'),
                                    )
                                  ],
                                );
                              });
                        }
                      } else {
                        controller.enableButtonAfterSecondsOver();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.redAccent,
                          content: Text(
                            'Numeros insuficientes para fazer a validação!',
                          ),
                        ));
                      }
                    },
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: controller.enableButton
                      ? () async {
                          if (formkey.currentState?.validate() ?? false) {
                            if (controller
                                .validateCpf(controller.cpfController.text)) {
                              await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        'CPF Válido!',
                                        style: TextStyle(color: Colors.green),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text('Voltar'),
                                        )
                                      ],
                                    );
                                  });
                            } else {
                              await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('CPF Inválido'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text('Voltar'),
                                        )
                                      ],
                                    );
                                  });
                            }
                          } else {
                            controller.enableButtonAfterSecondsOver();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.redAccent,
                              content: Text(
                                'Numeros insuficientes para fazer a validação!',
                              ),
                            ));
                          }
                        }
                      : null,
                  child: Text('Validar CPF!'),
                ),
              ],
            ),
          ),
        ));
  }
}

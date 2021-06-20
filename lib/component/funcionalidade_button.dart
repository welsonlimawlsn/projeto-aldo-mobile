import 'package:flutter/material.dart';

class FuncionalidadeButton extends StatelessWidget {
  final String nome;
  final String rota;
  final IconData icone;

  const FuncionalidadeButton({
    Key? key,
    required this.nome,
    required this.rota,
    required this.icone,
  }) : super(key: key);

  void _navega(BuildContext context) {
    Navigator.of(context).pushNamed(rota);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navega(context),
      splashColor: Colors.black,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icone,
              size: 70,
            ),
            SizedBox(
              height: 10,
            ),
            FittedBox(
              child: Text(
                nome,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor.withOpacity(0.50),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}

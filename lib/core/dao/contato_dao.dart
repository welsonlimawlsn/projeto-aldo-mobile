import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:projeto_aldo/core/model/contato.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

class ContatoDAO {
  static final instance = ContatoDAO._();

  ContatoDAO._();

  Future<Database> get _database async {
    WidgetsFlutterBinding.ensureInitialized();

    return await openDatabase(
      join(await getDatabasesPath(), 'contatos.db'),
      onCreate: (db, version) => db.execute(
        "CREATE TABLE CONTATOS (ID VARCHAR (50), NOME VARCHAR (100), TELEFONE VARCHAR (15))",
      ),
      version: 1,
    );
  }

  Future<int> salvar(Contato contato) async {
    return await (await _database).insert('CONTATOS', {
      'ID': Uuid().v4().toString(),
      'NOME': contato.nome,
      'TELEFONE': contato.telefone
    });
  }

  Future<int> deletar(Contato contato) async {
    return await (await _database).delete(
      'CONTATOS',
      where: 'ID=?',
      whereArgs: [contato.id],
    );
  }

  Future<int> alterar(Contato contato) async {
    return await (await _database).update(
        'CONTATOS',
        {
          'NOME': contato.nome,
          'TELEFONE': contato.telefone,
        },
        where: 'ID=?',
        whereArgs: [contato.id]);
  }

  Future<List<Contato>> listaTodos() async {
    var maps = await (await _database).query('CONTATOS');
    return List.generate(
      maps.length,
      (index) => Contato(
        id: maps[index]['ID'] as String,
        nome: maps[index]['NOME'] as String,
        telefone: maps[index]['TELEFONE'] as String,
      ),
    );
  }
}

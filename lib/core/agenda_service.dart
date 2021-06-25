import 'package:projeto_aldo/core/dao/contato_dao.dart';
import 'package:projeto_aldo/core/model/contato.dart';

class AgendaService {
  static final AgendaService instance = AgendaService._();

  final _contatoDAO = ContatoDAO.instance;

  AgendaService._();

  Future<int> novoContato(Contato contato) {
    return _contatoDAO.salvar(contato);
  }

  Future<List<Contato>> listaContatos() async {
    return await _contatoDAO.listaTodos();
  }

  Future<int> removeContato(Contato contato) {
    return _contatoDAO.deletar(contato);
  }

  Future<int> alteraContato(Contato contato) {
    return _contatoDAO.alterar(contato);
  }
}

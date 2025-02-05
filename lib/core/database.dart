import 'package:mysql1/mysql1.dart';

class DatabaseHelper {
  static Future<MySqlConnection> connect() async {
    final settings = ConnectionSettings(
        host: 'sql10.freesqldatabase.com',
        port: 3306,
        user: 'sql10761220',
        password: 'IqUyriV5kg',
        db: 'sql10761220');

    final conn = await MySqlConnection.connect(settings);

    // criar tabela se nao existir
    await conn.query('''
  CREATE TABLE IF NOT EXISTS tarefa (
  id int AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  descricao TEXT,
  status VARCHAR(50) NOT NULL,
  dataInicio DATETIME,
  dataFim DATETIME
     )
  ''');
    return conn;
  }
}

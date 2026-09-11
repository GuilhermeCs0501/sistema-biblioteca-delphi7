unit uBanco;

interface

uses
  Windows, SysUtils, Classes, Dialogs, ADODB;

procedure InicializarBanco;

implementation

procedure InicializarBanco;
var
  Conexao: TADOConnection;
  Consulta: TADOQuery;
begin
  Conexao := TADOConnection.Create(nil);
  Consulta := TADOQuery.Create(nil);

  try
    {
      CONECTA NO BANCO MASTER
       }

    Conexao.LoginPrompt := False;

    Conexao.ConnectionString :=
      'Provider=SQLOLEDB;' +
      'Data Source=.;' +
      'Initial Catalog=master;' +
      'Integrated Security=SSPI;';

    Conexao.Connected := True;

    Consulta.Connection := Conexao;

    {
      CRIA O BANCO FAI
       }

    Consulta.SQL.Text :=
      'IF DB_ID(''FAI'') IS NULL ' +
      'CREATE DATABASE FAI';

    Consulta.ExecSQL;

    {
      CONECTA NO BANCO FAI
      }

    Conexao.Connected := False;

    Conexao.ConnectionString :=
      'Provider=SQLOLEDB;' +
      'Data Source=.;' +
      'Initial Catalog=FAI;' +
      'Integrated Security=SSPI;';

    Conexao.Connected := True;

    {
      CRIA TABELA LIVRO
       }

    Consulta.SQL.Text :=
      'IF OBJECT_ID(''dbo.Livro'', ''U'') IS NULL ' +
      'BEGIN ' +
      'CREATE TABLE dbo.Livro (' +
      'ISBN VARCHAR(10) NOT NULL PRIMARY KEY, ' +
      'Titulo VARCHAR(80) NOT NULL, ' +
      'Genero VARCHAR(20) NOT NULL, ' +
      'Autor VARCHAR(60) NOT NULL, ' +
      'Paginas INT NOT NULL, ' +
      'Idioma VARCHAR(20) NOT NULL' +
      ') ' +
      'END';

    Consulta.ExecSQL;

    {
      CRIA TABELA ALUNO
       }

    Consulta.SQL.Text :=
      'IF OBJECT_ID(''dbo.Aluno'', ''U'') IS NULL ' +
      'BEGIN ' +
      'CREATE TABLE dbo.Aluno (' +
      'RA VARCHAR(20) NOT NULL PRIMARY KEY, ' +
      'Nome VARCHAR(80) NOT NULL, ' +
      'Curso VARCHAR(80) NOT NULL, ' +
      'Endereco VARCHAR(120) NOT NULL' +
      ') ' +
      'END';

    Consulta.ExecSQL;

    ShowMessage('Banco e tabelas criados');

  finally
    Consulta.Free;
    Conexao.Free;
  end;
end;

end.


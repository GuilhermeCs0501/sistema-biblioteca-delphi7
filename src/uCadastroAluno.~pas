unit uCadastroAluno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroBase, StdCtrls, ExtCtrls, Grids, DBGrids, DB, ADOdb;

type
  TfrmCadastroAluno = class(TfrmCadastroBase)
    lblRA: TLabel;
    edtRA: TEdit;
    lblNome: TLabel;
    edtNome: TEdit;
    lblCurso: TLabel;
    cmbCurso: TComboBox;
    lblEndereco: TLabel;
    edtEndereco: TEdit;
  private
    { Private declarations }
  protected
    function GetTitulo: string; override;
    function SQLConsulta: string; override;
    procedure LimparCampos; override;
    procedure HabilitarCampos(AHabilitar: Boolean); override;
    procedure FocarPrimeiroCampo; override;
    procedure ConfigurarColunas; override;
    function ValidarCampos: Boolean; override;
    function IncluirRegistro: Boolean; override;
    procedure ExcluirRegistro; override;
    procedure CarregarCampos; override;
  public
    { Public declarations }
  end;

var
  frmCadastroAluno: TfrmCadastroAluno;

implementation

{$R *.dfm}

function TfrmCadastroAluno.GetTitulo: string;
begin
  Result := 'Cadastro de Aluno';
end;

function TfrmCadastroAluno.SQLConsulta: string;
begin
  Result := 'SELECT RA, Nome, Curso, Endereco FROM Aluno';
end;

procedure TfrmCadastroAluno.ConfigurarColunas;
begin
  if dbgDados.Columns.Count < 4 then
    Exit;
  dbgDados.Columns[0].Title.Caption := 'RA';
  dbgDados.Columns[0].Width := 100;
  dbgDados.Columns[1].Title.Caption := 'Nome';
  dbgDados.Columns[1].Width := 220;
  dbgDados.Columns[2].Title.Caption := 'Curso';
  dbgDados.Columns[2].Width := 180;
  dbgDados.Columns[3].Title.Caption := 'Endere'#231'o';
  dbgDados.Columns[3].Width := 180;
end;

procedure TfrmCadastroAluno.LimparCampos;
begin
  edtRA.Clear;
  edtNome.Clear;
  cmbCurso.ItemIndex := -1;
  edtEndereco.Clear;
end;

procedure TfrmCadastroAluno.HabilitarCampos(AHabilitar: Boolean);
begin
  edtRA.Enabled := AHabilitar;
  edtNome.Enabled := AHabilitar;
  cmbCurso.Enabled := AHabilitar;
  edtEndereco.Enabled := AHabilitar;
end;

procedure TfrmCadastroAluno.FocarPrimeiroCampo;
begin
  if edtRA.CanFocus then
    edtRA.SetFocus;
end;

function TfrmCadastroAluno.ValidarCampos: Boolean;
begin
  Result :=
    (Trim(edtRA.Text) <> '') and
    (Trim(edtNome.Text) <> '') and
    (cmbCurso.ItemIndex >= 0) and
    (Trim(edtEndereco.Text) <> '');
end;

function TfrmCadastroAluno.IncluirRegistro: Boolean;
begin
  Result := False;

  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT RA FROM Aluno WHERE RA = :RA');
  ADOQuery1.Parameters.ParamByName('RA').Value := Trim(edtRA.Text);
  ADOQuery1.Open;
  if not ADOQuery1.IsEmpty then
  begin
    MessageDlg('J'#225' existe um aluno cadastrado com este RA.', mtWarning, [mbOK], 0);
    AbrirConsulta;
    Exit;
  end;

  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('INSERT INTO Aluno (RA, Nome, Curso, Endereco)');
  ADOQuery1.SQL.Add('VALUES (:RA, :Nome, :Curso, :Endereco)');
  ADOQuery1.Parameters.ParamByName('RA').Value := Trim(edtRA.Text);
  ADOQuery1.Parameters.ParamByName('Nome').Value := Trim(edtNome.Text);
  ADOQuery1.Parameters.ParamByName('Curso').Value := cmbCurso.Text;
  ADOQuery1.Parameters.ParamByName('Endereco').Value := Trim(edtEndereco.Text);
  ADOQuery1.ExecSQL;

  AbrirConsulta;
  Result := True;
end;

procedure TfrmCadastroAluno.ExcluirRegistro;
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('DELETE FROM Aluno WHERE RA = :RA');
  ADOQuery1.Parameters.ParamByName('RA').Value := Trim(edtRA.Text);
  ADOQuery1.ExecSQL;
  AbrirConsulta;
end;

procedure TfrmCadastroAluno.CarregarCampos;
begin
  edtRA.Text := ADOQuery1.FieldByName('RA').AsString;
  edtNome.Text := ADOQuery1.FieldByName('Nome').AsString;
  cmbCurso.ItemIndex := cmbCurso.Items.IndexOf(ADOQuery1.FieldByName('Curso').AsString);
  edtEndereco.Text := ADOQuery1.FieldByName('Endereco').AsString;
end;

end.

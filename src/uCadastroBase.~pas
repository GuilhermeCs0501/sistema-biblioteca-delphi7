unit uCadastroBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, ADOdb;

type
  TfrmCadastroBase = class(TForm)
    lblTitulo: TLabel;
    pnlCampos: TPanel;
    pnlBotoes: TPanel;
    btnNovo: TButton;
    btnGravar: TButton;
    btnCancelar: TButton;
    btnExcluir: TButton;
    dbgDados: TDBGrid;
    dsDados: TDataSource;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure dbgDadosDblClick(Sender: TObject);
  private
    FRegistroSelecionado: Boolean;
  protected
    function GetTitulo: string; virtual;
    function SQLConsulta: string; virtual;
    procedure LimparCampos; virtual;
    procedure HabilitarCampos(AHabilitar: Boolean); virtual;
    procedure FocarPrimeiroCampo; virtual;
    procedure AtualizarBotoes(ANovo, AGravar, ACancelar, AExcluir: Boolean); virtual;
    procedure ConfigurarColunas; virtual;
    procedure AbrirConsulta;
    function ValidarCampos: Boolean; virtual;
    function IncluirRegistro: Boolean; virtual;
    procedure ExcluirRegistro; virtual;
    procedure CarregarCampos; virtual;
    function DatasetAtivo: Boolean;
  public
    { Public declarations }
  end;

var
  frmCadastroBase: TfrmCadastroBase;

implementation

{$R *.dfm}

function TfrmCadastroBase.GetTitulo: string;
begin
  Result := 'Cadastro';
end;

function TfrmCadastroBase.SQLConsulta: string;
begin
  Result := '';
end;

procedure TfrmCadastroBase.LimparCampos;
begin
  {  formularios filhos }
end;

procedure TfrmCadastroBase.HabilitarCampos(AHabilitar: Boolean);
begin
  { formularios filhos }
end;

procedure TfrmCadastroBase.FocarPrimeiroCampo;
begin
  {  formularios filhos }
end;

procedure TfrmCadastroBase.AtualizarBotoes(ANovo, AGravar, ACancelar, AExcluir: Boolean);
begin
  btnNovo.Enabled := ANovo;
  btnGravar.Enabled := AGravar;
  btnCancelar.Enabled := ACancelar;
  btnExcluir.Enabled := AExcluir;
end;

procedure TfrmCadastroBase.ConfigurarColunas;
begin
  { formularios filhos }
end;

procedure TfrmCadastroBase.AbrirConsulta;
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add(SQLConsulta);
  ADOQuery1.Open;
end;

function TfrmCadastroBase.ValidarCampos: Boolean;
begin
  Result := True;
end;

function TfrmCadastroBase.IncluirRegistro: Boolean;
begin
  Result := True;
end;

procedure TfrmCadastroBase.ExcluirRegistro;
begin
  { formularios filhos }
end;

procedure TfrmCadastroBase.CarregarCampos;
begin
  { formularios filhos }
end;

function TfrmCadastroBase.DatasetAtivo: Boolean;
begin
  Result := Assigned(dsDados.DataSet) and dsDados.DataSet.Active and
    not dsDados.DataSet.IsEmpty;
end;

procedure TfrmCadastroBase.FormCreate(Sender: TObject);
begin
  Caption := GetTitulo;
  lblTitulo.Caption := GetTitulo;
  FRegistroSelecionado := False;
  dbgDados.ShowHint := True;
  dbgDados.Hint := 'Duplo clique no registro para carregar e excluir';
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add(SQLConsulta);
end;

procedure TfrmCadastroBase.FormShow(Sender: TObject);
begin
  HabilitarCampos(False);
  LimparCampos;
  AtualizarBotoes(True, False, False, False);
end;

procedure TfrmCadastroBase.FormActivate(Sender: TObject);
begin
  ADOConnection1.Connected := True;
  ADOQuery1.Active := True;
  ConfigurarColunas;
end;

procedure TfrmCadastroBase.btnNovoClick(Sender: TObject);
begin
  FRegistroSelecionado := False;
  LimparCampos;
  HabilitarCampos(True);
  AtualizarBotoes(False, True, True, False);
  FocarPrimeiroCampo;
end;

procedure TfrmCadastroBase.btnGravarClick(Sender: TObject);
begin
  if not ValidarCampos then
  begin
    MessageDlg('Preencha todos os campos antes de gravar.', mtWarning, [mbOK], 0);
    Exit;
  end;

  if MessageDlg('Confirma a inclus'#227'o do registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if IncluirRegistro then
    begin
      LimparCampos;
      HabilitarCampos(False);
      FRegistroSelecionado := False;
      AtualizarBotoes(True, False, False, False);
      MessageDlg('Registro gravado com sucesso.', mtInformation, [mbOK], 0);
    end;
  end;
end;

procedure TfrmCadastroBase.btnCancelarClick(Sender: TObject);
begin
  LimparCampos;
  HabilitarCampos(False);
  FRegistroSelecionado := False;
  AtualizarBotoes(True, False, False, False);
end;

procedure TfrmCadastroBase.btnExcluirClick(Sender: TObject);
begin
  if not FRegistroSelecionado then
  begin
    MessageDlg('Selecione um registro com duplo clique na grade para excluir.',
      mtWarning, [mbOK], 0);
    Exit;
  end;

  if MessageDlg('Confirma a exclus'#227'o do registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ExcluirRegistro;
    LimparCampos;
    HabilitarCampos(False);
    FRegistroSelecionado := False;
    AtualizarBotoes(True, False, False, False);
    MessageDlg('Registro exclu'#237'do com sucesso.', mtInformation, [mbOK], 0);
  end;
end;

procedure TfrmCadastroBase.dbgDadosDblClick(Sender: TObject);
begin
  if not DatasetAtivo then
    Exit;

  CarregarCampos;
  HabilitarCampos(False);
  FRegistroSelecionado := True;
  AtualizarBotoes(True, False, True, True);
end;

end.

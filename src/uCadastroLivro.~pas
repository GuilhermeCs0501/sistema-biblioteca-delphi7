unit uCadastroLivro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroBase, StdCtrls, ExtCtrls, Grids, DBGrids, DB, Mask, ADOdb;

type
  TfrmCadastroLivro = class(TfrmCadastroBase)
    lblISBN: TLabel;
    edtISBN: TEdit;
    lblTituloLivro: TLabel;
    edtTitulo: TEdit;
    lblGenero: TLabel;
    cmbGenero: TComboBox;
    lblAutor: TLabel;
    edtAutor: TEdit;
    lblPaginas: TLabel;
    medPaginas: TMaskEdit;
    rgbIdioma: TRadioGroup;
    procedure edtISBNKeyPress(Sender: TObject; var Key: Char);
  private
    function DigitosMask(const S: string): string;
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
  frmCadastroLivro: TfrmCadastroLivro;

implementation

{$R *.dfm}

function TfrmCadastroLivro.GetTitulo: string;
begin
  Result := 'Cadastro de Livro';
end;

function TfrmCadastroLivro.SQLConsulta: string;
begin
  Result := 'SELECT ISBN, Titulo, Genero, Autor, Paginas, Idioma FROM Livro';
end;

procedure TfrmCadastroLivro.ConfigurarColunas;
begin
  if dbgDados.Columns.Count < 6 then
    Exit;
  dbgDados.Columns[0].Title.Caption := 'ISBN';
  dbgDados.Columns[0].Width := 90;
  dbgDados.Columns[1].Title.Caption := 'T'#237'tulo';
  dbgDados.Columns[1].Width := 200;
  dbgDados.Columns[2].Title.Caption := 'G'#234'nero';
  dbgDados.Columns[2].Width := 90;
  dbgDados.Columns[3].Title.Caption := 'Autor';
  dbgDados.Columns[3].Width := 140;
  dbgDados.Columns[4].Title.Caption := 'P'#225'ginas';
  dbgDados.Columns[4].Width := 70;
  dbgDados.Columns[5].Title.Caption := 'Idioma';
  dbgDados.Columns[5].Width := 90;
end;

function TfrmCadastroLivro.DigitosMask(const S: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
    if S[I] in ['0'..'9'] then
      Result := Result + S[I];
end;

procedure TfrmCadastroLivro.edtISBNKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', 'A'..'Z', 'a'..'z', #8]) then
    Key := #0;
end;

procedure TfrmCadastroLivro.LimparCampos;
begin
  edtISBN.Clear;
  edtTitulo.Clear;
  cmbGenero.ItemIndex := -1;
  edtAutor.Clear;
  medPaginas.Clear;
  rgbIdioma.ItemIndex := -1;
end;

procedure TfrmCadastroLivro.HabilitarCampos(AHabilitar: Boolean);
begin
  edtISBN.Enabled := AHabilitar;
  edtTitulo.Enabled := AHabilitar;
  cmbGenero.Enabled := AHabilitar;
  edtAutor.Enabled := AHabilitar;
  medPaginas.Enabled := AHabilitar;
  rgbIdioma.Enabled := AHabilitar;
end;

procedure TfrmCadastroLivro.FocarPrimeiroCampo;
begin
  if edtISBN.CanFocus then
    edtISBN.SetFocus;
end;

function TfrmCadastroLivro.ValidarCampos: Boolean;
begin
  Result :=
    (Trim(edtISBN.Text) <> '') and
    (Trim(edtTitulo.Text) <> '') and
    (cmbGenero.ItemIndex >= 0) and
    (Trim(edtAutor.Text) <> '') and
    (DigitosMask(medPaginas.Text) <> '') and
    (rgbIdioma.ItemIndex >= 0);
end;

function TfrmCadastroLivro.IncluirRegistro: Boolean;
begin
  Result := False;

  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT ISBN FROM Livro WHERE ISBN = :ISBN');
  ADOQuery1.Parameters.ParamByName('ISBN').Value := Trim(edtISBN.Text);
  ADOQuery1.Open;
  if not ADOQuery1.IsEmpty then
  begin
    MessageDlg('J'#225' existe um livro cadastrado com este ISBN.', mtWarning, [mbOK], 0);
    AbrirConsulta;
    Exit;
  end;

  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('INSERT INTO Livro (ISBN, Titulo, Genero, Autor, Paginas, Idioma)');
  ADOQuery1.SQL.Add('VALUES (:ISBN, :Titulo, :Genero, :Autor, :Paginas, :Idioma)');
  ADOQuery1.Parameters.ParamByName('ISBN').Value := Trim(edtISBN.Text);
  ADOQuery1.Parameters.ParamByName('Titulo').Value := Trim(edtTitulo.Text);
  ADOQuery1.Parameters.ParamByName('Genero').Value := cmbGenero.Text;
  ADOQuery1.Parameters.ParamByName('Autor').Value := Trim(edtAutor.Text);
  ADOQuery1.Parameters.ParamByName('Paginas').Value := StrToInt(DigitosMask(medPaginas.Text));
  ADOQuery1.Parameters.ParamByName('Idioma').Value := rgbIdioma.Items[rgbIdioma.ItemIndex];
  ADOQuery1.ExecSQL;

  AbrirConsulta;
  Result := True;
end;

procedure TfrmCadastroLivro.ExcluirRegistro;
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('DELETE FROM Livro WHERE ISBN = :ISBN');
  ADOQuery1.Parameters.ParamByName('ISBN').Value := Trim(edtISBN.Text);
  ADOQuery1.ExecSQL;
  AbrirConsulta;
end;

procedure TfrmCadastroLivro.CarregarCampos;
begin
  edtISBN.Text := ADOQuery1.FieldByName('ISBN').AsString;
  edtTitulo.Text := ADOQuery1.FieldByName('Titulo').AsString;
  cmbGenero.ItemIndex := cmbGenero.Items.IndexOf(ADOQuery1.FieldByName('Genero').AsString);
  edtAutor.Text := ADOQuery1.FieldByName('Autor').AsString;
  medPaginas.Text := ADOQuery1.FieldByName('Paginas').AsString;
  rgbIdioma.ItemIndex := rgbIdioma.Items.IndexOf(ADOQuery1.FieldByName('Idioma').AsString);
end;

end.

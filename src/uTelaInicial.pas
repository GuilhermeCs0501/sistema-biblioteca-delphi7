unit uTelaInicial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmMenu = class(TForm)
    pnlFundo: TPanel;
    lblTitulo: TLabel;
    btnCadLivros: TButton;
    btnCadAlunos: TButton;
    btnSair: TButton;
    procedure btnCadLivrosClick(Sender: TObject);
    procedure btnCadAlunosClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  frmMenu: TfrmMenu;

implementation

uses
  uCadastroLivro,
  uCadastroAluno;

{$R *.dfm}

procedure TfrmMenu.btnCadLivrosClick(Sender: TObject);
var
  frm: TfrmCadastroLivro;
begin
  frm := TfrmCadastroLivro.Create(Self);
  try
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;

procedure TfrmMenu.btnCadAlunosClick(Sender: TObject);
var
  frm: TfrmCadastroAluno;
begin
  frm := TfrmCadastroAluno.Create(Self);
  try
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;

procedure TfrmMenu.btnSairClick(Sender: TObject);
begin
  Close;
end;


begin

end.

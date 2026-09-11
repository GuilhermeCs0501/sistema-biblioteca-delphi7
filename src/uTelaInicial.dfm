object frmMenu: TfrmMenu
  Left = 489
  Top = 261
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Menu Principal'
  ClientHeight = 549
  ClientWidth = 731
  Color = clBlack
  Font.Charset = ANSI_CHARSET
  Font.Color = clWhite
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object pnlFundo: TPanel
    Left = 46
    Top = 37
    Width = 640
    Height = 475
    BevelOuter = bvNone
    Color = 2105376
    TabOrder = 0
    object lblTitulo: TLabel
      Left = 37
      Top = 97
      Width = 566
      Height = 50
      Alignment = taCenter
      AutoSize = False
      Caption = 'Biblioteca'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -48
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnCadLivros: TButton
      Left = 3
      Top = 224
      Width = 310
      Height = 42
      Caption = 'Cadastro de Livros'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnCadLivrosClick
    end
    object btnCadAlunos: TButton
      Left = 320
      Top = 224
      Width = 310
      Height = 42
      Caption = 'Cadastro de Alunos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnCadAlunosClick
    end
    object btnSair: TButton
      Left = 528
      Top = 432
      Width = 113
      Height = 37
      Caption = 'Sair'
      Font.Charset = ANSI_CHARSET
      Font.Color = clSilver
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnSairClick
    end
  end
end

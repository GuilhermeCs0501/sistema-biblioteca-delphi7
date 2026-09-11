object frmCadastroBase: TfrmCadastroBase
  Left = 741
  Top = 174
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro'
  ClientHeight = 709
  ClientWidth = 1029
  Color = clBlack
  Font.Charset = ANSI_CHARSET
  Font.Color = clWhite
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object lblTitulo: TLabel
    Left = 0
    Top = 0
    Width = 1029
    Height = 55
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = 'Cadastro'
    Color = 3158064
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -23
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    Layout = tlCenter
  end
  object pnlCampos: TPanel
    Left = 0
    Top = 364
    Width = 1029
    Height = 272
    Align = alBottom
    BevelOuter = bvNone
    Color = 2105376
    TabOrder = 0
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 636
    Width = 1029
    Height = 73
    Align = alBottom
    BevelOuter = bvNone
    Color = 2105376
    TabOrder = 1
    object btnNovo: TButton
      Left = 27
      Top = 17
      Width = 195
      Height = 41
      Caption = 'Novo Cadastro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnGravar: TButton
      Left = 245
      Top = 17
      Width = 160
      Height = 41
      Caption = 'Gravar'
      Font.Charset = ANSI_CHARSET
      Font.Color = 6511414
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnGravarClick
    end
    object btnCancelar: TButton
      Left = 427
      Top = 17
      Width = 160
      Height = 41
      Caption = 'Cancelar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clSilver
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnCancelarClick
    end
    object btnExcluir: TButton
      Left = 610
      Top = 17
      Width = 160
      Height = 41
      Caption = 'Excluir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnExcluirClick
    end
  end
  object dbgDados: TDBGrid
    Left = 0
    Top = 55
    Width = 1029
    Height = 309
    Align = alClient
    Color = 3158064
    DataSource = dsDados
    FixedColor = 6511414
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    OnDblClick = dbgDadosDblClick
  end
  object dsDados: TDataSource
    DataSet = ADOQuery1
    Left = 888
    Top = 328
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=FAI'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 928
    Top = 328
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 968
    Top = 328
  end
end

inherited FrmEstoqueHistPro: TFrmEstoqueHistPro
  Caption = 'FrmEstoqueHistPro'
  ClientHeight = 548
  ClientWidth = 613
  ExplicitWidth = 619
  ExplicitHeight = 577
  PixelsPerInch = 96
  TextHeight = 13
  inherited PTopo: TPanel
    Width = 613
    ExplicitWidth = 613
    inherited LCad: TLabel
      Width = 607
      Height = 30
    end
  end
  inherited ToolBar1: TToolBar
    Top = 510
    Width = 613
    ExplicitTop = 510
    ExplicitWidth = 613
  end
  inherited Grid: TDBGrid
    Top = 152
    Width = 613
    Height = 358
    Columns = <
      item
        Expanded = False
        FieldName = 'Mov_Data'
        Title.Caption = 'Data'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Mov_Sequencia'
        Title.Alignment = taRightJustify
        Title.Caption = 'Sequencia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Mov_SaldoAnterior'
        Title.Alignment = taRightJustify
        Title.Caption = 'Saldo Anterior'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Mov_TipoDeMovimento'
        Title.Caption = 'Tipo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Mov_Quantidade'
        Title.Alignment = taRightJustify
        Title.Caption = 'Quantidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Mov_SaldoAtual'
        Title.Alignment = taRightJustify
        Title.Caption = 'Saldo Atual'
        Visible = True
      end>
  end
  inherited PTop: TPanel
    Width = 613
    Height = 116
    ExplicitWidth = 613
    ExplicitHeight = 116
    inherited Label1: TLabel
      Left = 7
      Top = 84
      ExplicitLeft = 7
      ExplicitTop = 84
    end
    object Label2: TLabel [1]
      Left = 25
      Top = 14
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Produto'
    end
    object Label4: TLabel [2]
      Left = 14
      Top = 40
      Width = 49
      Height = 13
      Caption = 'Data incial'
    end
    object Label5: TLabel [3]
      Left = 179
      Top = 40
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    inherited EPesquisa: TEdit
      Top = 84
      TabOrder = 7
      ExplicitTop = 84
    end
    inherited PColuna: TPanel
      Top = 84
      TabOrder = 6
      ExplicitTop = 84
    end
    inherited Separador1: TRichEdit
      Width = 613
      TabOrder = 0
      ExplicitWidth = 613
    end
    object RichEdit1: TRichEdit
      Left = -1
      Top = 75
      Width = 903
      Height = 1
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'Separador1')
      ParentFont = False
      TabOrder = 5
      Zoom = 100
    end
    object EPro: TEdit
      Left = 67
      Top = 14
      Width = 68
      Height = 21
      TabOrder = 1
      OnChange = EProChange
      OnExit = EProExit
    end
    object CPro: TView
      Left = 137
      Top = 14
      Width = 293
      Height = 21
      Margins.Right = 10
      OnActive = CProActive
      Connection = D.FDCon
      ShowCaption = True
      Associate = EPro
      Color = clWindow
    end
    object Processar: TBitBtn
      Left = 345
      Top = 40
      Width = 85
      Height = 22
      Caption = '&Processar'
      TabOrder = 4
      OnClick = ProcessarClick
    end
    object EDatIni: TMaskEdit
      Left = 67
      Top = 40
      Width = 63
      Height = 21
      AutoSize = False
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '  /  /    '
      OnChange = EProChange
      OnExit = EDatIniExit
    end
    object EDatFim: TMaskEdit
      Left = 231
      Top = 40
      Width = 65
      Height = 21
      DoubleBuffered = False
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      ParentDoubleBuffered = False
      TabOrder = 3
      Text = '  /  /    '
      OnChange = EProChange
      OnExit = EDatFimExit
    end
  end
  inherited DS: TDataSource
    AutoEdit = False
    Enabled = False
    Left = 11
    Top = 3
  end
  inherited PM: TPopupMenu
    Left = 69
    Top = 3
  end
  inherited Query: TFDQuery
    SQL.Strings = (
      'select * from movimento'
      'order by mov_data,mov_sequencia')
    Left = 40
    Top = 3
    object QueryMov_Produto: TIntegerField
      FieldName = 'Mov_Produto'
      Origin = 'Mov_Produto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryMov_Data: TDateField
      FieldName = 'Mov_Data'
      Origin = 'Mov_Data'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryMov_Sequencia: TIntegerField
      FieldName = 'Mov_Sequencia'
      Origin = 'Mov_Sequencia'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryMov_TipoDeMovimento: TStringField
      FieldName = 'Mov_TipoDeMovimento'
      Origin = 'Mov_TipoDeMovimento'
      Size = 11
    end
    object QueryMov_SaldoAnterior: TBCDField
      FieldName = 'Mov_SaldoAnterior'
      Origin = 'Mov_SaldoAnterior'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 14
      Size = 2
    end
    object QueryMov_SaldoAtual: TBCDField
      FieldName = 'Mov_SaldoAtual'
      Origin = 'Mov_SaldoAtual'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 14
      Size = 2
    end
    object QueryMov_Quantidade: TBCDField
      FieldName = 'Mov_Quantidade'
      Origin = 'Mov_Quantidade'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 14
      Size = 2
    end
  end
end

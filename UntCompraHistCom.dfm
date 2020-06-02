inherited FrmCompraHistCom: TFrmCompraHistCom
  Caption = 'FrmCompraHistCom'
  ClientHeight = 548
  ClientWidth = 861
  ExplicitWidth = 867
  ExplicitHeight = 577
  PixelsPerInch = 96
  TextHeight = 13
  inherited PTopo: TPanel
    Width = 861
    ExplicitWidth = 861
    inherited LCad: TLabel
      Width = 855
    end
  end
  inherited ToolBar1: TToolBar
    Top = 510
    Width = 861
    ExplicitTop = 510
    ExplicitWidth = 861
  end
  inherited Grid: TDBGrid
    Top = 152
    Width = 861
    Height = 358
    OnDrawColumnCell = GridDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Pec_Codigo'
        Title.Alignment = taRightJustify
        Title.Caption = 'Pedido'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pec_Data'
        Title.Caption = 'Data'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pec_Baixa'
        Title.Caption = 'Baixa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pes_Nome'
        Title.Caption = 'Fornecedor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pec_ValorProduto'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor Produto'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pec_ValorDesconto'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor Desconto'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pec_ValorTotal'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor Total'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Situacao'
        Title.Caption = 'Situa'#231#227'o'
        Width = 45
        Visible = True
      end>
  end
  inherited PTop: TPanel
    Width = 861
    Height = 116
    ExplicitWidth = 861
    ExplicitHeight = 116
    inherited Label1: TLabel
      Left = 7
      Top = 84
      ExplicitLeft = 7
      ExplicitTop = 84
    end
    object Label2: TLabel [1]
      Left = 10
      Top = 14
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Comprador'
    end
    object Label3: TLabel [2]
      Left = 22
      Top = 40
      Width = 41
      Height = 13
      Caption = 'Situa'#231#227'o'
    end
    object Label4: TLabel [3]
      Left = 295
      Top = 41
      Width = 49
      Height = 13
      Caption = 'Data incial'
    end
    object Label5: TLabel [4]
      Left = 421
      Top = 41
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object Label6: TLabel [5]
      Left = 144
      Top = 41
      Width = 77
      Height = 13
      Caption = 'Considerar data'
    end
    inherited EPesquisa: TEdit
      Top = 84
      TabOrder = 9
      ExplicitTop = 84
    end
    inherited PColuna: TPanel
      Top = 84
      TabOrder = 8
      ExplicitTop = 84
    end
    inherited Separador1: TRichEdit
      Width = 861
      TabOrder = 0
      ExplicitWidth = 861
    end
    object PLegenda: TPanel
      Left = 697
      Top = 82
      Width = 164
      Height = 31
      BevelOuter = bvNone
      TabOrder = 11
      object Panel1: TPanel
        Left = 0
        Top = 2
        Width = 80
        Height = 25
        BevelKind = bkFlat
        BevelOuter = bvNone
        Caption = 'Pendente'
        Color = clMoneyGreen
        ParentBackground = False
        TabOrder = 0
      end
      object Panel2: TPanel
        Left = 81
        Top = 2
        Width = 80
        Height = 25
        BevelKind = bkFlat
        BevelOuter = bvNone
        Caption = 'Baixado'
        Color = clActiveCaption
        ParentBackground = False
        TabOrder = 1
      end
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
      TabOrder = 7
      Zoom = 100
    end
    object ECom: TEdit
      Left = 67
      Top = 14
      Width = 68
      Height = 21
      TabOrder = 1
      OnChange = EComChange
      OnExit = EComExit
    end
    object CCom: TView
      Left = 137
      Top = 14
      Width = 496
      Height = 21
      Margins.Right = 10
      OnActive = CComActive
      Connection = D.FDCon
      ShowCaption = True
      Associate = ECom
      Color = clWindow
    end
    object Processar: TBitBtn
      Left = 548
      Top = 40
      Width = 85
      Height = 22
      Caption = '&Processar'
      TabOrder = 6
      OnClick = ProcessarClick
    end
    object ESituacao: TComboBox
      Left = 67
      Top = 41
      Width = 74
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 2
      Text = 'Todos'
      OnChange = EComChange
      Items.Strings = (
        'Todos'
        'Pendente'
        'Baixado')
    end
    object EDatIni: TMaskEdit
      Left = 350
      Top = 41
      Width = 63
      Height = 21
      AutoSize = False
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 4
      Text = '  /  /    '
      OnChange = EComChange
      OnExit = EDatIniExit
    end
    object EDatFim: TMaskEdit
      Left = 473
      Top = 41
      Width = 65
      Height = 21
      DoubleBuffered = False
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      ParentDoubleBuffered = False
      TabOrder = 5
      Text = '  /  /    '
      OnChange = EComChange
      OnExit = EDatFimExit
    end
    object EConsiderar: TComboBox
      Left = 224
      Top = 41
      Width = 61
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 3
      Text = 'Pedido'
      OnChange = EComChange
      Items.Strings = (
        'Pedido'
        'Baixa')
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
      'select * from pedidocompra '
      'order by pec_codigo')
    Left = 40
    Top = 3
    object QuerySituacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'Situacao'
      Size = 10
      Calculated = True
    end
    object QueryPes_Nome: TStringField
      FieldKind = fkLookup
      FieldName = 'Pes_Nome'
      LookupDataSet = TPes
      LookupKeyFields = 'Pes_Codigo'
      LookupResultField = 'Pes_Nome'
      KeyFields = 'Pec_Fornecedor'
      Size = 50
      Lookup = True
    end
    object QueryPec_Codigo: TFDAutoIncField
      FieldName = 'Pec_Codigo'
      Origin = 'Pec_Codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QueryPec_Data: TDateField
      FieldName = 'Pec_Data'
      Origin = 'Pec_Data'
      Required = True
      DisplayFormat = 'DD/MM/YYYY'
      EditMask = 'DD/MM/YYYY'
    end
    object QueryPec_Baixa: TDateField
      FieldName = 'Pec_Baixa'
      Origin = 'Pec_Baixa'
      DisplayFormat = 'DD/MM/YYYY'
      EditMask = 'DD/MM/YYYY'
    end
    object QueryPec_Fornecedor: TIntegerField
      FieldName = 'Pec_Fornecedor'
      Origin = 'Pec_Fornecedor'
      Required = True
    end
    object QueryPec_Comprador: TIntegerField
      FieldName = 'Pec_Comprador'
      Origin = 'Pec_Comprador'
    end
    object QueryPec_Status: TStringField
      FieldName = 'Pec_Status'
      Origin = 'Pec_Status'
      FixedChar = True
      Size = 1
    end
    object QueryPec_ValorTotal: TBCDField
      FieldName = 'Pec_ValorTotal'
      Origin = 'Pec_ValorTotal'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 14
      Size = 2
    end
    object QueryPec_ValorProduto: TBCDField
      FieldName = 'Pec_ValorProduto'
      Origin = 'Pec_ValorProduto'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 14
      Size = 2
    end
    object QueryPec_ValorDesconto: TBCDField
      FieldName = 'Pec_ValorDesconto'
      Origin = 'Pec_ValorDesconto'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 14
      Size = 2
    end
  end
  object TPes: TFDTable
    IndexFieldNames = 'Pes_Codigo'
    Connection = D.FDCon
    UpdateOptions.UpdateTableName = 'VS12019.dbo.Pessoa'
    TableName = 'VS12019.dbo.Pessoa'
    Left = 98
    Top = 3
    object TPesPes_Codigo: TFDAutoIncField
      FieldName = 'Pes_Codigo'
      Origin = 'Pes_Codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object TPesPes_Nome: TStringField
      FieldName = 'Pes_Nome'
      Origin = 'Pes_Nome'
      Size = 50
    end
    object TPesPes_RazaoSocial: TStringField
      FieldName = 'Pes_RazaoSocial'
      Origin = 'Pes_RazaoSocial'
      Size = 50
    end
  end
end

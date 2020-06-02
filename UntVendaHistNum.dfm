inherited FrmVendaHistNum: TFrmVendaHistNum
  Caption = 'FrmVendaHistNum'
  ClientHeight = 538
  ClientWidth = 1161
  ExplicitWidth = 1167
  ExplicitHeight = 567
  PixelsPerInch = 96
  TextHeight = 13
  inherited PTopo: TPanel
    Width = 1161
    ExplicitWidth = 1161
    inherited LCad: TLabel
      Width = 1155
      Height = 30
    end
  end
  inherited ToolBar1: TToolBar
    Top = 500
    Width = 1161
    ExplicitTop = 500
    ExplicitWidth = 1161
  end
  inherited Grid: TDBGrid
    Width = 1161
    Height = 430
    OnDrawColumnCell = GridDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Pev_Codigo'
        Title.Alignment = taRightJustify
        Title.Caption = 'Pedido'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pev_Data'
        Title.Caption = 'Data'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pev_Baixa'
        Title.Caption = 'Baixa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pes_Nome'
        Title.Caption = 'Cliente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pev_VendedorNome'
        Title.Caption = 'Vendedor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pev_ValorProduto'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor Produto'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pev_ValorDesconto'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor Desconto'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pev_ValorTotal'
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
    Width = 1161
    ExplicitWidth = 1161
    inherited Label1: TLabel
      Left = 7
      ExplicitLeft = 7
    end
    inherited Separador1: TRichEdit
      Width = 1161
      ExplicitWidth = 1161
    end
    object PLegenda: TPanel
      Left = 992
      Top = 1
      Width = 169
      Height = 33
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 3
      object Panel1: TPanel
        Left = 3
        Top = 4
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
        Left = 84
        Top = 4
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
  end
  inherited DS: TDataSource
    Left = 11
    Top = 3
  end
  inherited PM: TPopupMenu
    Left = 69
    Top = 3
  end
  inherited Query: TFDQuery
    SQL.Strings = (
      'select * from pedidovenda '
      'order by pev_codigo')
    Left = 40
    Top = 3
    object QueryPev_Codigo: TFDAutoIncField
      FieldName = 'Pev_Codigo'
      Origin = 'Pev_Codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QueryPev_Data: TDateField
      FieldName = 'Pev_Data'
      Origin = 'Pev_Data'
      Required = True
      DisplayFormat = 'DD/MM/YYYY'
      EditMask = 'DD/MM/YYYY'
    end
    object QueryPev_Baixa: TDateField
      FieldName = 'Pev_Baixa'
      Origin = 'Pev_Baixa'
      DisplayFormat = 'DD/MM/YYYY'
      EditMask = 'DD/MM/YYYY'
    end
    object QueryPev_Cliente: TIntegerField
      FieldName = 'Pev_Cliente'
      Origin = 'Pev_Cliente'
      Required = True
    end
    object QueryPev_Vendedor: TIntegerField
      FieldName = 'Pev_Vendedor'
      Origin = 'Pev_Vendedor'
    end
    object QueryPev_Status: TStringField
      FieldName = 'Pev_Status'
      Origin = 'Pev_Status'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QueryPev_ValorTotal: TBCDField
      FieldName = 'Pev_ValorTotal'
      Origin = 'Pev_ValorTotal'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 14
      Size = 2
    end
    object QueryPev_ValorProduto: TBCDField
      FieldName = 'Pev_ValorProduto'
      Origin = 'Pev_ValorProduto'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 14
      Size = 2
    end
    object QueryPev_ValorDesconto: TBCDField
      FieldName = 'Pev_ValorDesconto'
      Origin = 'Pev_ValorDesconto'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 14
      Size = 2
    end
    object QuerySituacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'Situacao'
      Size = 10
      Calculated = True
    end
    object e: TStringField
      FieldKind = fkLookup
      FieldName = 'Pes_Nome'
      LookupDataSet = TPes
      LookupKeyFields = 'Pes_Codigo'
      LookupResultField = 'Pes_Nome'
      KeyFields = 'Pev_Cliente'
      Size = 50
      Lookup = True
    end
    object QueryPev_VendedorNome: TStringField
      FieldKind = fkLookup
      FieldName = 'Pev_VendedorNome'
      LookupDataSet = TPes
      LookupKeyFields = 'Pes_Codigo'
      LookupResultField = 'Pes_Nome'
      KeyFields = 'Pev_Vendedor'
      Size = 50
      Lookup = True
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

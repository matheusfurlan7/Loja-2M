inherited FrmCompraHistNum: TFrmCompraHistNum
  Caption = 'FrmCompraHistNum'
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
        FieldName = 'Pec_CompradorNome'
        Title.Caption = 'Comrpador'
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
      'select * from pedidocompra'
      'order by pec_codigo')
    Left = 40
    Top = 3
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
      KeyFields = 'Pec_Fornecedor'
      Size = 50
      Lookup = True
    end
    object QueryPev_VendedorNome: TStringField
      FieldKind = fkLookup
      FieldName = 'Pec_CompradorNome'
      LookupDataSet = TPes
      LookupKeyFields = 'Pes_Codigo'
      LookupResultField = 'Pes_Nome'
      KeyFields = 'Pec_Comprador'
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

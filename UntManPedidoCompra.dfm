inherited FrmManPedidoCompra: TFrmManPedidoCompra
  Caption = 'FrmManPedidoCompra'
  ClientHeight = 548
  ClientWidth = 608
  ExplicitWidth = 614
  ExplicitHeight = 577
  PixelsPerInch = 96
  TextHeight = 13
  inherited PTopo: TPanel
    Width = 608
    ExplicitWidth = 608
    inherited LCad: TLabel
      Width = 602
      Height = 30
    end
  end
  inherited ToolBar1: TToolBar
    Top = 510
    Width = 608
    ExplicitTop = 510
    ExplicitWidth = 608
  end
  inherited Grid: TDBGrid
    Width = 608
    Height = 440
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
        FieldName = 'Pec_NomeFornecedor'
        Title.Caption = 'Fornecedor'
        Width = 323
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pec_ValorTotal'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor Total'
        Visible = True
      end>
  end
  inherited PTop: TPanel
    Width = 608
    ParentCustomHint = False
    ParentBiDiMode = False
    ExplicitWidth = 608
    inherited Label1: TLabel
      Left = 10
      ExplicitLeft = 10
    end
    inherited EPesquisa: TEdit
      Width = 373
      ExplicitWidth = 373
    end
    inherited PColuna: TPanel
      Left = 59
      Width = 148
      ExplicitLeft = 59
      ExplicitWidth = 148
    end
    inherited Separador1: TRichEdit
      Width = 608
      ExplicitWidth = 608
    end
  end
  inherited DS: TDataSource
    Left = 506
    Top = 7
  end
  inherited FDT: TFDTable
    Filtered = True
    Filter = 'Pec_Status = '#39'P'#39
    IndexFieldNames = 'Pec_Codigo'
    UpdateOptions.UpdateTableName = 'PedidoCompra'
    TableName = 'PedidoCompra'
    Left = 536
    Top = 7
    object FDTPec_Codigo: TFDAutoIncField
      FieldName = 'Pec_Codigo'
      Origin = 'Pec_Codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDTPec_Data: TDateField
      FieldName = 'Pec_Data'
      Origin = 'Pec_Data'
      Required = True
      DisplayFormat = 'DD/MM/YYYY'
      EditMask = 'DD/MM/YYYY'
    end
    object FDTPec_Baixa: TDateField
      FieldName = 'Pec_Baixa'
      Origin = 'Pec_Baixa'
      DisplayFormat = 'DD/MM/YYYY'
      EditMask = 'DD/MM/YYYY'
    end
    object FDTPec_Fornecedor: TIntegerField
      FieldName = 'Pec_Fornecedor'
      Origin = 'Pec_Fornecedor'
      Required = True
    end
    object FDTPec_Comprador: TIntegerField
      FieldName = 'Pec_Comprador'
      Origin = 'Pec_Comprador'
    end
    object FDTPec_Status: TStringField
      FieldName = 'Pec_Status'
      Origin = 'Pec_Status'
      FixedChar = True
      Size = 1
    end
    object FDTPec_ValorTotal: TBCDField
      FieldName = 'Pec_ValorTotal'
      Origin = 'Pec_ValorTotal'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 14
      Size = 2
    end
    object FDTPec_ValorProduto: TBCDField
      FieldName = 'Pec_ValorProduto'
      Origin = 'Pec_ValorProduto'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 14
      Size = 2
    end
    object FDTPec_ValorDesconto: TBCDField
      FieldName = 'Pec_ValorDesconto'
      Origin = 'Pec_ValorDesconto'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 14
      Size = 2
    end
    object FDTPec_NomeComprador: TStringField
      FieldKind = fkLookup
      FieldName = 'Pec_NomeFornecedor'
      LookupDataSet = TPes
      LookupKeyFields = 'Pes_Codigo'
      LookupResultField = 'Pes_Nome'
      KeyFields = 'Pec_Fornecedor'
      Size = 50
      Lookup = True
    end
  end
  inherited PM: TPopupMenu
    Left = 476
    Top = 7
  end
  object TPes: TFDTable
    IndexFieldNames = 'Pes_Codigo'
    Connection = D.FDCon
    UpdateOptions.UpdateTableName = 'VS12019.dbo.Pessoa'
    TableName = 'VS12019.dbo.Pessoa'
    Left = 566
    Top = 6
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

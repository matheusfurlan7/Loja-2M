inherited FrmManPedidoVenda: TFrmManPedidoVenda
  Caption = 'FrmManPedidoVenda'
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
        FieldName = 'Pev_ClienteNome'
        Title.Caption = 'Cliente'
        Width = 323
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pev_ValorTotal'
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
    Filter = 'Pev_Status = '#39'P'#39
    IndexFieldNames = 'Pev_Codigo'
    UpdateOptions.UpdateTableName = 'VS12019.dbo.PedidoVenda'
    TableName = 'VS12019.dbo.PedidoVenda'
    Left = 536
    Top = 7
    object FDTPev_Codigo: TIntegerField
      FieldName = 'Pev_Codigo'
      Origin = 'Pev_Codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDTPev_Data: TDateField
      FieldName = 'Pev_Data'
      Origin = 'Pev_Data'
      Required = True
      DisplayFormat = 'DD/MM/YYYY'
    end
    object FDTPev_Baixa: TDateField
      FieldName = 'Pev_Baixa'
      Origin = 'Pev_Baixa'
      Required = True
    end
    object FDTPev_Cliente: TIntegerField
      FieldName = 'Pev_Cliente'
      Origin = 'Pev_Cliente'
      Required = True
    end
    object FDTPev_Vendedor: TIntegerField
      FieldName = 'Pev_Vendedor'
      Origin = 'Pev_Vendedor'
      Required = True
    end
    object FDTPev_Status: TStringField
      FieldName = 'Pev_Status'
      Origin = 'Pev_Status'
      FixedChar = True
      Size = 1
    end
    object FDTPev_ValorTotal: TBCDField
      FieldName = 'Pev_ValorTotal'
      Origin = 'Pev_ValorTotal'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 14
      Size = 2
    end
    object FDTPev_ValorProduto: TBCDField
      FieldName = 'Pev_ValorProduto'
      Origin = 'Pev_ValorProduto'
      Precision = 14
      Size = 2
    end
    object FDTPev_ValorDesconto: TBCDField
      FieldName = 'Pev_ValorDesconto'
      Origin = 'Pev_ValorDesconto'
      Precision = 14
      Size = 2
    end
    object FDTPev_ClienteNome: TStringField
      FieldKind = fkLookup
      FieldName = 'Pev_ClienteNome'
      LookupDataSet = TPes
      LookupKeyFields = 'Pes_Codigo'
      LookupResultField = 'Pes_Nome'
      KeyFields = 'Pev_Cliente'
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

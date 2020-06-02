inherited FrmEstoquePosicao: TFrmEstoquePosicao
  Caption = 'FrmEstoquePosicao'
  ClientHeight = 548
  ClientWidth = 690
  ExplicitWidth = 696
  ExplicitHeight = 577
  PixelsPerInch = 96
  TextHeight = 13
  inherited PTopo: TPanel
    Width = 690
    ExplicitWidth = 690
    inherited LCad: TLabel
      Width = 684
    end
  end
  inherited ToolBar1: TToolBar
    Top = 510
    Width = 690
    ExplicitTop = 510
    ExplicitWidth = 690
  end
  inherited Grid: TDBGrid
    Width = 690
    Height = 440
    Columns = <
      item
        Expanded = False
        FieldName = 'Pro_Codigo'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#243'digo'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pro_Descricao'
        Title.Caption = 'Descricao'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pro_Unidade'
        Title.Caption = 'Unidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sal_Reserva'
        Title.Alignment = taRightJustify
        Title.Caption = 'Reserva'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sal_Encomenda'
        Title.Alignment = taRightJustify
        Title.Caption = 'Encomenda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sal_Saldo'
        Title.Alignment = taRightJustify
        Title.Caption = 'Saldo'
        Visible = True
      end>
  end
  inherited PTop: TPanel
    Width = 690
    ExplicitWidth = 690
    inherited Separador1: TRichEdit
      Width = 690
      ExplicitWidth = 690
    end
  end
  inherited Query: TFDQuery
    OnCalcFields = QueryCalcFields
    SQL.Strings = (
      
        'select * from produto where pro_controlaestoque = '#39'Sim'#39' and Pro_' +
        'situacao = '#39'Ativo'#39)
    object QueryPro_Codigo: TFDAutoIncField
      FieldName = 'Pro_Codigo'
      Origin = 'Pro_Codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QueryPro_Descricao: TStringField
      FieldName = 'Pro_Descricao'
      Origin = 'Pro_Descricao'
      Required = True
      Size = 50
    end
    object QueryPro_Unidade: TStringField
      FieldName = 'Pro_Unidade'
      Origin = 'Pro_Unidade'
      Required = True
      Size = 5
    end
    object QueryPro_Situacao: TStringField
      FieldName = 'Pro_Situacao'
      Origin = 'Pro_Situacao'
      Required = True
      Size = 7
    end
    object QueryPro_ControlaEstoque: TStringField
      FieldName = 'Pro_ControlaEstoque'
      Origin = 'Pro_ControlaEstoque'
      Required = True
      FixedChar = True
      Size = 3
    end
    object QuerySal_Saldo: TFloatField
      AutoGenerateValue = arDefault
      DefaultExpression = '0'
      FieldKind = fkCalculated
      FieldName = 'Sal_Saldo'
      KeyFields = 'Pro_Codigo'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Calculated = True
    end
    object QuerySal_Reserva: TFloatField
      AutoGenerateValue = arDefault
      DefaultExpression = '0'
      FieldKind = fkCalculated
      FieldName = 'Sal_Reserva'
      KeyFields = 'Pro_Codigo'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Calculated = True
    end
    object QuerySal_Encomenda: TFloatField
      AutoGenerateValue = arDefault
      DefaultExpression = '0'
      FieldKind = fkCalculated
      FieldName = 'Sal_Encomenda'
      KeyFields = 'Pro_Codigo'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Calculated = True
    end
  end
  object TSaldo: TFDTable
    IndexFieldNames = 'Sal_Produto'
    Connection = D.FDCon
    UpdateOptions.UpdateTableName = 'VS12019.dbo.Saldo'
    TableName = 'VS12019.dbo.Saldo'
    Left = 464
    Top = 64
    object TSaldoSal_Produto: TIntegerField
      FieldName = 'Sal_Produto'
      Origin = 'Sal_Produto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TSaldoSal_Reserva: TBCDField
      DefaultExpression = '0'
      FieldName = 'Sal_Reserva'
      Origin = 'Sal_Reserva'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 14
      Size = 2
    end
    object TSaldoSal_Encomenda: TBCDField
      DefaultExpression = '0'
      FieldName = 'Sal_Encomenda'
      Origin = 'Sal_Encomenda'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 14
      Size = 2
    end
    object TSaldoSal_Saldo: TBCDField
      DefaultExpression = '0'
      FieldName = 'Sal_Saldo'
      Origin = 'Sal_Saldo'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 14
      Size = 2
    end
  end
end

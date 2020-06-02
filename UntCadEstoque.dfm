inherited FrmCadEstoque: TFrmCadEstoque
  Caption = 'FrmCadEstoque'
  ClientHeight = 227
  ClientWidth = 529
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 535
  ExplicitHeight = 256
  PixelsPerInch = 96
  TextHeight = 13
  inherited PTopo: TPanel
    Width = 529
    ExplicitWidth = 529
    inherited LCad: TLabel
      Width = 523
      Height = 30
    end
  end
  inherited Pages: TPageControl
    Width = 529
    Height = 154
    ExplicitWidth = 529
    ExplicitHeight = 154
    inherited P1: TTabSheet
      Caption = 'Lan'#231'amento'
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 521
      ExplicitHeight = 126
      inherited PF1: TPanel
        Width = 521
        Height = 126
        ExplicitWidth = 521
        ExplicitHeight = 126
        object Label1: TLabel
          Left = 56
          Top = 8
          Width = 38
          Height = 13
          Caption = 'Produto'
          FocusControl = EMov_Produto
        end
        object Label2: TLabel
          Left = 71
          Top = 34
          Width = 23
          Height = 13
          Caption = 'Data'
          FocusControl = EMov_Data
        end
        object Label5: TLabel
          Left = 4
          Top = 61
          Width = 90
          Height = 13
          Caption = 'Tipo de movimento'
        end
        object Label8: TLabel
          Left = 38
          Top = 88
          Width = 56
          Height = 13
          Caption = 'Quantidade'
          FocusControl = EMov_Quantidade
        end
        object EMov_Produto: TDBEdit
          Left = 97
          Top = 8
          Width = 63
          Height = 21
          DataField = 'Mov_Produto'
          DataSource = DS
          TabOrder = 0
        end
        object EMov_Data: TDBEdit
          Left = 97
          Top = 34
          Width = 77
          Height = 21
          DataField = 'Mov_Data'
          DataSource = DS
          TabOrder = 1
        end
        object EMov_Quantidade: TDBEdit
          Left = 97
          Top = 88
          Width = 77
          Height = 21
          DataField = 'Mov_Quantidade'
          DataSource = DS
          TabOrder = 3
        end
        object EMov_TipoDeMovimento: TDBComboBox
          Left = 97
          Top = 61
          Width = 77
          Height = 21
          Style = csDropDownList
          DataField = 'Mov_TipoDeMovimento'
          DataSource = DS
          Items.Strings = (
            'Entrada'
            'Saida')
          TabOrder = 2
        end
        object CMov_Produto: TView
          Left = 163
          Top = 8
          Width = 350
          Height = 21
          Margins.Right = 10
          OnActive = CMov_ProdutoActive
          Connection = D.FDCon
          ShowCaption = True
          Associate = EMov_Produto
          Color = clWindow
        end
      end
    end
  end
  inherited ToolBar1: TToolBar
    Top = 190
    Width = 529
    ExplicitTop = 190
    ExplicitWidth = 529
  end
  inherited FDT: TFDTable
    IndexFieldNames = 'Mov_Produto;Mov_Data;Mov_Sequencia'
    UpdateOptions.UpdateTableName = 'VS12019.dbo.Movimento'
    TableName = 'VS12019.dbo.Movimento'
    object FDTMov_Produto: TIntegerField
      FieldName = 'Mov_Produto'
      Origin = 'Mov_Produto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDTMov_Data: TDateField
      FieldName = 'Mov_Data'
      Origin = 'Mov_Data'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      OnSetText = FDTMov_DataSetText
      DisplayFormat = 'DD/MM/YYYY'
      EditMask = '99/99/9999;1;_'
    end
    object FDTMov_Sequencia: TIntegerField
      FieldName = 'Mov_Sequencia'
      Origin = 'Mov_Sequencia'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDTMov_TipoDeMovimento: TStringField
      FieldName = 'Mov_TipoDeMovimento'
      Origin = 'Mov_TipoDeMovimento'
      Size = 11
    end
    object FDTMov_SaldoAnterior: TBCDField
      FieldName = 'Mov_SaldoAnterior'
      Origin = 'Mov_SaldoAnterior'
      Precision = 14
      Size = 2
    end
    object FDTMov_SaldoAtual: TBCDField
      FieldName = 'Mov_SaldoAtual'
      Origin = 'Mov_SaldoAtual'
      Precision = 14
      Size = 2
    end
    object FDTMov_Quantidade: TBCDField
      FieldName = 'Mov_Quantidade'
      Origin = 'Mov_Quantidade'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 14
      Size = 2
    end
  end
end

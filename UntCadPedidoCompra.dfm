inherited FrmCadPedidoCompra: TFrmCadPedidoCompra
  Caption = 'FrmCadPedidoCompra'
  ClientHeight = 409
  ClientWidth = 723
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 729
  ExplicitHeight = 438
  PixelsPerInch = 96
  TextHeight = 13
  inherited PTopo: TPanel
    Width = 723
    ExplicitWidth = 723
    inherited LCad: TLabel
      Width = 717
      Height = 30
    end
  end
  inherited Pages: TPageControl
    Width = 723
    Height = 336
    ExplicitWidth = 723
    ExplicitHeight = 336
    inherited P1: TTabSheet
      ExplicitWidth = 715
      ExplicitHeight = 308
      inherited PF1: TPanel
        Width = 715
        Height = 159
        ExplicitWidth = 715
        ExplicitHeight = 159
        object Label1: TLabel
          Left = 76
          Top = 27
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = EPecv_Codigo
        end
        object Label2: TLabel
          Left = 558
          Top = 27
          Width = 23
          Height = 13
          Caption = 'Data'
          FocusControl = EPec_Data
        end
        object Label4: TLabel
          Left = 54
          Top = 54
          Width = 55
          Height = 13
          Caption = 'Fornecedor'
          FocusControl = EPec_Fornecedor
        end
        object Label5: TLabel
          Left = 56
          Top = 81
          Width = 53
          Height = 13
          Caption = 'Comprador'
          FocusControl = EPec_Comprador
        end
        object Label7: TLabel
          Left = 481
          Top = 110
          Width = 51
          Height = 13
          Caption = 'Valor Total'
          FocusControl = EPec_ValorTotal
        end
        object Label8: TLabel
          Left = 44
          Top = 110
          Width = 65
          Height = 13
          Caption = 'Valor Produto'
          FocusControl = EPec_ValorProduto
        end
        object Label9: TLabel
          Left = 257
          Top = 110
          Width = 72
          Height = 13
          Caption = 'Valor Desconto'
          FocusControl = EPec_ValorDesconto
        end
        object Label3: TLabel
          Left = 317
          Top = 27
          Width = 41
          Height = 13
          Caption = 'Situa'#231#227'o'
        end
        object EPecv_Codigo: TDBEdit
          Left = 115
          Top = 27
          Width = 85
          Height = 21
          Color = clInfoBk
          DataField = 'Pec_Codigo'
          DataSource = DS
          Enabled = False
          TabOrder = 0
        end
        object EPec_Data: TDBEdit
          Left = 587
          Top = 27
          Width = 85
          Height = 21
          DataField = 'Pec_Data'
          DataSource = DS
          TabOrder = 2
        end
        object EPec_Fornecedor: TDBEdit
          Left = 115
          Top = 54
          Width = 85
          Height = 21
          DataField = 'Pec_Fornecedor'
          DataSource = DS
          TabOrder = 3
        end
        object EPec_Comprador: TDBEdit
          Left = 115
          Top = 81
          Width = 85
          Height = 21
          DataField = 'Pec_Comprador'
          DataSource = DS
          TabOrder = 4
        end
        object EPec_ValorTotal: TDBEdit
          Left = 538
          Top = 110
          Width = 134
          Height = 21
          Color = clInfoBk
          DataField = 'Pec_ValorTotal'
          DataSource = DS
          Enabled = False
          TabOrder = 5
        end
        object EPec_ValorProduto: TDBEdit
          Left = 115
          Top = 110
          Width = 134
          Height = 21
          Color = clInfoBk
          DataField = 'Pec_ValorProduto'
          DataSource = DS
          Enabled = False
          TabOrder = 6
        end
        object EPec_ValorDesconto: TDBEdit
          Left = 335
          Top = 110
          Width = 134
          Height = 21
          DataField = 'Pec_ValorDesconto'
          DataSource = DS
          TabOrder = 9
          OnExit = EPec_ValorDescontoExit
        end
        object CPec_Fornecedor: TView
          Left = 206
          Top = 54
          Width = 466
          Height = 21
          Margins.Right = 10
          OnActive = CPec_FornecedorActive
          Connection = D.FDCon
          ShowCaption = True
          Associate = EPec_Fornecedor
          Color = clWindow
        end
        object CPec_Comprador: TView
          Left = 206
          Top = 81
          Width = 466
          Height = 21
          Margins.Right = 10
          OnActive = CPec_CompradorActive
          Connection = D.FDCon
          ShowCaption = True
          Associate = EPec_Comprador
          Color = clWindow
        end
        object EPec_Status: TComboBox
          Left = 364
          Top = 27
          Width = 74
          Height = 21
          Color = clInfoBk
          Enabled = False
          ItemIndex = 2
          TabOrder = 1
          Text = 'Cancelado'
          Items.Strings = (
            'Pendente'
            'Baixado'
            'Cancelado')
        end
      end
      inherited Grid: TDBGrid
        Top = 196
        Width = 715
        Columns = <
          item
            Expanded = False
            FieldName = 'Pci_Produto'
            Title.Alignment = taRightJustify
            Title.Caption = 'C'#243'digo'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Pci_ProdutoDescricao'
            Title.Caption = 'Produto'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Pci_PrecoUnitario'
            Title.Caption = 'Pre'#231'o Unitario'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Pci_Quantidade'
            Title.Alignment = taRightJustify
            Title.Caption = 'Quantidade'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Pci_ValorTotal'
            Title.Alignment = taRightJustify
            Title.Caption = 'Valor Total'
            Visible = True
          end>
      end
      inherited ToolBar2: TToolBar
        Top = 159
        Width = 715
        ExplicitTop = 159
        ExplicitWidth = 715
        inherited btn_Consultar: TToolButton
          OnClick = btn_ConsultarClick
        end
      end
    end
  end
  inherited ToolBar1: TToolBar
    Top = 372
    Width = 723
    ExplicitTop = 372
    ExplicitWidth = 723
  end
  inherited FDT: TFDTable
    IndexFieldNames = 'Pec_Codigo'
    UpdateOptions.UpdateTableName = 'VS12019.dbo.PedidoCompra'
    TableName = 'VS12019.dbo.PedidoCompra'
    object FDTPec_Codigo: TFDAutoIncField
      FieldName = 'Pec_Codigo'
      Origin = 'Pec_Codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDTPec_Baixa: TDateField
      FieldName = 'Pec_Baixa'
      Origin = 'Pec_Baixa'
      OnSetText = FDTPec_BaixaSetText
      DisplayFormat = 'DD/MM/YYYY'
      EditMask = '99/99/9999;1;_'
    end
    object FDTPec_Data: TDateField
      FieldName = 'Pec_Data'
      Origin = 'Pec_Data'
      Required = True
      OnSetText = FDTPec_DataSetText
      DisplayFormat = 'DD/MM/YYYY'
      EditMask = '99/99/9999;1;_'
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
  end
  inherited FDT2: TFDTable
    AfterInsert = FDT2AfterInsert
    AfterPost = FDT2AfterPost
    AfterDelete = FDT2AfterDelete
    IndexFieldNames = 'Pci_PedidoCompra;Pci_Codigo'
    MasterSource = DS
    MasterFields = 'Pec_Codigo'
    UpdateOptions.UpdateTableName = 'VS12019.dbo.PedidoCompraItem'
    TableName = 'VS12019.dbo.PedidoCompraItem'
    Left = 160
    Top = 8
    object FDT2Pci_PedidoCompra: TIntegerField
      FieldName = 'Pci_PedidoCompra'
      Origin = 'Pci_PedidoCompra'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDT2Pci_Codigo: TIntegerField
      FieldName = 'Pci_Codigo'
      Origin = 'Pci_Codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDT2Pci_Data: TDateField
      FieldName = 'Pci_Data'
      Origin = 'Pci_Data'
      Required = True
    end
    object FDT2Pci_Baixa: TDateField
      FieldName = 'Pci_Baixa'
      Origin = 'Pci_Baixa'
    end
    object FDT2Pci_Fornecedor: TIntegerField
      FieldName = 'Pci_Fornecedor'
      Origin = 'Pci_Fornecedor'
      Required = True
    end
    object FDT2Pci_Comprador: TIntegerField
      FieldName = 'Pci_Comprador'
      Origin = 'Pci_Comprador'
    end
    object FDT2Pci_Produto: TIntegerField
      FieldName = 'Pci_Produto'
      Origin = 'Pci_Produto'
      Required = True
    end
    object FDT2Pci_Quantidade: TBCDField
      FieldName = 'Pci_Quantidade'
      Origin = 'Pci_Quantidade'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 14
      Size = 2
    end
    object FDT2Pci_PrecoUnitario: TBCDField
      FieldName = 'Pci_PrecoUnitario'
      Origin = 'Pci_PrecoUnitario'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 14
      Size = 2
    end
    object FDT2Pci_ValorTotal: TBCDField
      FieldName = 'Pci_ValorTotal'
      Origin = 'Pci_ValorTotal'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 14
      Size = 2
    end
    object FDT2Pci_Status: TStringField
      FieldName = 'Pci_Status'
      Origin = 'Pci_Status'
      Required = True
      FixedChar = True
      Size = 1
    end
    object FDT2Pci_ProdutoDescricao: TStringField
      FieldKind = fkLookup
      FieldName = 'Pci_ProdutoDescricao'
      LookupDataSet = TPro
      LookupKeyFields = 'Pro_codigo'
      LookupResultField = 'Pro_descricao'
      KeyFields = 'Pci_Produto'
      Size = 50
      Lookup = True
    end
  end
  inherited DS2: TDataSource
    Left = 130
    Top = 7
  end
  object TPro: TFDTable
    IndexFieldNames = 'Pro_Codigo'
    Connection = D.FDCon
    UpdateOptions.UpdateTableName = 'VS12019.dbo.Produto'
    TableName = 'VS12019.dbo.Produto'
    Left = 192
    Top = 8
    object TProPro_Codigo: TFDAutoIncField
      FieldName = 'Pro_Codigo'
      Origin = 'Pro_Codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object TProPro_Descricao: TStringField
      FieldName = 'Pro_Descricao'
      Origin = 'Pro_Descricao'
      Required = True
      Size = 50
    end
  end
end

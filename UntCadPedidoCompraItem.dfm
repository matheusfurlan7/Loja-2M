inherited FrmCadPedidoCompraItem: TFrmCadPedidoCompraItem
  Caption = 'FrmCadPedidoCompraItem'
  ClientHeight = 254
  OnCreate = FormCreate
  ExplicitWidth = 651
  ExplicitHeight = 283
  PixelsPerInch = 96
  TextHeight = 13
  inherited PTopo: TPanel
    inherited LCad: TLabel
      Width = 639
      Height = 30
    end
  end
  inherited Pages: TPageControl
    Height = 181
    ExplicitHeight = 181
    inherited P1: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 637
      ExplicitHeight = 153
      inherited PF1: TPanel
        Height = 153
        ExplicitHeight = 153
        object Label1: TLabel
          Left = 41
          Top = 20
          Width = 38
          Height = 13
          Caption = 'Produto'
          FocusControl = EPci_Produto
        end
        object Label2: TLabel
          Left = 225
          Top = 46
          Width = 56
          Height = 13
          Caption = 'Quantidade'
          FocusControl = EPci_Quantidade
        end
        object Label3: TLabel
          Left = 12
          Top = 46
          Width = 67
          Height = 13
          Caption = 'Preco Unitario'
          FocusControl = EPci_PrecoUnitario
        end
        object Label4: TLabel
          Left = 433
          Top = 46
          Width = 51
          Height = 13
          Caption = 'Valor Total'
          FocusControl = EPci_ValorTotal
        end
        object EPci_Produto: TDBEdit
          Left = 85
          Top = 20
          Width = 38
          Height = 21
          DataField = 'Pci_Produto'
          DataSource = DS
          TabOrder = 0
          OnEnter = EPci_ProdutoEnter
          OnExit = EPci_ProdutoExit
        end
        object EPci_Quantidade: TDBEdit
          Left = 287
          Top = 46
          Width = 134
          Height = 21
          DataField = 'Pci_Quantidade'
          DataSource = DS
          TabOrder = 2
          OnExit = EPci_QuantidadeExit
        end
        object EPci_PrecoUnitario: TDBEdit
          Left = 85
          Top = 46
          Width = 134
          Height = 21
          DataField = 'Pci_PrecoUnitario'
          DataSource = DS
          TabOrder = 1
          OnExit = EPci_PrecoUnitarioExit
        end
        object EPci_ValorTotal: TDBEdit
          Left = 490
          Top = 46
          Width = 134
          Height = 21
          DataField = 'Pci_ValorTotal'
          DataSource = DS
          TabOrder = 4
          OnExit = EPci_ValorTotalExit
        end
        object CPci_Produto: TView
          Left = 127
          Top = 20
          Width = 497
          Height = 21
          Margins.Right = 10
          OnActive = CPci_ProdutoActive
          Connection = D.FDCon
          ShowCaption = True
          Associate = EPci_Produto
          Color = clWindow
        end
        object GroupBox1: TGroupBox
          Left = 85
          Top = 73
          Width = 539
          Height = 64
          Caption = 'Estoque'
          TabOrder = 5
          object Label5: TLabel
            Left = 26
            Top = 22
            Width = 55
            Height = 13
            Caption = 'Encomenda'
          end
          object Label6: TLabel
            Left = 212
            Top = 22
            Width = 26
            Height = 13
            Caption = 'Saldo'
          end
          object Label7: TLabel
            Left = 370
            Top = 22
            Width = 32
            Height = 13
            Caption = 'Futuro'
          end
          object EFut: TEdit
            Left = 408
            Top = 22
            Width = 104
            Height = 21
            TabStop = False
            Color = clInfoBk
            ReadOnly = True
            TabOrder = 0
            Text = 'EFut'
          end
          object ESal: TEdit
            Left = 244
            Top = 22
            Width = 104
            Height = 21
            TabStop = False
            Color = clInfoBk
            ReadOnly = True
            TabOrder = 1
            Text = 'ESal'
          end
          object EEnc: TEdit
            Left = 87
            Top = 22
            Width = 104
            Height = 21
            TabStop = False
            Color = clInfoBk
            ReadOnly = True
            TabOrder = 2
            Text = 'EEnc'
          end
        end
      end
    end
  end
  inherited ToolBar1: TToolBar
    Top = 217
    ExplicitTop = 217
  end
  inherited FDT: TFDTable
    IndexFieldNames = 'Pci_PedidoCompra;Pci_Codigo'
    UpdateOptions.UpdateTableName = 'VS12019.dbo.PedidoCompraItem'
    TableName = 'VS12019.dbo.PedidoCompraItem'
    object FDTPci_PedidoCompra: TIntegerField
      FieldName = 'Pci_PedidoCompra'
      Origin = 'Pci_PedidoCompra'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDTPci_Codigo: TIntegerField
      FieldName = 'Pci_Codigo'
      Origin = 'Pci_Codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDTPci_Data: TDateField
      FieldName = 'Pci_Data'
      Origin = 'Pci_Data'
      Required = True
      DisplayFormat = 'DD/MM/YYYY'
    end
    object FDTPci_Baixa: TDateField
      FieldName = 'Pci_Baixa'
      Origin = 'Pci_Baixa'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object FDTPci_Fornecedor: TIntegerField
      FieldName = 'Pci_Fornecedor'
      Origin = 'Pci_Fornecedor'
      Required = True
    end
    object FDTPci_Comprador: TIntegerField
      FieldName = 'Pci_Comprador'
      Origin = 'Pci_Comprador'
    end
    object FDTPci_Produto: TIntegerField
      FieldName = 'Pci_Produto'
      Origin = 'Pci_Produto'
      Required = True
    end
    object FDTPci_Quantidade: TBCDField
      FieldName = 'Pci_Quantidade'
      Origin = 'Pci_Quantidade'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 14
      Size = 2
    end
    object FDTPci_PrecoUnitario: TBCDField
      DisplayLabel = 'Pci_Quantidade'
      FieldName = 'Pci_PrecoUnitario'
      Origin = 'Pci_PrecoUnitario'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 14
      Size = 2
    end
    object FDTPci_ValorTotal: TBCDField
      DisplayLabel = 'Pci_Quantidade'
      FieldName = 'Pci_ValorTotal'
      Origin = 'Pci_ValorTotal'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 14
      Size = 2
    end
    object FDTPci_Status: TStringField
      FieldName = 'Pci_Status'
      Origin = 'Pci_Status'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object QEstoque: TFDQuery
    Connection = D.FDCon
    Left = 120
    Top = 8
  end
end

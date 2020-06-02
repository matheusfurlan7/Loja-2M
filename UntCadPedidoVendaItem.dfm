inherited FrmCadPedidoVendaItem: TFrmCadPedidoVendaItem
  Caption = 'FrmCadPedidoVendaItem'
  ClientHeight = 252
  OnCreate = FormCreate
  ExplicitWidth = 651
  ExplicitHeight = 281
  PixelsPerInch = 96
  TextHeight = 13
  inherited PTopo: TPanel
    inherited LCad: TLabel
      Width = 639
      Height = 30
    end
  end
  inherited Pages: TPageControl
    Height = 179
    ExplicitHeight = 179
    inherited P1: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 637
      ExplicitHeight = 151
      inherited PF1: TPanel
        Height = 151
        ExplicitHeight = 151
        object Label1: TLabel
          Left = 41
          Top = 20
          Width = 38
          Height = 13
          Caption = 'Produto'
          FocusControl = EPvi_Produto
        end
        object Label2: TLabel
          Left = 225
          Top = 46
          Width = 56
          Height = 13
          Caption = 'Quantidade'
          FocusControl = EPvi_Quantidade
        end
        object Label3: TLabel
          Left = 12
          Top = 46
          Width = 67
          Height = 13
          Caption = 'Preco Unitario'
          FocusControl = EPvi_PrecoUnitario
        end
        object Label4: TLabel
          Left = 433
          Top = 46
          Width = 51
          Height = 13
          Caption = 'Valor Total'
          FocusControl = EPvi_ValorTotal
        end
        object EPvi_Produto: TDBEdit
          Left = 85
          Top = 20
          Width = 38
          Height = 21
          DataField = 'Pvi_Produto'
          DataSource = DS
          TabOrder = 0
          OnEnter = EPvi_ProdutoEnter
          OnExit = EPvi_ProdutoExit
        end
        object EPvi_Quantidade: TDBEdit
          Left = 287
          Top = 46
          Width = 134
          Height = 21
          DataField = 'Pvi_Quantidade'
          DataSource = DS
          TabOrder = 2
          OnExit = EPvi_QuantidadeExit
        end
        object EPvi_PrecoUnitario: TDBEdit
          Left = 85
          Top = 46
          Width = 134
          Height = 21
          DataField = 'Pvi_PrecoUnitario'
          DataSource = DS
          TabOrder = 1
          OnExit = EPvi_PrecoUnitarioExit
        end
        object EPvi_ValorTotal: TDBEdit
          Left = 490
          Top = 46
          Width = 134
          Height = 21
          DataField = 'Pvi_ValorTotal'
          DataSource = DS
          TabOrder = 4
          OnExit = EPvi_ValorTotalExit
        end
        object CPvi_Produto: TView
          Left = 127
          Top = 20
          Width = 497
          Height = 21
          Margins.Right = 10
          OnActive = CPvi_ProdutoActive
          Connection = D.FDCon
          ShowCaption = True
          Associate = EPvi_Produto
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
            Left = 23
            Top = 22
            Width = 40
            Height = 13
            Caption = 'Reserva'
          end
          object Label6: TLabel
            Left = 196
            Top = 22
            Width = 26
            Height = 13
            Caption = 'Saldo'
          end
          object Label7: TLabel
            Left = 358
            Top = 22
            Width = 48
            Height = 13
            Caption = 'Disponivel'
          end
          object EDis: TEdit
            Left = 412
            Top = 22
            Width = 104
            Height = 21
            TabStop = False
            Color = clInfoBk
            ReadOnly = True
            TabOrder = 0
            Text = 'EDis'
          end
          object ESal: TEdit
            Left = 228
            Top = 22
            Width = 104
            Height = 21
            TabStop = False
            Color = clInfoBk
            ReadOnly = True
            TabOrder = 1
            Text = 'ESal'
          end
          object ERes: TEdit
            Left = 67
            Top = 22
            Width = 104
            Height = 21
            TabStop = False
            Color = clInfoBk
            ReadOnly = True
            TabOrder = 2
            Text = 'ERes'
          end
        end
      end
    end
  end
  inherited ToolBar1: TToolBar
    Top = 215
    ExplicitTop = 215
  end
  inherited FDT: TFDTable
    IndexFieldNames = 'Pvi_PedidoVenda;Pvi_Codigo'
    UpdateOptions.UpdateTableName = 'VS12019.dbo.PedidoVendaItem'
    TableName = 'VS12019.dbo.PedidoVendaItem'
    object FDTPvi_PedidoVenda: TIntegerField
      FieldName = 'Pvi_PedidoVenda'
      Origin = 'Pvi_PedidoVenda'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDTPvi_Codigo: TIntegerField
      FieldName = 'Pvi_Codigo'
      Origin = 'Pvi_Codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDTPvi_Data: TDateField
      FieldName = 'Pvi_Data'
      Origin = 'Pvi_Data'
      Required = True
      DisplayFormat = 'DD/MM/YYYY'
    end
    object FDTPvi_Baixa: TDateField
      FieldName = 'Pvi_Baixa'
      Origin = 'Pvi_Baixa'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object FDTPvi_Cliente: TIntegerField
      FieldName = 'Pvi_Cliente'
      Origin = 'Pvi_Cliente'
      Required = True
    end
    object FDTPvi_Vendedor: TIntegerField
      FieldName = 'Pvi_Vendedor'
      Origin = 'Pvi_Vendedor'
    end
    object FDTPvi_Produto: TIntegerField
      FieldName = 'Pvi_Produto'
      Origin = 'Pvi_Produto'
      Required = True
    end
    object FDTPvi_Quantidade: TBCDField
      FieldName = 'Pvi_Quantidade'
      Origin = 'Pvi_Quantidade'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 14
      Size = 2
    end
    object FDTPvi_PrecoUnitario: TBCDField
      FieldName = 'Pvi_PrecoUnitario'
      Origin = 'Pvi_PrecoUnitario'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 14
      Size = 2
    end
    object FDTPvi_ValorTotal: TBCDField
      FieldName = 'Pvi_ValorTotal'
      Origin = 'Pvi_ValorTotal'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 14
      Size = 2
    end
    object FDTPvi_Status: TStringField
      FieldName = 'Pvi_Status'
      Origin = 'Pvi_Status'
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

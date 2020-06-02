inherited FrmCadPedidoVenda: TFrmCadPedidoVenda
  Caption = 'FrmCadPedidoVenda'
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
          FocusControl = EPev_Codigo
        end
        object Label2: TLabel
          Left = 558
          Top = 27
          Width = 23
          Height = 13
          Caption = 'Data'
          FocusControl = EPev_Data
        end
        object Label4: TLabel
          Left = 76
          Top = 54
          Width = 33
          Height = 13
          Caption = 'Cliente'
          FocusControl = EPev_Cliente
        end
        object Label5: TLabel
          Left = 66
          Top = 81
          Width = 46
          Height = 13
          Caption = 'Vendedor'
          FocusControl = EPev_Vendedor
        end
        object Label7: TLabel
          Left = 481
          Top = 110
          Width = 51
          Height = 13
          Caption = 'Valor Total'
          FocusControl = EPev_ValorTotal
        end
        object Label8: TLabel
          Left = 44
          Top = 110
          Width = 65
          Height = 13
          Caption = 'Valor Produto'
          FocusControl = EPev_ValorProduto
        end
        object Label9: TLabel
          Left = 257
          Top = 110
          Width = 72
          Height = 13
          Caption = 'Valor Desconto'
          FocusControl = EPev_ValorDesconto
        end
        object Label3: TLabel
          Left = 317
          Top = 27
          Width = 41
          Height = 13
          Caption = 'Situa'#231#227'o'
        end
        object EPev_Codigo: TDBEdit
          Left = 115
          Top = 27
          Width = 85
          Height = 21
          Color = clInfoBk
          DataField = 'Pev_Codigo'
          DataSource = DS
          Enabled = False
          TabOrder = 0
        end
        object EPev_Data: TDBEdit
          Left = 587
          Top = 27
          Width = 85
          Height = 21
          DataField = 'Pev_Data'
          DataSource = DS
          TabOrder = 2
        end
        object EPev_Cliente: TDBEdit
          Left = 115
          Top = 54
          Width = 85
          Height = 21
          DataField = 'Pev_Cliente'
          DataSource = DS
          TabOrder = 3
        end
        object EPev_Vendedor: TDBEdit
          Left = 115
          Top = 81
          Width = 85
          Height = 21
          DataField = 'Pev_Vendedor'
          DataSource = DS
          TabOrder = 4
        end
        object EPev_ValorTotal: TDBEdit
          Left = 538
          Top = 110
          Width = 134
          Height = 21
          Color = clInfoBk
          DataField = 'Pev_ValorTotal'
          DataSource = DS
          Enabled = False
          TabOrder = 5
        end
        object EPev_ValorProduto: TDBEdit
          Left = 115
          Top = 110
          Width = 134
          Height = 21
          Color = clInfoBk
          DataField = 'Pev_ValorProduto'
          DataSource = DS
          Enabled = False
          TabOrder = 6
        end
        object EPev_ValorDesconto: TDBEdit
          Left = 335
          Top = 110
          Width = 134
          Height = 21
          DataField = 'Pev_ValorDesconto'
          DataSource = DS
          TabOrder = 9
          OnExit = EPev_ValorDescontoExit
        end
        object CPev_Cliente: TView
          Left = 206
          Top = 54
          Width = 466
          Height = 21
          Margins.Right = 10
          OnActive = CPev_ClienteActive
          Connection = D.FDCon
          ShowCaption = True
          Associate = EPev_Cliente
          Color = clWindow
        end
        object CPev_Vendedor: TView
          Left = 206
          Top = 81
          Width = 466
          Height = 21
          Margins.Right = 10
          OnActive = CPev_VendedorActive
          Connection = D.FDCon
          ShowCaption = True
          Associate = EPev_Vendedor
          Color = clWindow
        end
        object EPev_Status: TComboBox
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
            FieldName = 'Pvi_Produto'
            Title.Alignment = taRightJustify
            Title.Caption = 'C'#243'digo'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Pvi_ProdutoDescricao'
            Title.Caption = 'Produto'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Pvi_PrecoUnitario'
            Title.Caption = 'Pre'#231'o Unitario'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Pvi_Quantidade'
            Title.Alignment = taRightJustify
            Title.Caption = 'Quantidade'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Pvi_ValorTotal'
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
    IndexFieldNames = 'Pev_Codigo'
    UpdateOptions.UpdateTableName = 'VS12019.dbo.PedidoVenda'
    TableName = 'VS12019.dbo.PedidoVenda'
    object FDTPev_Codigo: TFDAutoIncField
      FieldName = 'Pev_Codigo'
      Origin = 'Pev_Codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDTPev_Data: TDateField
      FieldName = 'Pev_Data'
      Origin = 'Pev_Data'
      Required = True
      OnSetText = FDTPev_DataSetText
      DisplayFormat = 'DD/MM/YYYY'
      EditMask = '99/99/9999;1;_'
    end
    object FDTPev_Baixa: TDateField
      FieldName = 'Pev_Baixa'
      Origin = 'Pev_Baixa'
      OnSetText = FDTPev_BaixaSetText
      DisplayFormat = 'DD/MM/YYYY'
      EditMask = '99/99/9999;1;_'
    end
    object FDTPev_Cliente: TIntegerField
      FieldName = 'Pev_Cliente'
      Origin = 'Pev_Cliente'
      Required = True
    end
    object FDTPev_Vendedor: TIntegerField
      FieldName = 'Pev_Vendedor'
      Origin = 'Pev_Vendedor'
    end
    object FDTPev_Status: TStringField
      FieldName = 'Pev_Status'
      Origin = 'Pev_Status'
      Required = True
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
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 14
      Size = 2
    end
    object FDTPev_ValorDesconto: TBCDField
      FieldName = 'Pev_ValorDesconto'
      Origin = 'Pev_ValorDesconto'
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
    IndexFieldNames = 'Pvi_PedidoVenda;Pvi_Codigo'
    MasterSource = DS
    MasterFields = 'Pev_Codigo'
    UpdateOptions.UpdateTableName = 'VS12019.dbo.PedidoVendaItem'
    TableName = 'VS12019.dbo.PedidoVendaItem'
    Left = 160
    Top = 8
    object FDT2Pvi_PedidoVenda: TIntegerField
      FieldName = 'Pvi_PedidoVenda'
      Origin = 'Pvi_PedidoVenda'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDT2Pvi_Codigo: TIntegerField
      FieldName = 'Pvi_Codigo'
      Origin = 'Pvi_Codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDT2Pvi_Data: TDateField
      FieldName = 'Pvi_Data'
      Origin = 'Pvi_Data'
      Required = True
    end
    object FDT2Pvi_Baixa: TDateField
      FieldName = 'Pvi_Baixa'
      Origin = 'Pvi_Baixa'
      Required = True
    end
    object FDT2Pvi_Cliente: TIntegerField
      FieldName = 'Pvi_Cliente'
      Origin = 'Pvi_Cliente'
      Required = True
    end
    object FDT2Pvi_Vendedor: TIntegerField
      FieldName = 'Pvi_Vendedor'
      Origin = 'Pvi_Vendedor'
      Required = True
    end
    object FDT2Pvi_Produto: TIntegerField
      FieldName = 'Pvi_Produto'
      Origin = 'Pvi_Produto'
      Required = True
    end
    object FDT2Pvi_Quantidade: TBCDField
      FieldName = 'Pvi_Quantidade'
      Origin = 'Pvi_Quantidade'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 14
      Size = 2
    end
    object FDT2Pvi_PrecoUnitario: TBCDField
      FieldName = 'Pvi_PrecoUnitario'
      Origin = 'Pvi_PrecoUnitario'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 14
      Size = 2
    end
    object FDT2Pvi_ValorTotal: TBCDField
      FieldName = 'Pvi_ValorTotal'
      Origin = 'Pvi_ValorTotal'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 14
      Size = 2
    end
    object FDT2Pvi_Status: TStringField
      FieldName = 'Pvi_Status'
      Origin = 'Pvi_Status'
      FixedChar = True
      Size = 1
    end
    object FDT2Pvi_ProdutoDescricao: TStringField
      FieldKind = fkLookup
      FieldName = 'Pvi_ProdutoDescricao'
      LookupDataSet = TPro
      LookupKeyFields = 'Pro_Codigo'
      LookupResultField = 'Pro_Descricao'
      KeyFields = 'Pvi_Produto'
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

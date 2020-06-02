﻿inherited FrmRelProduto: TFrmRelProduto
  Caption = ''
  ClientHeight = 407
  ClientWidth = 488
  ExplicitWidth = 494
  ExplicitHeight = 436
  PixelsPerInch = 96
  TextHeight = 13
  inherited PTopo: TPanel
    Width = 488
    ExplicitWidth = 488
    inherited LCad: TLabel
      Width = 201
      Caption = 'Relat'#243'rio - Produto'
      ExplicitWidth = 201
    end
  end
  inherited PF1: TPanel
    Width = 488
    Height = 334
    ExplicitWidth = 488
    ExplicitHeight = 334
    object Label6: TLabel
      Left = 363
      Top = 252
      Width = 41
      Height = 13
      Caption = 'Situa'#231#227'o'
    end
    object Label3: TLabel
      Left = 321
      Top = 279
      Width = 83
      Height = 13
      Caption = 'Controla Estoque'
    end
    object GCod: TGroupBox
      Left = 20
      Top = 9
      Width = 107
      Height = 75
      Caption = 'C'#243'digo'
      TabOrder = 0
      object De: TLabel
        Left = 16
        Top = 18
        Width = 13
        Height = 13
        Caption = 'De'
      end
      object Até: TLabel
        Left = 12
        Top = 45
        Width = 17
        Height = 13
        Caption = 'At'#233
      end
      object ECodDe: TEdit
        Left = 35
        Top = 18
        Width = 61
        Height = 21
        NumbersOnly = True
        TabOrder = 0
      end
      object ECodAte: TEdit
        Left = 35
        Top = 45
        Width = 61
        Height = 21
        NumbersOnly = True
        TabOrder = 1
      end
    end
    object GNome: TGroupBox
      Left = 133
      Top = 9
      Width = 347
      Height = 75
      Caption = 'Descri'#231#227'o'
      TabOrder = 1
      object Label1: TLabel
        Left = 9
        Top = 18
        Width = 13
        Height = 13
        Caption = 'De'
      end
      object Label2: TLabel
        Left = 5
        Top = 45
        Width = 17
        Height = 13
        Caption = 'At'#233
      end
      object EDescricaoDe: TEdit
        Left = 28
        Top = 18
        Width = 310
        Height = 21
        MaxLength = 50
        TabOrder = 0
      end
      object EDescricaoAte: TEdit
        Left = 28
        Top = 45
        Width = 310
        Height = 21
        MaxLength = 50
        TabOrder = 1
      end
    end
    object ESituacao: TComboBox
      Left = 410
      Top = 252
      Width = 70
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 6
      Text = 'Ambos'
      Items.Strings = (
        'Ambos'
        'Ativo'
        'Inativo')
    end
    object GCadastro: TGroupBox
      Left = 20
      Top = 252
      Width = 107
      Height = 75
      Caption = 'Cadastro'
      TabOrder = 5
      object Label8: TLabel
        Left = 16
        Top = 18
        Width = 13
        Height = 13
        Caption = 'De'
      end
      object Label9: TLabel
        Left = 12
        Top = 45
        Width = 17
        Height = 13
        Caption = 'At'#233
      end
      object ECadastroDe: TMaskEdit
        Left = 35
        Top = 18
        Width = 61
        Height = 21
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
        OnExit = ECadastroDeExit
      end
      object ECadastroAte: TMaskEdit
        Left = 35
        Top = 45
        Width = 61
        Height = 21
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
        OnExit = ECadastroAteExit
      end
    end
    object GGrupo: TGroupBox
      Left = 20
      Top = 90
      Width = 460
      Height = 75
      Caption = 'Grupo'
      TabOrder = 2
      object Label16: TLabel
        Left = 11
        Top = 18
        Width = 13
        Height = 13
        Caption = 'De'
      end
      object Label17: TLabel
        Left = 7
        Top = 45
        Width = 17
        Height = 13
        Caption = 'At'#233
      end
      object CGrupoDe: TView
        Left = 88
        Top = 18
        Width = 367
        Height = 21
        Margins.Right = 10
        OnActive = CGrupoDeActive
        Connection = D.FDCon
        ShowCaption = True
        Associate = EGrupoDe
        Color = clWindow
      end
      object CGrupoAte: TView
        Left = 88
        Top = 45
        Width = 367
        Height = 21
        Margins.Right = 10
        OnActive = CGrupoAteActive
        Connection = D.FDCon
        ShowCaption = True
        Associate = EGrupoAte
        Color = clWindow
      end
      object EGrupoDe: TEdit
        Left = 30
        Top = 18
        Width = 56
        Height = 21
        NumbersOnly = True
        TabOrder = 2
      end
      object EGrupoAte: TEdit
        Left = 30
        Top = 45
        Width = 56
        Height = 21
        NumbersOnly = True
        TabOrder = 3
      end
    end
    object GUnidade: TGroupBox
      Left = 20
      Top = 171
      Width = 113
      Height = 75
      Caption = 'Unidade'
      TabOrder = 3
      object Label18: TLabel
        Left = 11
        Top = 18
        Width = 13
        Height = 13
        Caption = 'De'
      end
      object Label19: TLabel
        Left = 7
        Top = 45
        Width = 17
        Height = 13
        Caption = 'At'#233
      end
      object EUnidadeDe: TMaskEdit
        Left = 30
        Top = 18
        Width = 48
        Height = 21
        CharCase = ecUpperCase
        DoubleBuffered = False
        MaxLength = 2
        ParentDoubleBuffered = False
        TabOrder = 0
        Text = ''
      end
      object EUnidadeAte: TMaskEdit
        Left = 30
        Top = 45
        Width = 48
        Height = 21
        CharCase = ecUpperCase
        DoubleBuffered = False
        MaxLength = 2
        ParentDoubleBuffered = False
        TabOrder = 1
        Text = ''
      end
      object CUnidadeDe: TView
        Left = 79
        Top = 18
        Width = 24
        Height = 21
        Margins.Right = 10
        OnActive = CUnidadeDeActive
        Connection = D.FDCon
        ShowCaption = False
        Associate = EUnidadeDe
        Color = clWindow
      end
      object CUnidadeAte: TView
        Left = 79
        Top = 45
        Width = 24
        Height = 21
        Margins.Right = 10
        OnActive = CUnidadeAteActive
        Connection = D.FDCon
        ShowCaption = False
        Associate = EUnidadeAte
        Color = clWindow
      end
    end
    object EControlaEstoque: TComboBox
      Left = 410
      Top = 279
      Width = 70
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 7
      Text = 'Ambos'
      Items.Strings = (
        'Ambos'
        'Sim'
        'N'#227'o')
    end
    object GroupBox1: TGroupBox
      Left = 139
      Top = 171
      Width = 341
      Height = 75
      Caption = 'C'#243'digo de barras'
      TabOrder = 4
      object Label4: TLabel
        Left = 9
        Top = 18
        Width = 13
        Height = 13
        Caption = 'De'
      end
      object Label5: TLabel
        Left = 5
        Top = 45
        Width = 17
        Height = 13
        Caption = 'At'#233
      end
      object ECodigoDeBarrasDe: TEdit
        Left = 28
        Top = 18
        Width = 308
        Height = 21
        MaxLength = 20
        TabOrder = 0
      end
      object ECodigoDeBarrasAte: TEdit
        Left = 28
        Top = 45
        Width = 308
        Height = 21
        MaxLength = 20
        TabOrder = 1
      end
    end
  end
  inherited ToolBar1: TToolBar
    Top = 370
    Width = 488
    ExplicitTop = 370
    ExplicitWidth = 488
  end
  inherited Relatorio: TfrxReport
    ReportOptions.LastChange = 43611.661536608800000000
    Datasets = <
      item
        DataSet = DBDS
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    inherited Page1: TfrxReportPage
      inherited MasterData1: TfrxMasterData
        Height = 154.960730000000000000
        inherited Memo8: TfrxMemoView
          Height = 154.960730000000000000
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Top = 11.338590000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
        end
        object frxDBDataset1Pes_Codigo: TfrxMemoView
          Left = 54.472480000000000000
          Top = 11.338590000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'PRO_CODIGO'
          DataSet = DBDS
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."PRO_CODIGO"]')
        end
        object Memo6: TfrxMemoView
          Left = 3.779530000000000000
          Top = 34.015770000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
        end
        object frxDBDataset1Pes_Nome: TfrxMemoView
          Left = 79.370130000000000000
          Top = 34.015770000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'PRO_DESCRICAO'
          DataSet = DBDS
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."PRO_DESCRICAO"]')
        end
        object Memo10: TfrxMemoView
          Left = 568.709030000000000000
          Top = 11.338590000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Situa'#231#227'o')
          ParentFont = False
        end
        object frxDBDataset1Pes_Situacao: TfrxMemoView
          Left = 631.181510000000000000
          Top = 11.338585120000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'PRO_SITUACAO'
          DataSet = DBDS
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."PRO_SITUACAO"]')
        end
        object Memo21: TfrxMemoView
          Left = 3.779530000000000000
          Top = 55.692950000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Grupo')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 3.779530000000000000
          Top = 81.149660000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Unidade')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 147.401670000000000000
          Top = 81.370130000000000000
          Width = 381.732530000000000000
          Height = 18.897650000000000000
          DataField = 'UNI_UNIDADE'
          DataSet = DBDS
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."UNI_UNIDADE"]')
        end
        object Memo12: TfrxMemoView
          Left = 64.252010000000000000
          Top = 81.370130000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'PRO_UNIDADE'
          DataSet = DBDS
          DataSetName = 'frxDBDataset1'
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."PRO_UNIDADE"]')
        end
        object Memo13: TfrxMemoView
          Left = 3.779530000000000000
          Top = 105.826840000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'digo de barras')
          ParentFont = False
        end
        object frxDBDataset1PRO_CODIGODEBARRAS: TfrxMemoView
          Left = 128.504020000000000000
          Top = 105.826840000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          DataField = 'PRO_CODIGODEBARRAS'
          DataSet = DBDS
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."PRO_CODIGODEBARRAS"]')
        end
        object frxDBDataset1PRO_CUSTOMEDIO: TfrxMemoView
          Left = 98.267780000000000000
          Top = 128.504020000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataField = 'PRO_CUSTOMEDIO'
          DataSet = DBDS
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."PRO_CUSTOMEDIO"]')
        end
        object frxDBDataset1PRO_MARGEMLUCRO: TfrxMemoView
          Left = 343.937230000000000000
          Top = 127.724490000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'PRO_MARGEMLUCRO'
          DataSet = DBDS
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."PRO_MARGEMLUCRO"]')
        end
        object frxDBDataset1PRO_PRECOVENDA: TfrxMemoView
          Left = 548.031850000000000000
          Top = 128.504020000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataField = 'PRO_PRECOVENDA'
          DataSet = DBDS
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."PRO_PRECOVENDA"]')
        end
        object Memo14: TfrxMemoView
          Left = 3.779530000000000000
          Top = 128.504020000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Custo m'#233'dio')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 226.771800000000000000
          Top = 128.504020000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Margem de lucro')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 430.866420000000000000
          Top = 128.504020000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Pre'#231'o de venda')
          ParentFont = False
        end
        object frxDBDataset1GRU_DESCRICAO: TfrxMemoView
          Left = 132.283550000000000000
          Top = 56.692950000000000000
          Width = 396.850650000000000000
          Height = 18.897650000000000000
          DataField = 'GRU_DESCRICAO'
          DataSet = DBDS
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."GRU_DESCRICAO"]')
        end
        object frxDBDataset1PRO_GRUPO: TfrxMemoView
          Left = 52.913420000000000000
          Top = 56.692950000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'PRO_GRUPO'
          DataSet = DBDS
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."PRO_GRUPO"]')
        end
      end
      inherited PageFooter1: TfrxPageFooter
        Top = 483.779840000000000000
        inherited Memo1: TfrxMemoView
          Left = 537.016080000000000000
          Top = 7.000000000000060000
          Width = 177.637910000000000000
          Formats = <
            item
            end
            item
            end>
        end
        inherited Line1: TfrxLineView
          Top = 1.779530000000140000
        end
      end
      inherited PageHeader1: TfrxPageHeader
        inherited Picture1: TfrxPictureView
          Picture.Data = {
            0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000025800
            00009008020000005B20827B000000017352474200AECE1CE90000000467414D
            410000B18F0BFC6105000000097048597300000EC300000EC301C76FA8640000
            1ABA4944415478DAED9D6D885EC775C7EFBE3CBB9276253BED0749699380BCA2
            F893D64A4CB05E9A1A63CBB289A8E30A538365248AC04A15538165BCC60A91B1
            425450B1451510454116C828B69BE292D84E28AA2CD9A1B4D832B414B252A16D
            52AD3F24B1B4AFDAD5EEF6AC47195FDFE7DEB93367CE7DDBF9FF0862AD68EFCB
            DC99F33FE7CC99998EF9F9F90800000008950E0821000080908110020000081A
            0821000080A08110020000081A0821000080A08110020000081A0821000080A0
            8110020000081A0821000080A08110020000081A0821000080A0811002000008
            1A0821000080A08110020000081A0821000080A08110020000081A0821000080
            A08110020000081A0821000080A08110020000081A0821000080A08110020000
            081A0821000080A08110020000081A0821000080A08110020000081A08210000
            80A08110020000081A0821000080A08110020000081A0821583C5CFF877F9CFE
            C95BB3C397662FFD97FA9BEE3BD6B5366DE8B9F71EFAA1EAA75BCC50CBCFFDDF
            95B9918FA8F1E7C7C7E96F6E7CF061FB3FEB1A58D3B17C39FDD03DB8F039BAD7
            0FB6BEB2BEF30FFFA0EAC707A10321CC67FCC0F3533F78B9EAA75880ACF92D6F
            BC56F553D491B95FFE6A74CF93A9C657B164E78EBE83CF55FD988B0A12BF9977
            2EDCF8E0A2763B7874AE5A491D9BA4B175D757EBE0AF9439DE0B1AD1341CAE3E
            F408F925E5BC45FFD123BD7FFAF572EE551010426768FCD39FB3BF189EB9F09E
            C1F2FA408E73F71D835D03B7757E7EF5CDBFF9D217EB6023EAC9CCD973A482F3
            63E3E67F46ADBAE2D409C41F9E506B4FBDF2C399F3EFE6363803EAE43DF7DFD7
            BBEDC1FA7C267ADFB9ABD7E6474767872F4FBFF9B6ACBA14248463FB9EBEFEEA
            DF8B5F9646506BF326725CB45D5A34013D84D08B89C347268F7E5FF082343096
            EC7ABCE9EE5599902F72EDD1C72D8D32426A3614644C9D3E43E65529818AE1BA
            D70F265C3472134933E8A39052B235A3A3BFAF77FBC34B77EFAAA191951DF245
            7448FA04637BF7C95E939EB3EF3BCF2D625F1C42E8CBAFBFB056EA52AD4D1B56
            BC72B2EA176A1857B7FD99535CBEEC99A796EED95DF553370992C0C9E327AEBF
            FABAF23696ECDCD1FBD0361B9B481679EAC44976D684E490EEB56CBFB04DF7C7
            B5CB19101742FA581FDFFB60B4D07AFD52C16BCFD6FB961FFF5BC187AC211042
            5FA4849086FDAD3FFB710D5DE03A3373F6DCB51D7FE1F42B9DAB567EEE5F2F54
            FDE08D61EAD4E9C9978EE9289011167886505D036BFA0E0CB5EEFE5AD52DF129
            829388E24278EDCF1F9FB9F0DED2BD4F90104E7CF7AFFD2F18885D82107A41FE
            D76FEFFA13914BA19A8301CF24AD78F9EF6A6558EB09F5EDF18387A6DFFCA9FA
            4F9FB0C0335947B678D9D0FE258F3D5A7593DC44F73A9231CFD0505608C96B19
            1FFAB6BAA654D81A885D82107AA17A9EFF750271BBC4E18D76F2976B9870AB15
            A482D71EDBA5CB41FD936393C78E7B0628F5C9698FEEFE26F907AA72C4333414
            144235594E3FAC38BD30BD4243C3FF9AE1D82508A1176A48F85F2710B74B1C9E
            10A2B5CDCC9C3D37B6FF593DC32465AC55D6CEE70A35D1C28FEFDE422E02B953
            F363E3F51142351694932755351ACE4881107AF19BDB07458AC83FF7F37F0EC1
            ED120742284E7B15AE54269931A19B800294E5C75EAC36AD4DEDA3822D12B0EB
            3F7AA32642A82662F5D560975C8110F291CA8B8650945510488DCA92C88846D2
            B5452A96F2B942D7C09A5BCFBE5D611329C9518FE15F35232284F1A4285D1076
            890184908F545E14B51B6C502C234BBB63215BCD21526F596D825425787BB77F
            A3FFC8F76A2284CABDE83BF41D554FE49F825604354C20847C44F20F957BB88D
            46E7A9ECC1F2892C52CDBA6CB98448B052E190D155E24A24EA2084EA19F41264
            C68828E8C19A0584908954FEA126F3FFCDC5D5FF4583A76230A03D5BEFEB3B30
            24A285529B9E908DAE64971355FBAA7DA9CA85504DBBC69D15A98D6F421B2610
            42262279D170AA938B436DA561199A0735EDE184B93F93E9EFDDFE8DD69D5FF6
            CC9549096155B3BCF1BC685403214C244589DFDEB9C97F439900B32610420E52
            EBE8619745B0DC741BAD9D856B3EAD6B604DD7DA819E07EE77DD14574A082BF9
            9489BC6854B510AA3512F17D19A59A37C0B26A082107FFD5C18AA0A6A30B854C
            F9F8B79FCFAA20559B388736B6ED61E7D35CB3A65296BA92192C351B128F962A
            1442D59289949254F95E5599E70A81107210D9BE086532E2641DCCBBE4D14790
            7F36E0B3AAC1A91B375A0895CCE8BC68549D10EAE306E34951A7390203616EFD
            0F217446AA2E2BB4E968505B3C378EB7CFA4499598552284AA4A3C9EC5A94A08
            555234911F964A532D8253761940089D11590B853219501344A234CB2D48A4CE
            6D285F08DBF3A222AFC37811FD24B7FCE84CBCCDFD372B88822C935140089D11
            A9CB42E106A80922426899DE905AEB5DFEF069CF8B465508A1CE7F26E236A934
            55B09B2E4108DD909AE440990CA809225D3AA110598838915115658DED79D1A8
            0A214CACDFD048EDB21DCEE6A20920846E88D465A14C06D4071121B431E8FE9B
            6E6BE2452225909A178D4A1742BD9C3F91148D8476B90A394D05217440AA2E0B
            6532A03E942684529B9E44A5072EA979D1A85C21D4A782B417B3489520855926
            A380103A205297D5D032193297B3BF189E1BF968F6D2E5E8936119FF7FC94BED
            5CBDAA7B705DF7FAC182C612C513D367DFB971F1C3B92B233ABD46F7255342F7
            2DD3B1A0A6B8F1FEC5D9E14BF3E3E3F176500FD3DABCB13E67A95BE259351AD9
            E52A45AA39A22AEAFB53F3A251B942A8966CA5A6A045665E832D935140081D10
            593ED8A0FC0345C0D7DFF8F1CCF977B386190D9EA5DFDA43769FFEE5D4E933CA
            DFA7BFECD9BA45700A878467EAC44973CBEB2729AE35C80D323445E261963DFB
            74DC2160F79C72E692FD2D696EAE526A723D2A3DA19295178D4A14427DF6D38A
            5327123E345673890021B445AAC335A24C86CCD6F533AF998D63FBB08CCFD8B7
            8B0103D2D7F18387EC27658B7032E819268F9FB8FEEAEBAE2971AD0D6C0D286D
            918067AAA3A3BFEFF7FEF3A2F9DF486D7A527EE09295178DCA1242BD8360AAE9
            10493837344D250884D01691BAACFA97C9D8845FD127F6A87DC6BEDDE25B1613
            A6A20F895DB27347EF43DBC864D8042E825AE82A81F471973EF997A4FDD47A93
            DF5F081F953CB0E3AD324B427CEA3973F3A2524E64547AE0A2CB025245A81C21
            5429E5AC46C66A2E112084B68874B83AE71FCCDB752648B50BA9A10FEF101FA5
            82D4E0CB8FBDA86F64591420B2168ADE65E285EFD97FF1447CAC3668EE3F7AA4
            EB4B5FE46940C9A10FBBA4D3C6B713995388AA58479F387729410942A86E91D5
            C858CD250584D00A91BAAC3AE71F260E1FA1F16619FA64C57959C332756EC3CC
            E8EE6F52441557C1C8FA2B78B63369D8C491979CA2FFD4172447BEB5999CA711
            5E4AB07C9F899120B5F9B252358DF459579C3E59F266D059EBF614450BA1F64E
            B2840AABB9A480105A21D2E1EA997F20BB3FF6D4907DEECE2033064BEAF4EE6A
            DAA35D09ECB3D3ECA0900297B17DFB9D8A1BB30C348541AD4D1B78F33755F94C
            245A13870EDBA7827355506AC5113548C22B2A81F6739712142A84F1A981D4A4
            285673090221CC47EAF4C11AE61FC8E51C3F78C8C9EE1B868D59A82C7703515E
            706A89BC7DFD3D2F876679AEA16583FCE6F6C1CE552B790B062A3C10CEA640C9
            FE582B91CAFE4A5430CACB8B46050BA11A4D86702DE4D55CE24008F311A9CBAA
            61FE8161F7CD1357B94265B362972E428FD45E89E35A70F1FBFF3BECD41A6456
            268F1E7355C12C43E6E93C55BED3955E39333732A2BF297DFDAE81DBE8952D8F
            B592DA9EBE12158C7E37B569C82E142784FAB841C3BB8BACCBAC679AAA7C2084
            F98874B8BAE51F78D18F41C96C4C7FAE37A02C4BEA5D5CAB769D8490ED5C671D
            61EA3331B6386C93C8D4207598FE23872B3924563B5E86536A0B12427DDCA041
            83A5F6ABAB619AAA122084398874B8BAE51F782A68CE375A1A3E8343A04C4F56
            61826BD5AEFD7E516C153424307D16DB2C82F3C1791D2C01AFDE580ABD86DDE0
            BA1524842A9F6C1E6E81ACE62A0D08610E8BAF4C46FB9BAEBF689616CB86320C
            6F52C1D9E14BA91E03A34CDC5208D926DBECDCB0B308951C392B8BBF0A52DB2E
            1BDA5FED4E75EA0B9AABAE8A1042E550E696C88AECB25DB734558540084D48D5
            6555927FA0879FF9B7F7E987841EF01675E51A68FB91991AF1A8F19F353219EE
            884D9BFB98ECDCD09671CDA8F91B1FB3DD2C4DB581A042E781CC93B5E242A80D
            8E59805126230E84D0844887AB2AFFA0C42371777646C56CA09D2684DA254459
            CFCED5ABB20A4F18EE48EE1CA12E4F67B486B968885D5DD5F48D8F7D9A34FA44
            1596EC7ABC0E7E801A26B9BB7B8B0BA14D52340A6FD3E31280109A686E998C0E
            A1E27767EF4391ABE54E115BD67136595ACB70476C14C5C79A98BF29BBDB343A
            55E5A382F59140854A6FE46E71272B84CA7FCA4D8A06B5E97169400833696E99
            8C568EC4DDD9BBC4990DB46BC4969A0EEA1E5C97E57D3374C572E72A46534479
            2ACBEE36365B57D7167AEBB1FDCFBAF62E7AE5D6E68D4B9FD89D5B1CA43AC9D2
            BD7B4A7014F42C5DEEE71014427DDC60AE3324B2280565320920849934B44C26
            1E3FC5EFCE1E3FB9D1956BC49630312A0D95552AC9F37FCD0BD23D7768349B2A
            76B7A97011BD278CA95632C4BDDB1FEEDDF6A0A58F489D64FACDB7CB7114CCDB
            AAC5111442959FB0396A71D16F7A5C0910C2741ABA9B4CC2C4EBBBFB54FDE48E
            19468E313E81470EF8DC9591ACD200DEA4A679BDA34F3587D92DF069E7CA17D1
            F37052417556A53A4BC4E9161464FB9C64624FEEB66A71A48450274573B3478B
            7ED3E3AA8010A6D3C4DD641226297E77F688CD4D10F12236FBD5EE3CFFD7707D
            CF055866B7805D5DD5D0CA05CBF725FD6B6DDED8FBF507784EA1F2B4CA595E69
            B37C50232284CBFE6AAFCAA5DB9CBA25B2655D433B5BA14008D3695CFEA1DD31
            8FDF9DFD3AB9F93A9EAE580A21CFFF35E4973CE77D73B3C4EC3299262EA2CF95
            014FFD5328652A6D79A51A299623574408E74747A9CFD824455126531C10C214
            444EF92A33FFD05EB017BFBB4F3A25375FC75BD86B29843CFFD7B006CBB3EEDC
            6C1FEB7F12BD14E68DB9299CEAD9BAA575E797FDADAD7D09890896CB07352275
            2B91B5AD68629AAA294008536856994C6AD97AFCEEECD7C97D057626D04608D9
            D3B459D195A77F931B0EB2DBB9598BE8B34EAAA29886E2BFD65D5F150C6D95E3
            525A3DADFA82F623574A086D92A25103D3540D024298A471F987D4745CFCEEEC
            DD98725F81176059FAA43CFFD77071CF70D0BCD9075BB69BB5889E9C89F1679E
            D3DD49AD7FA0FFF5DCFD35F1E487EE00A96532FA7C8CD94B97E3F24032DC3570
            5BEB8F37B9FA16BAD0C9DE2F1111429BA4682477187D436BB28A064298A459CB
            7452A390F8DDD9B362B9F93AB6C7609909E4F9BF5972E5393B989BBC62779B06
            79E8F177A48FD873FF7DF6EB1F5C89271B12213E29D6C491977267A6C9C358B2
            73877DDBE69E3E686E101E74BBF613C75269569AAA714008933428FF903536E2
            7767672F735FA1D005736CFF372B2FEA6947729F99D76D9AB2889EB46774CF93
            2A4BD9B375CB92C71E2DB4B427DE69136E532224CD857E7DF9B1176D9446250C
            9C5673FA0BA165F429B59AAB5949F83281107E8606ED669B65D91377E78DD55C
            03EDB360CE6634F274CB106B7AEED66FAEEA2CE220A7FAA0778D5908B076EF2A
            B46393144D1C3E12AF90F2F7EA28EAEA3FFC8239C96F73FA603B9E4268BF3252
            A44CA65949F89281107E86A6EC666BD089C4DD798597B943943D326D6220B6FF
            9B15C57A2E43CEFDA0EC6E53FF091BBDD6BBB863E24968E7AE5EBBF1FEC599F3
            1712B3DDF1DEE2F311737D53CB5DB613786ED46799148D84D254E649EEC08110
            7E4A53CA64CCD152E2EE3C1B9DEB17B347A68D97C0535983B1F3CC8B9A3F283B
            8B5BF3091B7247C69E1AF25FBEED838E98F53A0AF6A5CC33D32A61E03AA3E123
            84F6594A91DD64A266AE552D0D08E1A7884C47175D26637EC8F6D1CE10C2DC62
            169F916933FE792A6BD0151F873AB735D8DDA6CE8689B789B638BA89445235E6
            E34D18F3B56C2174DA2E4E643719D7603734208437913A83B7D032995C9BDB7E
            7786052962735185CD2C053BC0CA32739E8506E6D628A874963E74CF03F75755
            D7203223E58FB6DD22E7C044D962C0289351F084D029292A95A66A5071722540
            086F2232F88B2B93D1657BE6BBB7BBB4AEA295EB17FB58259BD1C8F37F0D12EB
            B3002B57B98B38E858052895C48B7548876AF4327391548DA27D27075E998C82
            27844E532722ABB99A529C5C2110C29B884C471734EB6379E4696ABEC5D588E4
            BE02DB2AD9248DD9FEAFA110C0A712D81C25B0B308667DA5AEB850F45FFAF461
            4DD2A18A7813898C4D45BBFFA1FA332F73C85029D7B8D3B3DA5951F3D9E83A00
            215C406AD78622CA64C83C8D1F3C64B39573AA4BEB3A56CDAFE093A8B1991D64
            2FF63004E23E3EB5B9AAB38845F474CDEBAFBE5EC961CE93478FF9DB5C29B460
            482DA153243A2163379938AE1DC0B5804064355784E5831640081710998E2EA2
            4CC6FEB0B7AC3927A7B154DC769A96D5013CFFD7ECF0B2E5CA7C59763868C853
            A9DA48D28032CBDCCD3B685785F6EAA49C544542129C0E5D6A47D6CB6C47A444
            08CB076D8010D6773ADAC949CFBABBD3949E59AED80D458666C5A913B9210EDB
            FF35DB17B6109AFD68F6650DC93172C8E646464A3EC3D232DF5026F14465A142
            E874E8523B4E7DC035292A552254CE81C64D07422833152F5E26E334C6CC93E1
            F661965951780D65BF169B77985FEEF20676695FC927D1AB45296566B1EA960E
            D5C44F639015C2780F676C2E9AC0BE6B31824EA912A13AAFD2A90FA10BA1D4AA
            09C1E96846AACAECF4598E28B3456087839647CCB0FDDF5C779E2784E66D38C4
            D3ADAA1FF66CDD528EF35ECF74A822D10F6585305E35AAC241CBFE998A7D3770
            4D8A4AA5A970FAA025A10BA1D489625265325987BD99313B7D96A644444D13D8
            279D78D72F6E61A2A149956653A4CBF09FB22E4B566FEECA88FDF2321FEA990E
            D52452885292107D36E3AA06BEE791C896D683B1B799945DC2B66A96042D8452
            E1A094DB3575EAF4C4A1C3AECF6333986D66DD0DAE31CF18D9AB20BB32D066DE
            85F1F0E662FA8FEFDED2DABCE9C6C50FA5B6EC518B11CB39C0B2B6E9504DBBAF
            20B284208A754835F0E98715A74FFAA40D6DE48AA1B55276296AC266B6352168
            219472BB44CA64D84BB36DEE6E9378349C1ACF08D79CDA84FD212CC7B9EBECA3
            E1E1E933DDF8E022F93D8C674E7535D44C55399E3BBB8F9546AA0B22325B164F
            1EA82A71FF36CFED031DFD7D0CAD95B24BD856CD9E708550CAEDF22F93F14955
            D9EF1961AEC93404B5AEA9457AA46543FB9DE65DC43717757AF776B2F4558553
            CAB4B96E4594FAA5948352C27A675ECABD7C527D059169425D85A43E9C8848E4
            2A16436B05C3416CAB664FB84228E576795AB1D28E348B8CDBC819DEC2693113
            096ADF8121A7145F41AB26E29071B9FAD023965A9BE513A8359D7DDF7D5ED953
            57EBDCDEC2EA82ADCD1B8B56415ECABD7C0C33BE9E2B7DB52428CFC369B74F03
            E6C1CB9B8014DC4F0E79517B021542A9353A9147990C99A7C9978E79EE1DE55A
            1B9DA58559936D4E2A45AABC6CDFB75CC71E6FD5B0AB95B13F3123D5B7504BDD
            97EEDD1377B19DE6AE12B14E692A58FF74A8C6103FF9C449DA05516D4E3F489D
            AD6810425E5254B04416F5A24E842884965B77DAC0EB6DA42ED36FFDD47FCF08
            9ECB99AA6DA942686F7DC8C55EF6ECD38C05706C8F84B1DECED2D76E6F0AD561
            7AB73F9C48343945F3F10756EE48D12B9D9B920ED5982318FB5D9612A876D62E
            A0CF7A8904860EC0488AB25F3015CF82D8D0084E0865ABE6ECB3F064956EFCFB
            7FD09F33E7DF95DA41983D07408EE7F833CFC51B2135356A13AB91049272B0A7
            22788920F620B7B95D4208D556D4A9EFE8947155E6985A7EEAC4C9D9E14BAED3
            A8AE34251DAAB19962F0970AD969B32C2164F44FD269BA94ECF72AA70E7971B0
            9885908CF8EC7FFF0FFD303F3A3A3B7C796E64844448B6AB9175EBE8EF6FFFFB
            F9B1B1D94B97F56314F1769E47AB240EDC699F35C9D50C8A86DB8324D767E0AD
            9AF0D97E25378CD31BC291D99D7AE587D467F4BC603B0CD34C16BFEFC050A193
            370D4A876A2CBFA9CD7964A9500FEF3FFC82AC30A4F6A5DCEA39EA337357AF45
            BFB34BE415DDB8F861112E0B3D49CFD62D5D03B7757E7E75E72D2B208A0616A7
            10CAEE46514F44126BD450D7CFBCA6E4B0B569C3B2FDFBC899A5813AF13747B3
            6C0DE9048DAE9E7BEFF1DFB7895728E49FF331BFA086ECC882D2EFDE65162DFB
            ABB5366F5CFAC4EEA2F7BB6A62E777DDE74C05D69672E8EFB16591DA810DA957
            A9023D7F701E4582C52984C0898584EDCFFF85DCD2B9918F12C6858C48C7F2E5
            64A73A57ADEA5E3FD8FACA7AC15086B7505A6A0CD39B4EFFEC9FC80998BB32A2
            D39B24575D6B07C88926B9724A5D92699EFEC95B890654ADD73DB8AE6BED6D85
            2642C3447D41FA736E64243E15BAD05D57AFA23FE93B8A786C60D1032104D5C0
            5B358123460100E2400841353016D1F34AD20100C00C8410F099397BAEE3D65B
            19CA64BFAA2F0E7610060014018410B8A126C33E9998F9349E73AD47602CA2C7
            BA2800404140088103E6BA7CCB0A7546592392A20080E28010025B6C56A3DB9C
            47CF08070577030100800410426085FD1228F38262463858F456640080C08110
            827C5CCFB63554B5B8868338530D0050341042908FEB965D59852DAEE1A0DEED
            ACEA0600002C662084201FC6AC5EEA79F74E27C543050100E5002104F9FCFA0B
            6B5D7FA55D089D8E74870A02004A034208F27115C2F63D94D5C1B6963B8B4205
            010065022104F938A534A3B41D41EDAF00150400940C8410E4E37A7C6EE28008
            FB5A9B12CEEA030080041042908F53B56762D99FFD2913D84A14005009104260
            8565E16822296AA9A05D036B2810C409DA00804A8010022B72AB5D3A57AD5CB2
            73477CDFED99B3E746F73C692E90E9E8EFA3DF42200800A8100821B0A55DD848
            FC7AB66E493DB97EF2D8F1C9A3C70C2A4812B87060C5EE5D98110400540B8410
            384071E1D8BEFDBAFE33752FECB95FFE6AECA9A1990BEF655DC4F5CC26000028
            1408217086A2BDA91FBC3C37F2517C6E8FF46FFAECB999F3EF66D59776DFB1AE
            B56943CFBDF7E034250040AD801002263367CF4D9F7D6776F8D2DCC848628D60
            477F5FD7DA01FAA17B705DE7AA95DDB7FF110A610000B5054208000020682084
            0000008206420800002068208400000082064208000020682084000000820642
            0800002068208400000082064208000020682084000000820642080000206820
            8400000082064208000020682084000000820642080000206820840000008206
            42080000206820840000008206420800002068208400000082E6FF012D496D3A
            38B22E7D0000000049454E44AE426082}
        end
      end
      inherited ReportSummary1: TfrxReportSummary
        Top = 438.425480000000000000
        inherited Memo7: TfrxMemoView
          Top = 3.779527560000020000
        end
        inherited SysMemo1: TfrxSysMemoView
          Top = 3.779530000000020000
        end
      end
    end
  end
  inherited DBDS: TfrxDBDataset
    FieldAliases.Strings = (
      'PRO_CODIGO=PRO_CODIGO'
      'PRO_DESCRICAO=PRO_DESCRICAO'
      'PRO_SITUACAO=PRO_SITUACAO'
      'PRO_DATACADASTRO=PRO_DATACADASTRO'
      'PRO_GRUPO=PRO_GRUPO'
      'PRO_UNIDADE=PRO_UNIDADE'
      'PRO_CODIGODEBARRAS=PRO_CODIGODEBARRAS'
      'PRO_CUSTOMEDIO=PRO_CUSTOMEDIO'
      'PRO_MARGEMLUCRO=PRO_MARGEMLUCRO'
      'PRO_PRECOVENDA=PRO_PRECOVENDA'
      'PRO_CONTROLAESTOQUE=PRO_CONTROLAESTOQUE'
      'GRU_DESCRICAO=GRU_DESCRICAO'
      'UNI_UNIDADE=UNI_UNIDADE')
  end
  inherited Q: TFDQuery
    SQL.Strings = (
      
        'SELECT PRO_CODIGO, PRO_DESCRICAO, PRO_SITUACAO, PRO_DATACADASTRO' +
        ','
      'PRO_GRUPO, PRO_UNIDADE, PRO_CODIGODEBARRAS, PRO_ESTOQUEMINIMO,'
      
        'PRO_CUSTOMEDIO, PRO_MARGEMLUCRO, PRO_PRECOVENDA, PRO_CONTROLAEST' +
        'OQUE,'
      'GRU_DESCRICAO, UNI_UNIDADE FROM PRODUTO'
      'INNER JOIN GRUPO ON (GRU_CODIGO = PRO_GRUPO)'
      'INNER JOIN UNIDADE ON (UNI_UNIDADE = PRO_UNIDADE)')
  end
end

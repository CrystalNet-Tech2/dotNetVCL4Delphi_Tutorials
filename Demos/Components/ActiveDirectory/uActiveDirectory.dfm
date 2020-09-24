object frmAD: TfrmAD
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Querying Active Directory'
  ClientHeight = 641
  ClientWidth = 686
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grpForm: TGroupBox
    Left = 8
    Top = 8
    Width = 329
    Height = 89
    Caption = 'Credentials'
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 52
      Height = 13
      Caption = 'Username:'
    end
    object Label2: TLabel
      Left = 26
      Top = 51
      Width = 50
      Height = 13
      Caption = 'Password:'
    end
    object txtUsername: TEdit
      Left = 88
      Top = 21
      Width = 215
      Height = 21
      TabOrder = 0
    end
    object txtPassword: TEdit
      Left = 88
      Top = 48
      Width = 215
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 343
    Top = 8
    Width = 335
    Height = 89
    Caption = 'Domain'
    TabOrder = 1
    object Label3: TLabel
      Left = 112
      Top = 24
      Width = 156
      Height = 13
      Caption = 'Domain / Global Catalog Address'
    end
    object txtAddress: TEdit
      Left = 16
      Top = 48
      Width = 297
      Height = 21
      TabOrder = 0
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 103
    Width = 670
    Height = 105
    Caption = 'Search User'
    TabOrder = 2
    object Label4: TLabel
      Left = 24
      Top = 40
      Width = 187
      Height = 13
      Caption = 'Enter a Username/Email ID for search :'
    end
    object txtSearchUser: TEdit
      Left = 217
      Top = 37
      Width = 440
      Height = 21
      TabOrder = 0
    end
    object btnSearchUserName: TButton
      Left = 582
      Top = 64
      Width = 75
      Height = 25
      Caption = '&Search'
      TabOrder = 1
      OnClick = btnSearchUserNameClick
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 214
    Width = 670
    Height = 301
    Caption = 'User Information'
    TabOrder = 3
    object pnlBlock: TPanel
      Left = 2
      Top = 15
      Width = 666
      Height = 284
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object lblCity: TLabel
        Left = 68
        Top = 248
        Width = 23
        Height = 13
        Caption = 'City:'
      end
      object lblCompany: TLabel
        Left = 42
        Top = 216
        Width = 49
        Height = 13
        Caption = 'Company:'
      end
      object lblCountry: TLabel
        Left = 416
        Top = 56
        Width = 43
        Height = 13
        Caption = 'Country:'
      end
      object lblEmailId: TLabel
        Left = 49
        Top = 152
        Width = 42
        Height = 13
        Caption = 'Email ID:'
      end
      object lblFirstname: TLabel
        Left = 39
        Top = 56
        Width = 52
        Height = 13
        Caption = 'FirstName:'
      end
      object lblLastName: TLabel
        Left = 37
        Top = 120
        Width = 54
        Height = 13
        Caption = 'Last Name:'
      end
      object lblMiddleName: TLabel
        Left = 27
        Top = 88
        Width = 64
        Height = 13
        Caption = 'Middle Name:'
      end
      object lblPostal: TLabel
        Left = 406
        Top = 88
        Width = 53
        Height = 13
        Caption = 'Post Code:'
      end
      object lblState: TLabel
        Left = 429
        Top = 24
        Width = 30
        Height = 13
        Caption = 'State:'
      end
      object lblTelephone: TLabel
        Left = 385
        Top = 120
        Width = 74
        Height = 13
        Caption = 'Telephone No.:'
      end
      object lblTitle: TLabel
        Left = 67
        Top = 184
        Width = 24
        Height = 13
        Caption = 'Title:'
      end
      object lblUsernameDisplay: TLabel
        Left = 38
        Top = 24
        Width = 53
        Height = 13
        Caption = 'UserName:'
      end
      object btnClearValues: TButton
        Left = 544
        Top = 248
        Width = 111
        Height = 25
        Caption = 'Clear Values'
        TabOrder = 0
        OnClick = btnClearValuesClick
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 521
    Width = 670
    Height = 112
    Caption = 'Update User Information'
    TabOrder = 4
    object Label5: TLabel
      Left = 39
      Top = 24
      Width = 52
      Height = 13
      Caption = 'FirstName:'
    end
    object Label6: TLabel
      Left = 27
      Top = 52
      Width = 64
      Height = 13
      Caption = 'Middle Name:'
    end
    object Label7: TLabel
      Left = 37
      Top = 79
      Width = 54
      Height = 13
      Caption = 'Last Name:'
    end
    object txtFirstName: TEdit
      Left = 114
      Top = 21
      Width = 367
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object txtMiddleName: TEdit
      Left = 114
      Top = 48
      Width = 367
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object txtLastName: TEdit
      Left = 114
      Top = 75
      Width = 367
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object btnCommitChanges: TButton
      Left = 520
      Top = 72
      Width = 137
      Height = 25
      Caption = 'Commit Changes'
      TabOrder = 3
      OnClick = btnCommitChangesClick
    end
  end
  object CnDirectorySearcher1: TCnDirectorySearcher
    ClientTimeout = '-00:00:01'
    ServerPageTimeLimit = '-00:00:01'
    ServerTimeLimit = '-00:00:01'
    Left = 306
    Top = 405
  end
  object CnDirectoryEntry1: TCnDirectoryEntry
    Left = 336
    Top = 264
  end
end

object frmSendEmail: TfrmSendEmail
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Email Sender'
  ClientHeight = 517
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 42
    Top = 16
    Width = 28
    Height = 13
    Caption = 'From:'
  end
  object Label2: TLabel
    Left = 54
    Top = 43
    Width = 16
    Height = 13
    Caption = 'To:'
  end
  object Label3: TLabel
    Left = 30
    Top = 70
    Width = 40
    Height = 13
    Caption = 'Subject:'
  end
  object Label4: TLabel
    Left = 21
    Top = 120
    Width = 49
    Height = 13
    Caption = 'Mail Body:'
  end
  object Label5: TLabel
    Left = 34
    Top = 283
    Width = 36
    Height = 13
    Caption = 'Attach:'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 320
    Width = 521
    Height = 145
    Caption = 'Smtp Client'
    TabOrder = 0
    object Label6: TLabel
      Left = 36
      Top = 31
      Width = 26
      Height = 13
      Caption = 'Host:'
    end
    object Label7: TLabel
      Left = 36
      Top = 84
      Width = 26
      Height = 13
      Caption = 'User:'
    end
    object Label8: TLabel
      Left = 14
      Top = 111
      Width = 48
      Height = 13
      Caption = 'Passeord:'
    end
    object Label9: TLabel
      Left = 38
      Top = 57
      Width = 24
      Height = 13
      Caption = 'Port:'
    end
    object txtHost: TEdit
      Left = 66
      Top = 28
      Width = 437
      Height = 21
      TabOrder = 0
      Text = 'smtp.email.com'
    end
    object txtUser: TEdit
      Left = 66
      Top = 81
      Width = 437
      Height = 21
      TabOrder = 1
      Text = 'authenticationUser'
    end
    object txtPassword: TEdit
      Left = 66
      Top = 108
      Width = 437
      Height = 21
      PasswordChar = '*'
      TabOrder = 2
      Text = 'password'
    end
    object txtPort: TEdit
      Left = 66
      Top = 54
      Width = 437
      Height = 21
      TabOrder = 3
      Text = '456'
    end
  end
  object btnSendEmail: TButton
    Left = 366
    Top = 471
    Width = 145
    Height = 31
    Caption = 'Send Email'
    TabOrder = 1
    OnClick = btnSendEmailClick
  end
  object txtFrom: TEdit
    Left = 76
    Top = 13
    Width = 437
    Height = 21
    TabOrder = 2
    Text = 'author@email.com'
  end
  object txtTo: TEdit
    Left = 76
    Top = 40
    Width = 437
    Height = 21
    TabOrder = 3
    Text = 'receiver@email.com'
  end
  object txtSubject: TEdit
    Left = 76
    Top = 67
    Width = 437
    Height = 21
    TabOrder = 4
    Text = 'This is the mail subject'
  end
  object rtxtMailBody: TRichEdit
    Left = 74
    Top = 117
    Width = 437
    Height = 157
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'This is the body of the mail')
    ParentFont = False
    TabOrder = 5
  end
  object txtAttachment: TEdit
    Left = 74
    Top = 280
    Width = 344
    Height = 21
    TabOrder = 6
  end
  object btnBrowse: TButton
    Left = 424
    Top = 278
    Width = 87
    Height = 25
    Caption = 'Browse'
    TabOrder = 7
    OnClick = btnBrowseClick
  end
  object chkEnableSSL: TCheckBox
    Left = 8
    Top = 478
    Width = 97
    Height = 17
    Caption = 'Enable SSL'
    TabOrder = 8
  end
  object CnOpenFileDialog1: TCnOpenFileDialog
    Filter = 'All File (*.*)|*.*'
    Left = 432
    Top = 328
  end
  object CnSmtpClient1: TCnSmtpClient
    TargetName = 'SMTPSVC/'
    Left = 288
    Top = 320
  end
end

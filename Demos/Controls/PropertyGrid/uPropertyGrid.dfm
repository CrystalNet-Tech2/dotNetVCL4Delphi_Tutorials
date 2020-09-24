object Form30: TForm30
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = '.Net PropertyGrid control in Delphi'
  ClientHeight = 502
  ClientWidth = 540
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  DesignSize = (
    540
    502)
  PixelsPerInch = 96
  TextHeight = 13
  object CnComboBox1: TCnComboBox
    Left = 199
    Top = 16
    Width = 333
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Location.X = 199
    Location.Y = 16
    Size.Width = 333
    TabOrder = 0
    DropDownStyle = cbsDropDownList
    DropDownWidth = 333
    OnSelectedIndexChanged = CnComboBox1SelectedIndexChanged
  end
  object CnPropertyGrid1: TCnPropertyGrid
    Left = 199
    Top = 43
    Width = 333
    Height = 451
    Anchors = [akLeft, akTop, akRight, akBottom]
    Location.X = 199
    Location.Y = 43
    Size.Width = 333
    Size.Height = 451
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 185
    Height = 486
    Anchors = [akLeft, akTop, akBottom]
    Caption = 'Controls'
    TabOrder = 2
    object CnButton1: TCnButton
      Left = 32
      Top = 32
      Width = 97
      Height = 25
      Location.X = 32
      Location.Y = 32
      Size.Width = 97
      Size.Height = 25
      TabOrder = 0
      Text = 'CnButton1'
    end
    object CnCheckBox1: TCnCheckBox
      Left = 32
      Top = 80
      Width = 110
      Height = 17
      Location.X = 32
      Location.Y = 80
      Size.Width = 110
      Size.Height = 17
      TabOrder = 1
      Text = 'CnCheckBox1'
    end
    object CnDateTimePicker1: TCnDateTimePicker
      Left = 32
      Top = 120
      Width = 138
      Height = 20
      Location.X = 32
      Location.Y = 120
      Size.Width = 138
      TabOrder = 2
      Value = 43424.808260231480000000
    end
    object CnLabel1: TCnLabel
      Left = 32
      Top = 160
      Width = 65
      Height = 16
      Location.X = 32
      Location.Y = 160
      Size.Width = 65
      Size.Height = 16
      TabOrder = 3
      ImageIndex = -1
      Text = 'CnLabel1'
    end
    object CnLinkLabel1: TCnLinkLabel
      Left = 32
      Top = 200
      Width = 85
      Height = 16
      Location.X = 32
      Location.Y = 200
      Size.Width = 85
      Size.Height = 16
      TabOrder = 4
      ImageIndex = -1
      Text = 'CnLinkLabel1'
    end
    object CnComboBox2: TCnComboBox
      Left = 32
      Top = 240
      Width = 138
      Height = 21
      Location.X = 32
      Location.Y = 240
      Size.Width = 138
      TabOrder = 5
      DropDownWidth = 138
      Text = 'CnComboBox2'
    end
    object CnProgressBar1: TCnProgressBar
      Left = 32
      Top = 296
      Width = 138
      Height = 25
      Location.X = 32
      Location.Y = 296
      Size.Width = 138
      Size.Height = 25
      TabOrder = 6
    end
    object CnTextBox1: TCnTextBox
      Left = 32
      Top = 344
      Width = 115
      Height = 20
      Location.X = 32
      Location.Y = 344
      Size.Width = 115
      TabOrder = 7
      Text = 'CnTextBox1'
    end
    object CnRadioButton1: TCnRadioButton
      Left = 32
      Top = 384
      Width = 115
      Height = 17
      Location.X = 32
      Location.Y = 384
      Size.Width = 115
      Size.Height = 17
      TabOrder = 8
      Text = 'CnRadioButton1'
    end
  end
end

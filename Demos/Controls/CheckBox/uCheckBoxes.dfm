object Form13: TForm13
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = '.Net CheckBox in Delphi'
  ClientHeight = 279
  ClientWidth = 483
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CnCheckBox6: TCnCheckBox
    Left = 87
    Top = 167
    Width = 138
    Height = 17
    Location.X = 87
    Location.Y = 167
    Size.Width = 138
    Size.Height = 17
    TabOrder = 0
    Text = 'CnCheckBox6'
    CheckAlign = caMiddleRight
  end
  object CnCheckBox3: TCnCheckBox
    Left = 87
    Top = 137
    Width = 110
    Height = 17
    Location.X = 87
    Location.Y = 137
    Size.Width = 110
    Size.Height = 17
    TabOrder = 1
    FlatStyle = fsPopup
    Text = 'Popup CheckBox'
  end
  object CnCheckBox1: TCnCheckBox
    Left = 87
    Top = 102
    Width = 138
    Height = 29
    Location.X = 87
    Location.Y = 102
    Size.Width = 138
    Size.Height = 29
    TabOrder = 2
    Image.RawFormat = ifPng
    Image.Data = {
      6956424F5277304B47676F414141414E53556845556741414142414141414151
      4341594141414166382F3968414141414247644254554541414C4750432F7868
      4251414141416C7753466C7A0D0A4141414F7777414144734D4278322B6F5A41
      414141516C4A524546554F452B64557A304B776A41597A524563504944674254
      79434678446356636771754C7336753769364F547136435337320D0A43426B38
      67434349554A564B30517169784C796168435439774F7144422B333366767233
      6C595849736F7772526F6F7949475A6332347051596B3152704F75566A447374
      756138796A3568420D0A677764654866744168354E6A76317349686A774E4279
      684A76424A314969425141597136524A67777836315252674E4B30342F445552
      42527A77776155426F79794B4C414532377A6D6277760D0A462F4C6361387648
      527554454D57625158432B7968594A76634C316B51647873324B73626D4C7541
      356E724A416842473448564A63674A6847445146336B7338314373326C493548
      4F51484D0D0A6F426D662B784B397A776A54645471527A3933577A6E434D6D56
      7467503650654256466D4377323952514C555362374B5A626152584756416C2F
      7A334D376C5134672B2F4D324E7641504A6E0D0A686234487A39414141414141
      5355564F524B35435949493D}
    ImageAlign = caMiddleRight
    Text = 'CheckBox with Icon'
  end
  object CnCheckBox2: TCnCheckBox
    Left = 87
    Top = 79
    Width = 123
    Height = 17
    Location.X = 87
    Location.Y = 79
    Size.Width = 123
    Size.Height = 17
    TabOrder = 3
    BackColor.HexCode = 'Transparent'
    BackColor.Name = 'Transparent'
    Text = 'Normal CheckBox'
    UseVisualStyleBackColor = False
  end
  object CnCheckBox4: TCnCheckBox
    Left = 87
    Top = 47
    Width = 122
    Height = 17
    Location.X = 87
    Location.Y = 47
    Size.Width = 122
    Size.Height = 17
    TabOrder = 4
    BackColor.HexCode = 'PaleTurquoise'
    BackColor.Name = 'PaleTurquoise'
    FlatAppearance.CheckedBackColor.HexCode = 'CadetBlue'
    FlatAppearance.CheckedBackColor.Name = 'CadetBlue'
    FlatAppearance.MouseOverBackColor.HexCode = 'SeaGreen'
    FlatAppearance.MouseOverBackColor.Name = 'SeaGreen'
    FlatStyle = fsFlat
    Text = 'Flat CheckBox'
    UseVisualStyleBackColor = False
  end
  object CnCheckBox5: TCnCheckBox
    Left = 255
    Top = 47
    Width = 178
    Height = 17
    Location.X = 255
    Location.Y = 47
    Size.Width = 178
    Size.Height = 17
    TabOrder = 5
    BackColor.HexCode = 'Transparent'
    BackColor.Name = 'Transparent'
    Text = 'OnCheckedChange Event'
    UseVisualStyleBackColor = False
    OnCheckedChanged = CnCheckBox5CheckedChanged
  end
  object CnCheckBox7: TCnCheckBox
    Left = 255
    Top = 70
    Width = 178
    Height = 17
    Location.X = 255
    Location.Y = 70
    Size.Width = 178
    Size.Height = 17
    TabOrder = 6
    BackColor.HexCode = 'Transparent'
    BackColor.Name = 'Transparent'
    Text = 'OnCheckStateChanged Event'
    UseVisualStyleBackColor = False
    ThreeState = True
    OnCheckStateChanged = CnCheckBox7CheckStateChanged
  end
  object CnCheckBox8: TCnCheckBox
    Left = 255
    Top = 93
    Width = 123
    Height = 17
    Location.X = 255
    Location.Y = 93
    Size.Width = 123
    Size.Height = 17
    TabOrder = 7
    BackColor.HexCode = 'Transparent'
    BackColor.Name = 'Transparent'
    Text = 'OnClick Event'
    UseVisualStyleBackColor = False
    OnClick = CnCheckBox8Click
  end
  object CnCheckBox9: TCnCheckBox
    Left = 87
    Top = 190
    Width = 138
    Height = 29
    Location.X = 87
    Location.Y = 190
    Size.Width = 138
    Size.Height = 29
    TabOrder = 8
    BackColor.HexCode = 'Transparent'
    BackColor.Name = 'Transparent'
    Text = 'Appearance as Button'
    UseVisualStyleBackColor = False
    Appearance = appButton
  end
end

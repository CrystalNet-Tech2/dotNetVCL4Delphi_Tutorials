object Form19: TForm19
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = '.Net MaskedTextBox control in Delphi'
  ClientHeight = 268
  ClientWidth = 311
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CnMaskedTextBox1: TCnMaskedTextBox
    Left = 56
    Top = 32
    Width = 185
    Height = 20
    Location.X = 56
    Location.Y = 32
    Size.Width = 185
    TabOrder = 0
    Text = 'CnMaskedTextBox1'
  end
  object CnMaskedTextBox2: TCnMaskedTextBox
    Left = 56
    Top = 58
    Width = 185
    Height = 20
    Location.X = 56
    Location.Y = 58
    Size.Width = 185
    TabOrder = 1
    Text = 'CnMaskedTextBox2'
    PasswordChar = #9679
    UseSystemPasswordChar = True
  end
  object CnMaskedTextBox3: TCnMaskedTextBox
    Left = 56
    Top = 84
    Width = 185
    Height = 20
    Location.X = 56
    Location.Y = 84
    Size.Width = 185
    TabOrder = 2
    Text = 'CnMaskedTextBox3'
    PasswordChar = '$'
    TextAlign = haCenter
    TextMaskFormat = mfIncludePrompt
  end
  object CnMaskedTextBox4: TCnMaskedTextBox
    Left = 56
    Top = 110
    Width = 185
    Height = 20
    Location.X = 56
    Location.Y = 110
    Size.Width = 185
    TabOrder = 3
    Text = #163'   ,   .'
    BeepOnError = True
    Mask = '$999,999.00'
  end
  object CnMaskedTextBox5: TCnMaskedTextBox
    Left = 56
    Top = 136
    Width = 185
    Height = 20
    Location.X = 56
    Location.Y = 136
    Size.Width = 185
    TabOrder = 4
    Text = '(   )-   -'
    BeepOnError = True
    Mask = '(999)-000-0000'
  end
  object CnMaskedTextBox6: TCnMaskedTextBox
    Left = 56
    Top = 162
    Width = 185
    Height = 20
    Location.X = 56
    Location.Y = 162
    Size.Width = 185
    TabOrder = 5
    Text = '  /  /'
    BeepOnError = True
    Mask = '00/00/0000'
  end
  object CnMaskedTextBox7: TCnMaskedTextBox
    Left = 56
    Top = 200
    Width = 185
    Height = 20
    Location.X = 56
    Location.Y = 200
    Size.Width = 185
    TabOrder = 6
    BackColor.HexCode = 'LightPink'
    BackColor.Name = 'LightPink'
    Font.Style = [fsRegular, fsBold]
    ForeColor.HexCode = 'DarkGreen'
    ForeColor.Name = 'DarkGreen'
    Text = 'CnMaskedTextBox7'
    AsciiOnly = True
    CutCopyMaskFormat = mfIncludePromptAndLiterals
    InsertKeyMode = ikmInsert
    TextAlign = haRight
  end
end

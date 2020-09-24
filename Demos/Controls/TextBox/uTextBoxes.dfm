object Form27: TForm27
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = '.Net TextBox control in Delphi'
  ClientHeight = 213
  ClientWidth = 262
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CnTextBox1: TCnTextBox
    Left = 32
    Top = 24
    Width = 201
    Height = 22
    Location.X = 32
    Location.Y = 24
    Size.Width = 201
    Size.Height = 22
    TabOrder = 0
    BackColor.HexCode = 'highlight'
    BackColor.Name = 'HotTrack'
    Font.Name = 'Tahoma'
    Font.Size = 9.000000000000000000
    Font.Style = [fsBold]
    ForeColor.HexCode = 'Chartreuse'
    ForeColor.Name = 'Chartreuse'
    Text = 'CnTextBox1'
  end
  object CnTextBox2: TCnTextBox
    Left = 32
    Top = 56
    Width = 201
    Height = 20
    Location.X = 32
    Location.Y = 56
    Size.Width = 201
    TabOrder = 1
    OnTabIndexChanged = CnTextBox2TabIndexChanged
    Font.Style = [fsRegular, fsBold]
    ForeColor.HexCode = 'SaddleBrown'
    ForeColor.Name = 'SaddleBrown'
    Text = '1'#13#10'2'#13#10'3'#13#10'4'
    OnTextChanged = CnTextBox2TextChanged
    Lines.Strings = (
      '1'
      '2'
      '3'
      '4')
    Multiline = True
  end
  object CnTextBox3: TCnTextBox
    Left = 32
    Top = 163
    Width = 202
    Height = 20
    Location.X = 32
    Location.Y = 163
    Size.Width = 202
    TabOrder = 2
    Text = 'CnTextBox3'
    PasswordChar = #9679
    UseSystemPasswordChar = True
  end
  object CnTextBox4: TCnTextBox
    Left = 32
    Top = 111
    Width = 202
    Height = 20
    Location.X = 32
    Location.Y = 111
    Size.Width = 202
    TabOrder = 3
    Text = 'CnTextBox4'
    TextAlign = haCenter
  end
  object CnTextBox5: TCnTextBox
    Left = 32
    Top = 85
    Width = 202
    Height = 20
    Location.X = 32
    Location.Y = 85
    Size.Width = 202
    TabOrder = 4
    Text = 'CnTextBox5'
    PasswordChar = '*'
  end
  object CnTextBox6: TCnTextBox
    Left = 33
    Top = 137
    Width = 201
    Height = 20
    Location.X = 33
    Location.Y = 137
    Size.Width = 201
    TabOrder = 5
    Text = 'CnTextBox6'
    TextAlign = haRight
  end
end

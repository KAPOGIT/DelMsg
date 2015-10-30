object Form1: TForm1
  Left = 219
  Top = 140
  Width = 185
  Height = 146
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 157
    Height = 26
    Alignment = taCenter
    Caption = 'Cliquez sur le bouton pour lancer un logiciel quelconque.'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 8
    Top = 96
    Width = 162
    Height = 13
    Caption = 'http://www.ifrance.com/patoche/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object Button1: TButton
    Left = 32
    Top = 56
    Width = 113
    Height = 25
    Caption = 'Charger'
    TabOrder = 0
    OnClick = Button1Click
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Fichiers exécutables - *.exe|*.exe'
    Top = 56
  end
end

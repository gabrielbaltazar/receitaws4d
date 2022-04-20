object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 441
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 27
      Height = 15
      Caption = 'CNPJ'
    end
    object edtCNPJ: TEdit
      Left = 16
      Top = 34
      Width = 137
      Height = 23
      TabOrder = 0
      Text = '53113791000122'
    end
    object btnSearch: TButton
      Left = 159
      Top = 33
      Width = 75
      Height = 25
      Caption = 'Search'
      TabOrder = 1
      OnClick = btnSearchClick
    end
    object mmoData: TMemo
      Left = 0
      Top = 72
      Width = 624
      Height = 369
      Align = alBottom
      Lines.Strings = (
        'mmoData')
      ScrollBars = ssBoth
      TabOrder = 2
    end
  end
end

object fmAddResult: TfmAddResult
  Left = 326
  Top = 174
  ActiveControl = cbGameName
  BorderStyle = bsDialog
  Caption = 'параметры результата'
  ClientHeight = 210
  ClientWidth = 289
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    289
    210)
  PixelsPerInch = 96
  TextHeight = 13
  object lbGameName: TLabel
    Left = 8
    Top = 8
    Width = 76
    Height = 13
    Caption = 'Название игры'
  end
  object lbPrefix: TLabel
    Left = 8
    Top = 140
    Width = 96
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Добавить префикс'
  end
  object Bevel: TBevel
    Left = 8
    Top = 168
    Width = 273
    Height = 2
    Anchors = [akLeft, akBottom]
    Shape = bsBottomLine
  end
  object cbGameName: TComboBox
    Left = 136
    Top = 8
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object rgAsResult: TRadioGroup
    Left = 8
    Top = 32
    Width = 273
    Height = 73
    Caption = 'Как результат добавлять'
    Enabled = False
    ItemIndex = 1
    Items.Strings = (
      'Место'
      'Ответов/Рейтинг')
    TabOrder = 1
  end
  object sePrefix: TSpinEdit
    Left = 136
    Top = 136
    Width = 145
    Height = 22
    Anchors = [akLeft, akBottom]
    Increment = 1000
    MaxValue = 0
    MinValue = 0
    TabOrder = 2
    Value = 0
  end
  object btAdd: TButton
    Left = 128
    Top = 176
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Добавить'
    Default = True
    ModalResult = 1
    TabOrder = 3
  end
  object btCancel: TButton
    Left = 208
    Top = 176
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Отменить'
    ModalResult = 2
    TabOrder = 4
  end
  object cbUseLevel: TCheckBox
    Left = 8
    Top = 112
    Width = 273
    Height = 17
    Caption = 'Перечитать информацию о лиге'
    TabOrder = 5
  end
end

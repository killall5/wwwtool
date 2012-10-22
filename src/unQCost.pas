unit unQCost;
(*
    WWWTool - "What? Where? When?" Tool -
    Инструмент для проведения игр рода "Что? Где? Когда?"
    Copyright (C) 2004-2007, Тамаревская Анна Георгиевна и Тамаревский Алексей

    This file is free software, and not subject to GNU Public License
    restrictions; you can redistribute it and/or modify it in any way
    you see fit. This file is suitable for inclusion in a derivative
    work, regardless of license on the work or availability of source code
    to the work. If you redistribute this file, you must leave this
    header intact.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

    С авторами данной программы можно связаться по адресу mirror@lyceum.nstu.ru.
*)
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin;

type
  TfmQCost = class(TForm)
    lb0: TLabel;
    se0: TSpinEdit;
    btOk: TButton;
    btCancel: TButton;
    se1: TSpinEdit;
    lb1: TLabel;
    se2: TSpinEdit;
    lb2: TLabel;
    lbDescription: TLabel;
    btStandard: TButton;
    procedure FormShow(Sender: TObject);
    procedure se0KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure se0Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmQCost: TfmQCost;

implementation

{$R *.dfm}

procedure TfmQCost.FormShow(Sender: TObject);
begin
  se0.SetFocus;
end;

procedure TfmQCost.se0KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    ((Sender as TControl).Parent as TForm).ModalResult:= mrOk
  else
    if Key = VK_ESCAPE then
      ((Sender as TControl).Parent as TForm).ModalResult:= mrCancel
end;

procedure TfmQCost.se0Change(Sender: TObject);
begin
  se1.Value:= - se0.Value

end;

end.

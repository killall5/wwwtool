unit unAddCommand;
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
  TfmAddCommand = class(TForm)
    lbComment: TLabel;
    lbComName: TLabel;
    cbComName: TComboBox;
    lbDesk: TLabel;
    seDesk: TSpinEdit;
    btOk: TButton;
    btCancel: TButton;
    cbCompetition: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure seDeskKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAddCommand: TfmAddCommand;

implementation

{$R *.dfm}

procedure TfmAddCommand.FormShow(Sender: TObject);
begin
  cbComName.SetFocus;
end;

procedure TfmAddCommand.seDeskKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    ((Sender as TControl).Parent as TForm).ModalResult:= mrOk
  else
    if Key = VK_ESCAPE then
      ((Sender as TControl).Parent as TForm).ModalResult:= mrCancel
end;

end.

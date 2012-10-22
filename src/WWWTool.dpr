program WWWTool;
(*
    WWWTool - "What? Where? When?" Tool -
    ���������� ��� ���������� ��� ���� "���? ���? �����?"
    Copyright (C) 2004-2007, ����������� ���� ���������� � ����������� �������

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

    � �������� ������ ��������� ����� ��������� �� ������ mirror@lyceum.nstu.ru.

    ��������� ������� Vit (vit@vingrad.ru) �� ��� Delphi Russian Knowledge Base.
*)
uses
  Forms,
  unMain in 'unMain.pas' {fmWWWTool},
  unSum in 'unSum.pas' {fmSum},
  unAddResult in 'unAddResult.pas' {fmAddResult},
  unAddCommand in 'unAddCommand.pas' {fmAddCommand},
  unPrintBlank in 'unPrintBlank.pas' {fmPrinter},
  unQCost in 'unQCost.pas' {fmQCost};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '';
  Application.CreateForm(TfmWWWTool, fmWWWTool);
  Application.CreateForm(TfmSum, fmSum);
  Application.CreateForm(TfmAddResult, fmAddResult);
  Application.CreateForm(TfmAddCommand, fmAddCommand);
  Application.CreateForm(TfmPrinter, fmPrinter);
  Application.CreateForm(TfmQCost, fmQCost);
  Application.Run;
end.

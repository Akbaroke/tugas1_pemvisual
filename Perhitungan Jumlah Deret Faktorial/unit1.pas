unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnHitung: TButton;
    edtDeret: TEdit;
    edtFaktorial: TEdit;
    edtJumlah: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure btnHitungClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

function HitungFaktorial(N: Integer): Integer;
begin
  if N <= 1 then
    Result := 1
  else
    Result := N * HitungFaktorial(N - 1);
end;

procedure TForm1.btnHitungClick(Sender: TObject);
var
  N, Faktorial, Jumlah: Integer;
  i: Integer;
begin
  // Mengambil nilai N dari Edit Box
  N := StrToIntDef(edtDeret.Text, 0);

  // Memastikan N tidak negatif
  if N < 0 then
  begin
    ShowMessage('Masukkan bilangan bulat non-negatif.');
    Exit;
  end;

  // Menghitung faktorial
  Faktorial := HitungFaktorial(N);
  edtFaktorial.Text := IntToStr(Faktorial);

  // Menghitung jumlah deret
  Jumlah := 0;
  for i := 1 to N do
    Jumlah := Jumlah + i;
  edtJumlah.Text := IntToStr(Jumlah);
end;

end.


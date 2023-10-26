unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    CBKode: TComboBox;
    EHarga: TEdit;
    ETotal: TEdit;
    ESubTotal: TEdit;
    EQTY: TEdit;
    ENama: TEdit;
    EDiskon: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure CBKodeChange(Sender: TObject);
    procedure EQTYChange(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.CBKodeChange(Sender: TObject);
var
  Harga: Double;
begin
  // Mengisi harga dan nama barang berdasarkan kode yang dipilih
  case CBKode.ItemIndex of
    0:
    begin
      ENama.Text := 'Speaker';
      EHarga.Text := '50000';
    end;
    1:
    begin
      ENama.Text := 'Mouse';
      EHarga.Text := '25000';
    end;
    2:
    begin
      ENama.Text := 'Harddisk';
      EHarga.Text := '750000';
    end;
    3:
    begin
      ENama.Text := 'Mouse Pad';
      EHarga.Text := '5000';
    end;
  end;
end;

procedure TForm1.EQTYChange(Sender: TObject);
var
  Qty, Harga, SubTotal, Diskon, Total: Double;
begin
  // Menghapus nilai jika EQTY kosong
  if EQTY.Text = '' then
  begin
    ESubTotal.Clear;
    EDiskon.Clear;
    ETotal.Clear;
    Exit;
  end;

  // Validasi Quantity
  try
    Qty := StrToFloat(EQTY.Text);
    if (Qty <= 0) or (Qty > 10) then
      raise Exception.Create('Quantity harus di antara 1 dan 10');
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      EQTY.Clear;
      ESubTotal.Clear;
      EDiskon.Clear;
      ETotal.Clear;
      Exit;
    end;
  end;

  // Menghitung Sub Total
  Harga := StrToFloat(EHarga.Text);
  SubTotal := Qty * Harga;
  ESubTotal.Text := FloatToStr(SubTotal);

  // Menghitung Diskon
  if SubTotal >= 100000 then
    Diskon := 0.15
  else if SubTotal >= 50000 then
    Diskon := 0.1
  else if SubTotal >= 25000 then
    Diskon := 0.05
  else
    Diskon := 0;

  // Mengisi Diskon
  EDiskon.Text := FloatToStr(Diskon * 100) + '%';

  // Menghitung Total
  Total := SubTotal * (1 - Diskon);
  ETotal.Text := FloatToStr(Total);
end;

end.


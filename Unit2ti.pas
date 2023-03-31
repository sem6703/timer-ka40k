unit Unit2ti;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Timer1: TTimer;
    Label2: TLabel;
    Panel1: TPanel;
    Button1: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
   
  private
    { Private declarations }
  public
    { Public declarations }
    procedure F(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  end;

var
  Form1: TForm1;
  i: integer=1; // итерации  // Ival: integer;
  MaxIter: integer;
implementation

{$R *.DFM}

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  form1.Visible:=true;
  timer1.Enabled:=false;
end;

procedure TForm1.F(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  form1.visible:=false;
  timer1.enabled:=true;
  inc(i);
  if i>MaxIter then close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  MaxIter:=6;   //timer1.interval:=3000;      // 240000
  combobox1.text:=inttostr(timer1.interval div 60000);
  combobox2.text:=inttostr(MaxIter);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
 label2.caption:=inttostr(i);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  form1.OnMouseDown:=f;
  label1.OnMouseDown:=f;
  label2.OnMouseDown:=f;
  panel1.visible:=false;
  timer1.interval:=strtoint(combobox1.text)*60000;//
  MaxIter:=strtoint(combobox2.text);
end;

end.

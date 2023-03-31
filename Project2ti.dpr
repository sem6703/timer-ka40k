program Project2ti;

uses
  Forms,
  Unit2ti in 'Unit2ti.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

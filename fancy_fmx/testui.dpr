program testui;

uses
  System.StartUpCopy,
  FMX.Forms,
  forms.testui in 'forms.testui.pas' {Form1},
  modules.uihelper in '..\common\modules.uihelper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

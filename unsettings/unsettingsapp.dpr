program unsettingsapp;

uses
  Vcl.Forms,
  forms.unsettingsmain in 'forms.unsettingsmain.pas' {UnsettingsMain},
  Vcl.Themes,
  Vcl.Styles,
  forms.aboutbox in 'forms.aboutbox.pas' {AboutBox};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10');
  Application.CreateForm(TUnsettingsMain, UnsettingsMain);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.

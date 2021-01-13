unit forms.unsettingsmain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Notification, System.ImageList, Vcl.ImgList,
  Vcl.AppEvnts, Vcl.ExtCtrls, htmlhint, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Imaging.pngimage, scStyledForm, scStyleManager, scHint,
  scGPExtControls, scGPControls, scGPImages, scGPFontControls, scControls,
  scModernControls;


{
  Developer: Ian Barker
           https://about.me/IanBarker
           https://www.codedotshow.com/blog

  FOR EDUCATIONAL PURPOSES ONLY
}

type
  TUnsettingsMain = class(TForm)
    ApplicationEvents1: TApplicationEvents;
    scHint1: TscHint;
    NotificationCenter1: TNotificationCenter;
    GridImageList: TImageList;
    scStyleManager1: TscStyleManager;
    scStyledForm1: TscStyledForm;
    BorderPanel: TscGPPanel;
    ClientPanel: TscPanel;
    scGPPanel2: TscGPPanel;
    CloseButton: TscGPGlyphButton;
    MinButton: TscGPGlyphButton;
    CaptionLabel: TscLabel;
    MaxButton: TscGPGlyphButton;
    scGPPanel3: TscGPPanel;
    PageControl: TscPageViewer;
    AboutPage: TscPageViewerPage;
    scLabel28: TscLabel;
    scLabel13: TscLabel;
    scLabel14: TscLabel;
    scButton10: TscButton;
    LocationsPage: TscPageViewerPage;
    ReportsPage: TscPageViewerPage;
    SettingsPage: TscPageViewerPage;
    scLabel3: TscLabel;
    cbTheme: TscGPComboBox;
    WhoIsInPage: TscPageViewerPage;
    PageTitlePanel: TscGPPanel;
    MenuPanel: TscGPPanel;
    ReportsButton: TscGPCharGlyphButton;
    WhoIsInButton: TscGPCharGlyphButton;
    AboutButton: TscGPCharGlyphButton;
    SettingsButton: TscGPCharGlyphButton;
    LocationsButton: TscGPCharGlyphButton;
    scGPLabel1: TscGPLabel;
    scGPCharGlyphButton1: TscGPCharGlyphButton;
    scGPCharGlyphButton2: TscGPCharGlyphButton;
    scGPCharGlyphButton3: TscGPCharGlyphButton;
    scGPEdit1: TscGPEdit;
    scGPPanel1: TscGPPanel;
    scGPPanel4: TscGPPanel;
    scGPPanel5: TscGPPanel;
    scGPImage1: TscGPImage;
    scGPLabel2: TscGPLabel;
    scGPComboBox1: TscGPComboBox;
    scGPLabel3: TscGPLabel;
    scGPPanel6: TscGPPanel;
    scGPLabel4: TscGPLabel;
    scGPPanel7: TscGPPanel;
    scGPComboBox2: TscGPComboBox;
    scGPLabel5: TscGPLabel;
    scGPPanel8: TscGPPanel;
    scGPButton1: TscGPButton;
    scGPImage2: TscGPImage;
    scGPLabel6: TscGPLabel;
    scGPLabel7: TscGPLabel;
    scGPPanel9: TscGPPanel;
    scGPLabel8: TscGPLabel;
    scGPLabel9: TscGPLabel;
    scGPCharGlyphButton4: TscGPCharGlyphButton;
    scGPCharGlyphButton5: TscGPCharGlyphButton;
    scGPLabel11: TscGPLabel;
    scGPLabel12: TscGPLabel;
    procedure CaptionLabelDblClick(Sender: TObject);
    procedure CaptionLabelMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure CaptionLabelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure CaptionLabelMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure CloseButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MaxButtonClick(Sender: TObject);
    procedure MinButtonClick(Sender: TObject);
    procedure scGPButton1Click(Sender: TObject);
    procedure scStyledForm1BeforeChangeScale(Sender: TObject);
    procedure scStyledForm1ChangeActive(Sender: TObject);
    procedure scStyledForm1ChangeScale(AScaleFactor: Double);
    procedure scStyledForm1DWMClientMaximize(Sender: TObject);
    procedure scStyledForm1DWMClientRestore(Sender: TObject);
    procedure LabelsMouseEnter(Sender: TObject);
    procedure LabelsMouseLeave(Sender: TObject);
  end;

var
  UnsettingsMain: TUnsettingsMain;

implementation

{$R *.dfm}

uses forms.aboutbox;

procedure TUnsettingsMain.CaptionLabelDblClick(Sender: TObject);
begin
 if scStyledForm1.IsDWMClientMaximized then
    scStyledForm1.DWMClientRestore
  else
    scStyledForm1.DWMClientMaximize;
end;

procedure TUnsettingsMain.CaptionLabelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and not (ssDouble in Shift) and scStyledForm1.IsDWMClientMaximized then
   scStyledForm1.DWMClientStartDrag;
end;

procedure TUnsettingsMain.CaptionLabelMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if scStyledForm1.IsDWMClientMaximized and scStyledForm1.IsDWMClientDragging then
  begin
    scStyledForm1.DWMClientDrag;
    if not scStyledForm1.IsDWMClientMaximized then
    begin
      MaxButton.GlyphOptions.Kind := scgpbgkMaximize;
    end;
  end;
end;

procedure TUnsettingsMain.CaptionLabelMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  scStyledForm1.DWMClientEndDrag;
end;

procedure TUnsettingsMain.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TUnsettingsMain.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  if not scStyledForm1.IsFluentUIAvailable or (scStyledForm1.FluentUIBackground = scfuibNone) then
  begin
    StyleElements                    := [seClient];
    BorderPanel.FrameWidth           := 1;
    SC_SetDrawTextModeInControl(MenuPanel, scdtmGDI);
    MenuPanel.FillColorAlpha         := 200;
    MenuPanel.TransparentBackground  := False;
    BorderPanel.FillColor            := clDkGray;
    ClientPanel.FluentUIOpaque       := False;
  end;
//  SetAppropriateThemeMode('Tablet Dark', 'Tablet Light');
end;

procedure TUnsettingsMain.LabelsMouseEnter(Sender: TObject);
begin
  (Sender as TscGPLabel).Font.Color := clWebDarkSlategray;
end;

procedure TUnsettingsMain.LabelsMouseLeave(Sender: TObject);
begin
  (Sender as TscGPLabel).Font.Color := clWebFirebrick;
end;

procedure TUnsettingsMain.MaxButtonClick(Sender: TObject);
begin
  if scStyledForm1.IsDWMClientMaximized then
    scStyledForm1.DWMClientRestore
  else
    scStyledForm1.DWMClientMaximize;
end;

procedure TUnsettingsMain.MinButtonClick(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TUnsettingsMain.scGPButton1Click(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TUnsettingsMain.scStyledForm1BeforeChangeScale(Sender: TObject);
begin
  Self.Constraints.MinWidth  := 0;
  Self.Constraints.MinHeight := 0;
end;

procedure TUnsettingsMain.scStyledForm1ChangeActive(Sender: TObject);
begin
  if Active then
    begin
      BorderPanel.FrameColor                    := clRed;
      CaptionLabel.Font.Color                   := clHighlight;
      CloseButton.GlyphOptions.NormalColorAlpha := 255;
      MinButton.GlyphOptions.NormalColorAlpha   := 255;
      MaxButton.GlyphOptions.NormalColorAlpha   := 255;
      MenuPanel.FluentUIOpaque                  := False;
      MenuPanel.FillColor                       := clGray; // clLtGray;
      MenuPanel.FillColorAlpha                  := 120;  // 80
      MenuPanel.FillGradientBeginAlpha          := MenuPanel.FillColorAlpha;
      MenuPanel.FillGradientEndAlpha            := MenuPanel.FillGradientBeginAlpha;
    end
  else
    begin
      BorderPanel.FrameColor                    := clBlack;
      CaptionLabel.Font.Color                   := clGray;
      CloseButton.GlyphOptions.NormalColorAlpha := 150;
      MinButton.GlyphOptions.NormalColorAlpha   := 120;
      MaxButton.GlyphOptions.NormalColorAlpha   := 120;
      MenuPanel.FillColor                       := clWhite;
      MenuPanel.FluentUIOpaque                  := True;
    end;
end;

procedure TUnsettingsMain.scStyledForm1ChangeScale(AScaleFactor: Double);
begin
  Self.Constraints.MinWidth  := scStyledForm1.ScaleInt(700);
  Self.Constraints.MinHeight := scStyledForm1.ScaleInt(400);
end;

procedure TUnsettingsMain.scStyledForm1DWMClientMaximize(Sender: TObject);
begin
  BorderPanel.FrameColor      := clBlack;
  MaxButton.GlyphOptions.Kind := scgpbgkRestore;
  BorderPanel.Sizeable        := False;
end;

procedure TUnsettingsMain.scStyledForm1DWMClientRestore(Sender: TObject);
begin
  BorderPanel.FrameColor      := clHighLight;
  MaxButton.GlyphOptions.Kind := scgpbgkMaximize;
  BorderPanel.Sizeable        := True;
end;

end.

unit forms.testui;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Effects, FMX.MaterialSources, FMX.Menus,
  FMX.StdActns, System.Actions, FMX.ActnList, FMX.Filter.Effects, FMX.Ani,
  FMX.Objects, FMX.Edit, FMX.EditBox, FMX.SpinBox,
  System.ImageList, FMX.ImgList, FMX.Colors;


{
  Developer: Ian Barker
           https://about.me/IanBarker
           https://www.codedotshow.com/blog
}

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    ActionList1: TActionList;
    actMin: TAction;
    actMax: TAction;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    Label1: TLabel;
    RoundRect1: TRoundRect;
    Label2: TLabel;
    FillEffect1: TFillEffect;
    Panel3: TPanel;
    StyleBook1: TStyleBook;
    RoundRect2: TRoundRect;
    Label3: TLabel;
    ShadowEffect2: TShadowEffect;
    RoundRect3: TRoundRect;
    Label4: TLabel;
    ShadowEffect4: TShadowEffect;
    Panel4: TPanel;
    ShadowEffect1: TShadowEffect;
    ShadowEffect5: TShadowEffect;
    Panel5: TPanel;
    ShadowEffect6: TShadowEffect;
    Panel6: TPanel;
    ShadowEffect7: TShadowEffect;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Switch1: TSwitch;
    SwitchLabel: TLabel;
    MainPanel: TPanel;
    SpinBox1: TSpinBox;
    Line1: TLine;
    Line2: TLine;
    Line3: TLine;
    Line4: TLine;
    ImageList1: TImageList;
    actClose: TAction;
    Panel7: TPanel;
    PaperSketchEffect1: TPaperSketchEffect;
    Panel8: TPanel;
    FillEffect2: TFillEffect;
    PaperSketchEffect2: TPaperSketchEffect;
    Label8: TLabel;
    Rectangle1: TRectangle;
    Image1: TImage;
    Rectangle2: TRectangle;
    Image2: TImage;
    Rectangle3: TRectangle;
    Image3: TImage;
    FillRGBEffect1: TFillRGBEffect;
    FillRGBEffect2: TFillRGBEffect;
    FillRGBEffect3: TFillRGBEffect;
    Label9: TLabel;
    Label10: TLabel;
    Image4: TImage;
    ShadowEffect8: TShadowEffect;
    ShadowEffect9: TShadowEffect;
    procedure actMinExecute(Sender: TObject);
    procedure actMaxExecute(Sender: TObject);
    procedure Switch1Switch(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpinBox1Change(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure Panel7MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
  private
    procedure UpdateTransparency;
    procedure SetTransparency(const IsTransparent: Boolean);
    procedure UpdateFocus(const IsFocussed: Boolean);
  end;

var
  Form1: TForm1;

implementation
uses
  System.UIConsts,
  modules.uihelper;

{$R *.fmx}

procedure TForm1.actCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TForm1.actMaxExecute(Sender: TObject);
begin
  if WindowState = TWindowState.wsMaximized then
    WindowState := TWindowState.wsNormal
  else
    WindowState := TWindowState.wsMaximized;
end;

procedure TForm1.actMinExecute(Sender: TObject);
begin
  WindowState := TWindowState.wsMinimized;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  UpdateFocus(True);
end;

procedure TForm1.FormDeactivate(Sender: TObject);
begin
  UpdateFocus(False);
end;

procedure TForm1.Panel7MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  if (Button = TMouseButton.mbLeft) then
    if WindowState <> TWindowState.wsMaximized then
      StartWindowDrag;
end;

procedure TForm1.SetTransparency(const IsTransparent: Boolean);
begin
  Transparency := IsTransparent;
  if IsTransparent then
    begin
      SwitchLabel.TextSettings.HorzAlign := TTextAlign.Leading;
      SwitchLabel.TextSettings.FontColor := claWhite;
    end
  else
    begin
      SwitchLabel.TextSettings.HorzAlign := TTextAlign.Trailing;
      SwitchLabel.TextSettings.FontColor := claBlack;
    end;
end;

procedure TForm1.SpinBox1Change(Sender: TObject);
begin
  if SameText(Spinbox1.Text, '10') then
    Panel1.Opacity := 1
  else
    Panel1.Opacity := StrToFloat('0.' + Spinbox1.Text);
end;

procedure TForm1.Switch1Switch(Sender: TObject);
begin
  UpdateTransparency;
end;

procedure TForm1.UpdateFocus(const IsFocussed: Boolean);
begin
  // if the Window is the active Window and it's not maximized
  // then we draw the border in a
  if IsFocussed and (WindowState <> TWindowState.wsMaximized) then
    begin
      Line1.Stroke.Color := GetAccentColor(claRed);
      FillRGBEffect2.Color := Line1.Stroke.Color;
      FillRGBEffect3.Color := Line1.Stroke.Color;
      UpdateTransparency;
    end
  else
    begin
      Line1.Stroke.Color := claWhite;
      UpdateTransparency;
    end;
  Line2.Stroke.Color := Line1.Stroke.Color;
  Line3.Stroke.Color := Line1.Stroke.Color;
  Line4.Stroke.Color := Line1.Stroke.Color;
end;

procedure TForm1.UpdateTransparency;
begin
  SetTransparency(Switch1.IsChecked = True);
end;

end.

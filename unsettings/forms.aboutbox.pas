unit forms.aboutbox;

interface

uses WinApi.Windows, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Forms, Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  scControls, scGPImages, scStyledForm, System.ImageList, Vcl.ImgList,
  scGPControls;

type
  TAboutBox = class(TForm)
    ProductName: TLabel;
    scGPImage1: TscGPImage;
    Label1: TLabel;
    scStyledForm1: TscStyledForm;
    scGPButton1: TscGPButton;
    scLabel1: TscLabel;
    scGPPanel1: TscGPPanel;
    ImageList1: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.dfm}

end.
 
